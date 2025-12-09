<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/GameSpace/classes/Database.php';
class Category extends Database{

    private $conn;
    public function fetchMainCategories(){
        try{
             $conn = $this->connect();
             $query = "SELECT * FROM category WHERE parent_id IS NULL;";
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