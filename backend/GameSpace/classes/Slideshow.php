<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/GameSpace/classes/Database.php';
class Slideshow extends Database{
    private $conn;

    public function fetchSlides(){
        try{
            $conn = $this->connect();
            $query = "SELECT img,alt,link FROM slideshow ORDER BY last_update DESC;";
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

     public function fetchSlideshowAdmin($limit, $offset){
        try{
             $conn = $this->connect();
             $query = "SELECT * FROM slideshow ORDER BY created_at DESC LIMIT ? OFFSET ?";
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
             $query = "SELECT COUNT(*) as total_pages FROM slideshow";
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