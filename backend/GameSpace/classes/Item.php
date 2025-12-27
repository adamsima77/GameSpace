<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/GameSpace/classes/Database.php';
class Item extends Database{

    private $conn;
    public function fetchNewestItems(){
        try{
            $conn = $this->connect();
            $query = "SELECT name,price,description,image,available,alt,slug FROM items
            WHERE available = 'Na sklade'
            ORDER BY last_update DESC
            LIMIT 4;";
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
            $query = "SELECT idItems as id,name,price,description,image,alt,available, html_description FROM items WHERE slug = ?";
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
    public function fetchGames($limit, $offset, $filter){
        try{
            $game_category = 1;
            $orderBy = "CASE WHEN available = 'Na sklade' THEN 0 ELSE 1 END";
            if($filter !== NULL){
            switch($filter){
                case 'Newest':
                  $orderBy .= ", idItems DESC";
                break;
                case 'Cheapest':
                  $orderBy .= ", price ASC";
                  break;
                case 'MostExpensive':
                   $orderBy .= ", price DESC";
                  break;
            }
            }
            $query = "SELECT name,price,description,image,available,alt,slug FROM items i JOIN items_has_category ih ON i.idItems = ih.Items_idItems 
            WHERE Category_idCategory = ? 
            ORDER BY $orderBy
            LIMIT ? OFFSET ?";
            $conn = $this->connect();
            $stmt = $conn->prepare($query);
            $stmt->bindParam(1,$game_category);
            $stmt->bindParam(2, $limit, PDO::PARAM_INT);
            $stmt->bindParam(3, $offset, PDO::PARAM_INT);
            $stmt->execute();
            $rs = $stmt->fetchAll();
            $conn = null;
            return $rs;
        } catch(Exception $e){
                $conn = null;
                return [];
        }
    }

    public function fetchLaptopsPcs($limit,$offset,$filter){
        try{
            $laptops_category = 2;
            $orderBy =  "CASE WHEN available = 'Na sklade' THEN 0 ELSE 1 END";
            if($filter !== NULL){
                switch($filter){
                  case 'Newest':
                      $orderBy .= ", idItems DESC";
                      break;
                  case 'Cheapest':
                      $orderBy .= ", price ASC";
                      break;
                  case 'MostExpensive':
                       $orderBy .= ", price DESC";
                       break;
                  }
            }
            $query = "SELECT name,price,description,image,available,alt,slug FROM items i JOIN items_has_category ih ON i.idItems = ih.Items_idItems WHERE ih.Category_idCategory = ? 
            ORDER BY $orderBy
            LIMIT ? OFFSET ?";
            $conn = $this->connect();
            $stmt = $conn->prepare($query);
            $stmt->bindParam(1,$laptops_category);
            $stmt->bindParam(2,$limit, PDO::PARAM_INT);
            $stmt->bindParam(3,$offset, PDO::PARAM_INT);
            $stmt->execute();
            $rs = $stmt->fetchAll();
            $conn = null;
            return $rs;
        } catch(Exception $e){
               $conn = null;
               return [];
        }
    }

    public function fetchAccessories($limit, $offset, $filter){
        try{
             $accessories_id = 3;
             $orderBy =  "CASE WHEN available = 'Na sklade' THEN 0 ELSE 1 END";
             if($filter !== NULL){
                switch($filter){
                  case 'Newest':
                      $orderBy .= ", idItems DESC";
                      break;
                  case 'Cheapest':
                      $orderBy .= ", price ASC";
                      break;
                  case 'MostExpensive':
                       $orderBy .= ", price DESC";
                       break;
                  }
            }
            $query = "SELECT name,price,description,image,available,alt,slug FROM items i JOIN items_has_category ih ON i.idItems = ih.Items_idItems WHERE ih.Category_idCategory = ? 
            ORDER BY $orderBy
            LIMIT ? OFFSET ?";
            $conn = $this->connect();
            $stmt = $conn->prepare($query);
            $stmt->bindParam(1,$accessories_id);
            $stmt->bindParam(2,$limit, PDO::PARAM_INT);
            $stmt->bindParam(3,$offset, PDO::PARAM_INT);
            $stmt->execute();
            $rs = $stmt->fetchAll();
            $conn = null;
            return $rs;
        } catch(Exception $e){
             $conn = null;
             return [];
        }
    }

    public function fetchConsoles($limit, $offset, $filter){
        try{
            $consoles_category = 4;
             $orderBy =  "CASE WHEN available = 'Na sklade' THEN 0 ELSE 1 END";
             if($filter !== NULL){
                switch($filter){
                  case 'Newest':
                      $orderBy .= ", idItems DESC";
                      break;
                  case 'Cheapest':
                      $orderBy .= ", price ASC";
                      break;
                  case 'MostExpensive':
                       $orderBy .= ", price DESC";
                       break;
                  }
            }
            $query = "SELECT name,price,description,image,available,alt,slug FROM items i JOIN items_has_category ih ON i.idItems = ih.Items_idItems WHERE ih.Category_idCategory = ? 
            ORDER BY $orderBy
            LIMIT ? OFFSET ?";
            $conn = $this->connect();
            $stmt = $conn->prepare($query);
            $stmt->bindParam(1,$consoles_category);
            $stmt->bindParam(2,$limit);
            $stmt->bindParam(3,$offset);
            $stmt->execute();
            $rs = $stmt->fetchAll();
            $conn = null;
            return $rs;
        } catch(Exception $e){
                $conn = null;
                return [];
        }
    }

    public function fetchExtras($limit, $offset, $filter){
        try{
            $extras_category = 5;
             $orderBy =  "CASE WHEN available = 'Na sklade' THEN 0 ELSE 1 END";
             if($filter !== NULL){
                switch($filter){
                  case 'Newest':
                      $orderBy .= ", idItems DESC";
                      break;
                  case 'Cheapest':
                      $orderBy .= ", price ASC";
                      break;
                  case 'MostExpensive':
                       $orderBy .= ", price DESC";
                       break;
                  }
            }
            $query = "SELECT name,price,description,image,available,alt,slug FROM items i JOIN items_has_category ih ON i.idItems = ih.Items_idItems WHERE ih.Category_idCategory = ? 
            ORDER BY $orderBy
            LIMIT ? OFFSET ?";
            $conn = $this->connect();
            $stmt = $conn->prepare($query);
            $stmt->bindParam(1,$extras_category);
            $stmt->bindParam(2,$limit);
            $stmt->bindParam(3,$offset);
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

    public function searchItems($value, $filter){
        try{
            $searchValue = "%{$value}%";
              $orderBy =  "CASE WHEN available = 'Na sklade' THEN 0 ELSE 1 END";
             if($filter !== NULL){
                switch($filter){
                  case 'Newest':
                      $orderBy .= ", idItems DESC";
                      break;
                  case 'Cheapest':
                      $orderBy .= ", price ASC";
                      break;
                  case 'MostExpensive':
                       $orderBy .= ", price DESC";
                       break;
                  }
            }
            $query = "SELECT name,price,description,image,available,alt,slug FROM items WHERE name LIKE ? 
                      ORDER BY $orderBy LIMIT 15";
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

    public function fetchHtmlDesc($slug){
        try{
            $conn = $this->connect();
            $query = "SELECT html_description FROM items WHERE slug = ?";
            $stmt = $conn->prepare($query);
            $stmt->bindParam(1, $slug);
            $stmt->execute();
            $rs = $stmt->fetch();
            echo json_encode($rs);
        } catch(Exception $e){
            die;
        } finally {
            $conn = null;
        }
    }

  public function fetchRecommendedProducts($slug) {
    try {
        $conn = $this->connect();
        $getCategoriesQuery = "SELECT i.idItems, ic.Category_idCategory
        FROM items i JOIN items_has_category ic ON i.idItems = ic.Items_idItems
        WHERE i.slug = ?;";

        $stmt = $conn->prepare($getCategoriesQuery);
        $stmt->bindParam(1, $slug);
        $stmt->execute();

        $rows = $stmt->fetchAll();

        if (!$rows) {
            echo json_encode([]);
            return;
        }

        $itemId = $rows[0]['idItems'];
        $categories = array_column($rows, 'Category_idCategory');

        $placeholders = implode(',', array_fill(0, count($categories), '?'));

        $recommendedQuery = "SELECT DISTINCT i.name, i.price, i.description, i.image, i.available, i.alt,i.slug
            FROM items i JOIN items_has_category ic ON i.idItems = ic.Items_idItems
            WHERE ic.Category_idCategory IN ($placeholders) AND i.idItems != ? AND i.available = 'Na sklade' LIMIT 15";

        $stmt = $conn->prepare($recommendedQuery);
        $params = array_merge($categories, [$itemId]);
        $stmt->execute($params);
        echo json_encode($stmt->fetchAll());
    } catch (Exception $e) {
        http_response_code(500);
        echo json_encode(['error' => 'Server error']);
    } finally {
        $conn = null;
    }
}

    public function fetchReviews($slug){
        try{
            $conn = $this->connect();
            $query = "SELECT idItems FROM items WHERE slug = ?";
            $query_1 = "SELECT u.name as name, u.last_name as last_name,
                        r.description as description, r.rating as rating FROM reviews r JOIN users u ON r.user_id = u.idUsers
                        WHERE item_id = ?;";

            $stmt = $conn->prepare($query);
            $stmt->bindParam(1, $slug);
            $stmt->execute();
            $id = $stmt->fetch();

            $id_1 = $id['idItems'];
            $stmt = $conn->prepare($query_1);
            $stmt->bindParam(1, $id_1);
            $stmt->execute();
            $reviews = $stmt->fetchAll();
            echo json_encode($reviews);
        } catch(Exception $e){
            die;
        } finally{
            $conn = null;
        }
    }
}
?>