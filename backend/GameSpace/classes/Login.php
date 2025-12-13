<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/GameSpace/classes/Database.php';
class Login extends Database{
    private $conn;

    public function __construct(){
        if(session_status() == PHP_SESSION_NONE){
               session_start();
        }
    }

    public function logUser($email, $password){
           try{
                 $user_id = $this->checkLogin($email, $password);
                 $conn = $this->connect();
                 $query = "SELECT idUsers,name,last_name,email,role_idrole FROM users WHERE idUsers = ?";
                 $stmt = $conn->prepare($query);
                 $stmt->bindParam(1, $user_id);
                 $stmt->execute();
                 $rs = $stmt->fetch();
                 http_response_code(200);
                 echo json_encode([
                         "status" => "success",
                         "message" => "Prihlásenie bolo úspešné",
                         "user_id" => $rs['idUsers'],
                         "name" => $rs['name'],
                         "last_name" => $rs['last_name'],
                         "email" => $rs['email'],
                         "role" => $rs['role_idrole']
                 ]);

                 $_SESSION['user_id'] = $rs['idUsers'];
                 $_SESSION['name'] = $rs['name'];
                 $_SESSION['last_name'] = $rs['last_name'];
                 $_SESSION['email'] = $rs['email'];
                 $_SESSION['role'] = $rs['role_idrole'];

           } catch(Exception $e){
                $status = (int)$e->getCode();
                if ($status < 400 || $status > 599) {
                   $status = 500;
                }
                http_response_code($status);
                echo json_encode([
                    "status" => "error",
                    "message" => $e->getMessage()
                ]);
                exit;
           }
    }

    public function checkIfAdmin($id){
           try{
                $query = "SELECT idUsers FROM users WHERE idUsers = ?";
                $conn = $this->connect();
                $stmt = $conn->prepare($query);
                $stmt->bindParam(1, $id);
                $stmt->execute();
                $rs = $stmt->fetch();
                if($rs){
                      http_response_code(200);
                      echo json_encode([
                        "status" => "success",
                        "message" => "Používateľ je admin"
                      ]);
                } else{
                      http_response_code(403);
                      echo json_encode([
                        "status" => "error",
                        "message" => "Používateľ nie je admin"
                      ]);
                }
           } catch(Exception $e){
                  $status = (int)$e->getCode();
                if ($status < 400 || $status > 599) {
                   $status = 500;
                }
                http_response_code($status);
                echo json_encode([
                    "status" => "error",
                    "message" => $e->getMessage()
                ]);
                exit;
           }
    }

    public function checkIfLogged(){
        if (!isset($_SESSION['user_id']) || !isset($_SESSION['name']) || !isset($_SESSION['last_name']) || 
                   !isset($_SESSION['email']) || !isset($_SESSION['role'])) {
                      http_response_code(401);
                      echo json_encode([
                         "status" => "error",
                         "message" => "Používateľ nie je prihlásený"
                ]);
        } else {
              http_response_code(200);
               echo json_encode([
                         "status" => "success",
                         "message" => "Používateľ je prihlásený"
               ]);
        }
    }
    private function checkLogin($email, $password){
               $conn = $this->connect();
               $query = "SELECT idUsers FROM users WHERE email = ?";
               $stmt = $conn->prepare($query);
               $stmt->bindParam(1, $email);
               $stmt->execute();
               $rs = $stmt->fetch();
               $user_id = 0;
               if(!$rs){
                    $conn = null;
                    throw new Exception("Užívateľ s týmto e-mailom neexistuje",401);
               } else {
                   $user_id = $rs['idUsers'];
                   $query = "SELECT password FROM users WHERE idUsers = ?";
                   $stmt = $conn->prepare($query);
                   $stmt->bindParam(1, $rs['idUsers']);
                   $stmt->execute();
                   $res = $stmt->fetch();
                   $verify = password_verify($password, $res['password']);
                   if(!$verify){
                       $conn = null;
                       throw new Exception("Zadali ste nesprávne heslo", 401);
                   } 
               }
               $conn = null;
               return $user_id;
    }

    private function capitalizeFirst($value){
         return mb_convert_case($value, MB_CASE_TITLE, 'UTF-8');
    } 

    public function registerUser($name, $surname, $email, $password, $repeat_password, $role)
{
    try {

        $this->checkRegister($name, $surname, $email, $password, $repeat_password, $role);
        $name = $this->capitalizeFirst($name);
        $surname = $this->capitalizeFirst($surname);
        $conn = $this->connect();
        $query = "INSERT INTO users(name,last_name,email,password,role_idrole)
                  VALUES(?,?,?,?,?)";

        $hashed_password = password_hash($password, PASSWORD_BCRYPT);
        $role = (int)$role;

        $stmt = $conn->prepare($query);
        $stmt->execute([$name, $surname, $email, $hashed_password, $role]);

        http_response_code(201);
        echo json_encode([
            "status" => "success",
            "message" => "Účet bol úspešne vytvorený"
        ]);
        exit;

    } catch (Exception $e) {

        $status = (int)$e->getCode();
        if ($status < 400 || $status > 599) {
            $status = 500;
        }

        http_response_code($status);
        echo json_encode([
            "status" => "error",
            "message" => $e->getMessage()
        ]);
        exit;
    }
}

    private function checkRegister($name, $surname, $email, $password, $repeat_password, $role)
    {

    $conn = $this->connect();
    $query = "SELECT IdUsers FROM users WHERE email = ?";
    $stmt = $conn->prepare($query);
    $stmt->execute([$email]);
    if ($stmt->fetch()) {
        throw new Exception("Používateľ s týmto e-mailom existuje", 409);
    }

    if (mb_strlen($name, 'UTF-8') < 2) {
        throw new Exception("Zadané meno je krátke", 422);
    }

    if (mb_strlen($surname, 'UTF-8') < 2) {
        throw new Exception("Zadané priezvisko je krátke", 422);
    }

    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        throw new Exception("Formát emailu je neplatný", 422);
    }
    
    if(mb_strlen($password, 'UTF-8') < 8){
          throw new Exception("Zadané heslo je krátke", 422);
    }

    if ($password !== $repeat_password) {
        throw new Exception("Zadané heslá sa nezhodujú", 422);
    }

    if (!in_array($role, ['1', '2'], true)) {
        throw new Exception("INVALID_ROLE", 403);
    }

    $upperCaseLetter = false;
    $number = false;
    for($i = 0; $i < strlen($password); $i++){
          if($password[$i] >= '0' && $password[$i] <= '9'){
              $number = true;
          }

          if($password[$i] >= 'A' && $password[$i] <= 'Z'){
                   $upperCaseLetter = true;
          }
  
          if($upperCaseLetter && $number){
                   break;
          } 
    }

    if(!$number){
        throw new Exception("Heslo musí obsahovať číslo",422);
    }

    if(!$upperCaseLetter){
        throw new Exception("Heslo musí obsahovať veľké písmeno", 422);
    }
}
    public function deleteUser(){

    }

    public function updateUser(){
        
    } 
}


?>