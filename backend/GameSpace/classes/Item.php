<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/GameSpace/classes/Database.php';
class Item extends Database{

    private $conn;
    public function fetchNewestItems(){
        try{
            $conn = $this->connect();
            $query = "SELECT name,price,description,image,available,alt,slug FROM items ORDER BY last_update LIMIT 4;";
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

    public function fetchMostAnticipatedGames(){
          try{
            $conn = $this->connect();
            $query = "SELECT i.image as image,i.alt as alt, state, i.slug as slug FROM items i JOIN most_anticipated m ON i.idItems = m.id ORDER BY anticipated_rank LIMIT 4";
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

    public function fetchSingleItem($slug){
        try{
            $conn = $this->connect();
            $query = "SELECT name,price,description,image,alt,available FROM items WHERE slug = ?";
            $stmt = $conn->prepare($query);
            $stmt->bindParam(1,$slug);
            $stmt->execute();
            $rs = $stmt->fetch();
            return $rs;
        } catch(Exception $e){
                $conn = null;
                return [];
        }
    }

    public function fetchItemsByCategory($slug){
        try{
            $conn = $this->connect();
            $query = "SELECT name,price,description,image,alt,available,slug 
            FROM items i JOIN items_has_category ih ON i.idItems = ih.Items_idItems JOIN category c ON ih.Category_idCategory = c.idCategory WHERE c.slug = ?";
            $stmt = $conn->prepare($query);
            $stmt->bindParam(1,$slug);
            $stmt->execute();
            $rs = $stmt->fetchAll();
            $conn = null;
            return $rs;
        } catch(Exception $e){
                $conn = null;
                return [];
        }
    }
    public function fetchGames(){
        try{
            $game_category = 1;
            $query = "SELECT name,price,description,image,available,alt,slug FROM items i JOIN items_has_category ih ON i.idItems = ih.Items_idItems WHERE Category_idCategory = ?";
            $conn = $this->connect();
            $stmt = $conn->prepare($query);
            $stmt->bindParam(1,$game_category);
            $stmt->execute();
            $rs = $stmt->fetchAll();
            $conn = null;
            return $rs;
        } catch(Exception $e){
                $conn = null;
                return [];
        }
    }

    public function fetchLaptopsPcs(){
        try{
            $laptops_category = 2;
            $query = "SELECT name,price,description,image,available,alt,slug FROM items i JOIN items_has_category ih ON i.idItems = ih.Items_idItems WHERE ih.Category_idCategory = ?";
            $conn = $this->connect();
            $stmt = $conn->prepare($query);
            $stmt->bindParam(1,$laptops_category);
            $stmt->execute();
            $rs = $stmt->fetchAll();
            $conn = null;
            return $rs;
        } catch(Exception $e){
               $conn = null;
               return [];
        }
    }

    public function fetchAccessories(){
        try{
            $accessories_id = 3;
            $query = "SELECT name,price,description,image,available,alt,slug FROM items i JOIN items_has_category ih ON i.idItems = ih.Items_idItems WHERE ih.Category_idCategory = ?";
            $conn = $this->connect();
            $stmt = $conn->prepare($query);
            $stmt->bindParam(1,$accessories_id);
            $stmt->execute();
            $rs = $stmt->fetchAll();
            $conn = null;
            return $rs;
        } catch(Exception $e){
             $conn = null;
             return [];
        }
    }

    public function fetchConsoles(){
        try{
            $consoles_category = 4;
            $query = "SELECT name,price,description,image,available,alt,slug FROM items i JOIN items_has_category ih ON i.idItems = ih.Items_idItems WHERE ih.Category_idCategory = ?";
            $conn = $this->connect();
            $stmt = $conn->prepare($query);
            $stmt->bindParam(1,$consoles_category);
            $stmt->execute();
            $rs = $stmt->fetchAll();
            $conn = null;
            return $rs;
        } catch(Exception $e){
                $conn = null;
                return [];
        }
    }

    public function fetchExtras(){
        try{
            $extras_category = 5;
            $query = "SELECT name,price,description,image,available,alt,slug FROM items i JOIN items_has_category ih ON i.idItems = ih.Items_idItems WHERE ih.Category_idCategory = ?";
            $conn = $this->connect();
            $stmt = $conn->prepare($query);
            $stmt->bindParam(1,$extras_category);
            $stmt->execute();
            $rs = $stmt->fetchAll();
            $conn = null;
            return $rs;    
        } catch(Exception $e){
               $conn = null;
               return [];
        }
    }

    public function fetchNewestAccessories(){
          try{
            $category = 3;
            $query = "SELECT name,price,description,image,available,alt,slug FROM items i JOIN items_has_category ih ON i.idItems = ih.Items_idItems WHERE ih.Category_idCategory = ? ORDER BY last_update";
            $conn = $this->connect();
            $stmt = $conn->prepare($query);
            $stmt->bindParam(1,$category);
            $stmt->execute();
            $rs = $stmt->fetchAll();
            $conn = null;
            return $rs;    
        } catch(Exception $e){
               $conn = null;
               return [];
        }
    }

    public function searchItems($value){
        try{
            $searchValue = "%{$value}%";
            $query = "SELECT name,price,description,image,available,alt,slug FROM items WHERE name LIKE ?";
            $conn = $this->connect();
            $stmt = $conn->prepare($query);
            $stmt->bindParam(1,$searchValue);
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