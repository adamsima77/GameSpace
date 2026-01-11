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
        $query = "SELECT idUsers,name,last_name,email,role_idrole,is_deleted FROM users WHERE idUsers = ?";
        $stmt = $conn->prepare($query);
        $stmt->bindParam(1, $user_id, PDO::PARAM_INT);
        $stmt->execute();
        $rs = $stmt->fetch();

        if(!$rs || $rs['is_deleted'] == 1){
            http_response_code(403); 
            echo json_encode([
                "status" => "error",
                "message" => "Tento účet bol vymazaný alebo neexistuje."
            ]);
            exit;
        }

       
        session_regenerate_id(true);
        $_SESSION['user_id'] = $rs['idUsers'];
        $_SESSION['name'] = $rs['name'];
        $_SESSION['last_name'] = $rs['last_name'];
        $_SESSION['email'] = $rs['email'];
        $_SESSION['role'] = $rs['role_idrole'];

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

    public function checkIfAdmin(){
           try{
                if(!isset($_SESSION['user_id'])){
                       http_response_code(401);
                       echo json_encode([
                            "status" => "error",
                            "message" => "Not authenticated"
                       ]);
                       return;
                }  
                $id = $_SESSION['user_id'];

                $query = "SELECT idUsers FROM users u JOIN role r ON u.role_idrole = r.idrole WHERE idUsers = ? AND r.idrole = 2";
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
                      echo json_encode([
                         "status" => "error",
                         "message" => "Používateľ nie je prihlásený"
                ]);
        } else {
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
        if(!isset($_SESSION['user_id'])) return;
        $user_id = $_SESSION['user_id'];
        try{
            $delete = 1;
            $query = "UPDATE users SET is_deleted = ? WHERE idUsers = ?";
            $conn = $this->connect();
            $stmt = $conn->prepare($query);
            $stmt->bindParam(1, $delete);
            $stmt->bindParam(2, $user_id);
            $stmt->execute();
            $conn = null;
            exit;
        } catch(Exception $e){
            die;
        }
    }

    public function updateUser(){
        
    }
public function logout() {

    $_SESSION = [];

    if (ini_get("session.use_cookies")) {
        $params = session_get_cookie_params();
        setcookie(
            session_name(),
            '',
            time() - 42000,
            $params["path"],
            $params["domain"],
            $params["secure"],
            $params["httponly"]
        );
    }

    session_destroy();

    http_response_code(200);
    echo json_encode([
        "status" => "success",
        "message" => "Logged out"
    ]);
    exit;
}

public function userData(){
    try{
        $user_id = $_SESSION['user_id'];
        if(!isset($_SESSION['user_id'])) return;
        $conn = $this->connect();
        $query = "SELECT u.name as name, u.last_name as last_name,
                  u.email as email, u.mobile_number as mobile_number,
                   a.city as city,a.street as street,a.postal_code as postal_code
                   FROM users u LEFT JOIN address a ON u.Address_idAddress = a.idAddress
                   WHERE idUsers = ?;";
        $stmt = $conn->prepare($query);
        $stmt->bindParam(1, $user_id);
        $stmt->execute();
        $rs = $stmt->fetch();
        echo json_encode($rs);
    } catch(Exception $e){
        $conn = null;
        die;
    } finally{
        $conn = null;
        exit;
    }
}

public function saveUserData($name,$surname,$email,$city,$street,$postal_code){
    try{
         $user_id = $_SESSION['user_id'];
         if(!isset($_SESSION['user_id'])) return;
         $userQuery = "UPDATE users SET name = ?, last_name = ?, email = ? WHERE idUsers = ?";
         $addressQuery = "UPDATE address SET city = ?, street = ?, postal_code = ? WHERE idAddress = ?";
         $conn = $this->connect();
         $stmt = $conn->prepare($userQuery);
         $stmt->bindParam(1, $name);
         $stmt->bindParam(2, $surname);
         $stmt->bindParam(3, $email);
         $stmt->bindParam(4, $user_id);
         $stmt->execute();
         
         $query = "SELECT Address_idAddress FROM users WHERE idUsers = ?";
         $stmt = $conn->prepare($query);
         $stmt->bindParam(1, $user_id);
         $stmt->execute();
         $rs = $stmt->fetch();
         $address_id = $rs['Address_idAddress'];
         if(!$address_id){
             $sql = "INSERT INTO address(city,street,postal_code) VALUES(?,?,?);";
             $stmt = $conn->prepare($sql);
             $stmt->bindParam(1, $city);
             $stmt->bindParam(2, $street);
             $stmt->bindParam(3, $postal_code);
             $stmt->execute();
             $address_id = $conn->lastInsertId();
             
             $stmt = $conn->prepare("UPDATE users SET Address_idAddress = ? WHERE idUsers = ?");
             $stmt->bindParam(1, $address_id);
             $stmt->bindParam(2, $user_id);
             $stmt->execute();
         } else{
            $stmt = $conn->prepare($addressQuery);
            $stmt->bindParam(1, $city);
            $stmt->bindParam(2, $street);
            $stmt->bindParam(3, $postal_code);
            $stmt->bindParam(4, $address_id);
            $stmt->execute();
         }
      
    } catch(Exception $e){
        $conn = null;
        die;
    } finally{
           $conn = null;
           exit;
    }
}
}
?>