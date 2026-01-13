<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/GameSpace/classes/Database.php';
class Accordion extends Database{
    private $conn;

    public function fetchFAQ(){
        try{
             $conn = $this->connect();
             $query = "SELECT title,description FROM accordion";
             $stmt = $conn->prepare($query);
             $stmt->execute();
             $rs = $stmt->fetchAll();
             $conn = null;
             return $rs;
        } catch(Exception $e){
              $conn = null;
              return [];
        }
    }

     public function fetchFAQAdmin($limit, $offset){
        try{
             $conn = $this->connect();
             $query = "SELECT idAccordion as id, title,description, created_at, last_update FROM accordion ORDER BY created_at DESC LIMIT ? OFFSET ?";
             $stmt = $conn->prepare($query);
             $stmt->bindParam(1, $limit);
             $stmt->bindParam(2, $offset);
             $stmt->execute();
             $rs = $stmt->fetchAll();
             echo json_encode($rs);
             $conn = null;
             exit;
        } catch(Exception $e){
              $conn = null;
              echo json_encode([]);
        }
    }

    public function getTotalPages(){
         try{
             $conn = $this->connect();
             $query = "SELECT COUNT(*) as total_pages FROM accordion";
             $stmt = $conn->prepare($query);
             $stmt->execute();
             $rs = $stmt->fetch();
             $conn = null;
             echo json_encode($rs);
             exit;
        } catch(Exception $e){
              $conn = null;
              echo json_encode([]);
              exit;
        }
    }

    public function deleteRecord($id){
        try{
            $query = "DELETE FROM accordion WHERE idAccordion = ?;";
            $conn = $this->connect();
            $stmt = $conn->prepare($query);
            $stmt->bindParam(1, $id);
            $stmt->execute();
            echo json_encode(['message' => 'success']);
            $conn = null;
            exit;
        } catch(Exception $e){
             echo json_encode(['message' => 'error']);
             $conn = null;
             die;
        }
    }

    public function addRecord($title, $description){
        try{
             $query = "INSERT INTO accordion(title,description) VALUES(?,?);";
             $conn = $this->connect();
             $stmt = $conn->prepare($query);
             $stmt->bindParam(1, $title);
             $stmt->bindParam(2, $description);

             $stmt->execute();
             echo json_encode(['message' => 'success']);
             $conn = null;
             exit;
        } catch(Exception $e){ 
            echo json_encode(['message' => 'error']);
            $conn = null;
            die;
        }
    }

    public function fetchSingle($id){
        try{
             $query = "SELECT title,description FROM accordion WHERE idAccordion = ?;";
             $conn = $this->connect();
             $stmt = $conn->prepare($query);
             $stmt->bindParam(1, $id);
             $stmt->execute();
             $rs = $stmt->fetch();
             echo json_encode($rs);
             $conn = null;
             exit;
        } catch(Exception $e){
            die;
        }
    }

    public function updateAccordion($id, $title, $text){
           try{
               $query = "UPDATE accordion SET title = ?, description = ? WHERE idAccordion = ?;";
               $conn = $this->connect();
               $stmt = $conn->prepare($query);
               $stmt->bindParam(1, $title);
               $stmt->bindParam(2, $text);
               $stmt->bindParam(3, $id);
               $stmt->execute();
               echo json_encode(['message' => 'success']);
               $conn = null;
               exit;
           } catch(Exception $e){
               json_encode(['message' => 'error']);
               die;
           }
    }
}
?>