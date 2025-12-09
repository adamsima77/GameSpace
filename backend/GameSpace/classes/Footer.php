<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/GameSpace/classes/Database.php';
class Footer extends Database{

    private $conn;
    public function fetchSocials(){
        try{
             $conn = $this->connect();
             $query = "SELECT * FROM footer;";
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