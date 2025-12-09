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
}

?>