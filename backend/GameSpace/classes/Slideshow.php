<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/GameSpace/classes/Database.php';
class Slideshow extends Database{
    private $conn;

    public function fetchSlides(){
        try{
            $conn = $this->connect();
            $query = "SELECT img,alt FROM slideshow;";
            $stmt = $conn->prepare($query);
            $stmt->execute();
            $data = $stmt->fetchAll();
            $conn = null;
            return $data;
        } catch(Exception $e){
                $conn = null;
                return [];
        }
    }
}



?>