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
             $query = "SELECT idAccordion, title,description, created_at, last_update FROM accordion ORDER BY created_at DESC LIMIT ? OFFSET ?";
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
        }
    }
}

?>