<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/GameSpace/classes/Database.php';
class Item extends Database{

    private $conn;


     public function __construct(){
        if(session_status() == PHP_SESSION_NONE){
               session_start();
        }
    }

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

    public function saveReview($rating, $text, $slug){
        try{
            if($rating === -1 || empty($text)) return;
            if(!isset($_SESSION['user_id'])) return;
            $query = "SELECT idItems FROM items WHERE slug = ?;";
            $conn = $this->connect();
            $stmt = $conn->prepare($query);
            $stmt->bindParam(1, $slug);
            $stmt->execute();
            $rs = $stmt->fetch();

            $item_id = $rs['idItems'];
            $user_id = $_SESSION['user_id'];
            $query_1 = "UPDATE reviews SET rating = ?, description = ? WHERE item_id = ? AND user_id = ?;";
            $stmt = $conn->prepare($query_1);
            $stmt->bindParam(1, $rating);
            $stmt->bindParam(2, $text);
            $stmt->bindParam(3, $item_id);
            $stmt->bindParam(4, $user_id);
            $stmt->execute();
            echo json_encode(['message' => 'success']);
            $conn = null;
            exit;
        } catch(Exception $e){
             echo json_encode(['message' => 'error']);
             die;
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

    public function addReview($slug, $text, $rating){
           try{
                $query = "SELECT idItems FROM items WHERE slug = ?";
                $conn = $this->connect();
                $stmt = $conn->prepare($query);
                $stmt->bindParam(1, $slug);
                $stmt->execute();
                $item = $stmt->fetch();
                
                $user_id = $_SESSION['user_id'];
                $item_id = $item['idItems'];
                $query_1 = "INSERT INTO reviews(description, rating,user_id,item_id) VALUES(?,?,?,?);";
                $stmt = $conn->prepare($query_1);
                $stmt->bindParam(1, $text);
                $stmt->bindParam(2, $rating);
                $stmt->bindParam(3, $user_id);
                $stmt->bindParam(4, $item_id);
                $stmt->execute();
                $conn = null;
                exit;
           } catch(Exception $e){
               die;
           }
    }

   public function hasUserPostedReview($slug){
    try{

        $current_user_id = $_SESSION['user_id'] ?? null;
        

        if (!$current_user_id) {
            echo json_encode(['hasPosted' => false]);
            return;
        }

        
        $query = "SELECT idItems FROM items WHERE slug = ?;";
        $conn = $this->connect();
        $stmt = $conn->prepare($query);
        $stmt->bindParam(1, $slug);
        $stmt->execute();
        $item = $stmt->fetch();

        if (!$item) {
            echo json_encode(['hasPosted' => false]);
            return;
        }

        $id_item = $item['idItems'];

      
        $query_1 = "SELECT reviews_id FROM reviews WHERE item_id = ? AND user_id = ?;";
        $stmt = $conn->prepare($query_1);
        $stmt->bindParam(1, $id_item);
        $stmt->bindParam(2, $current_user_id);
        $stmt->execute();
        $review = $stmt->fetch();

        if ($review) {
            echo json_encode(['hasPosted' => true]);
        } else {
            echo json_encode(['hasPosted' => false]);
        }
        
    } catch(Exception $e){
        echo json_encode(['hasPosted' => false]);
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

    public function fetchReviews($slug, $limit, $offset){
        try{
            $conn = $this->connect();
            $query = "SELECT idItems FROM items WHERE slug = ?";
            $query_1 = "SELECT u.name as name, u.last_name as last_name,
                        r.description as description, r.rating as rating FROM reviews r JOIN users u ON r.user_id = u.idUsers
                        WHERE item_id = ? LIMIT ? OFFSET ?;";

            $stmt = $conn->prepare($query);
            $stmt->bindParam(1, $slug);
            $stmt->execute();
            $id = $stmt->fetch();

            $id_1 = $id['idItems'];
            $stmt = $conn->prepare($query_1);
            $stmt->bindParam(1, $id_1);
            $stmt->bindParam(2, $limit);
            $stmt->bindParam(3, $offset);
            $stmt->execute();
            $reviews = $stmt->fetchAll();
            echo json_encode($reviews);
        } catch(Exception $e){
            die;
        } finally{
            $conn = null;
        }
    }

    public function getCountOfReviews($slug){
        try{
            $query = "SELECT COUNT(r.reviews_id) as total_reviews FROM items i LEFT JOIN reviews r ON i.idItems = r.item_id WHERE i.slug = ?";
            $conn = $this->connect();
            $stmt = $conn->prepare($query);
            $stmt->bindParam(1, $slug);
            $stmt->execute();
            $rs = $stmt->fetch();
            echo json_encode($rs);
            $conn = null;
            exit;
        } catch(Exception $e){
            die;
        }
    }

    public function fetchPlatforms($slug){
             try{
                  $query = "SELECT p.name as name FROM platform p JOIN platform_has_items pi ON p.platform_id = pi.platform_id JOIN items i ON pi.idItems = i.idItems WHERE i.slug = ?";
                  $conn = $this->connect();
                  $stmt = $conn->prepare($query);
                  $stmt->bindParam(1, $slug);
                  $stmt->execute();
                  $rs = $stmt->fetchAll();
                  echo json_encode($rs);
                  $conn = null;
                  exit;
             } catch(Exception $e){
                die;
             }
    }

    public function deleteUserReview($slug){
        try{
            if(!isset($_SESSION['user_id']))  throw new Exception("Užívateľ nie je prihlásený !");
            $user_id = $_SESSION['user_id'];
            $query_1 = "SELECT idItems FROM items WHERE slug = ?";
            $query = "DELETE FROM reviews WHERE item_id = ? AND user_id = ?;";
            $conn = $this->connect();
            $stmt = $conn->prepare($query_1);
            $stmt->bindParam(1, $slug);
            $stmt->execute();
            $rs = $stmt->fetch();

            if (!$rs) {
                throw new Exception("Položka nebola nájdená !");
            }
            $item_id = $rs['idItems'];
            $stmt = $conn->prepare($query);
            $stmt->bindParam(1, $item_id);
            $stmt->bindParam(2, $user_id);
            $stmt->execute();
            $conn = null;
            return;
        } catch(Exception $e){
              http_response_code(500);
              echo json_encode(['error' => $e->getMessage()]);
              exit;
        }
    }

    public function fetchItemsAdmin($limit, $offset) {
    try {
        $conn = $this->connect();
        $query = "
            SELECT 
                idItems as id, 
                name, 
                price, 
                description, 
                image AS img, 
                available, 
                alt,
                release_date,
                slug,
                stock,
                html_description
            FROM items
            ORDER BY created_at DESC
            LIMIT ? OFFSET ?
        ";

        $stmt = $conn->prepare($query);
        $stmt->bindParam(1, $limit, PDO::PARAM_INT);
        $stmt->bindParam(2, $offset, PDO::PARAM_INT);
        $stmt->execute();

        $items = $stmt->fetchAll(PDO::FETCH_ASSOC);

       
        $platformQuery = "
            SELECT p.name
            FROM platform p
            JOIN platform_has_items pi ON p.platform_id = pi.platform_id
            WHERE pi.idItems = ?
        ";

        
       $categoryQuery = "
    SELECT c.name
    FROM category c
    JOIN items_has_category ih ON c.idCategory = ih.Category_idCategory
    WHERE ih.Items_idItems = ?
";

      
        foreach ($items as &$item) {

           
            $stmt = $conn->prepare($platformQuery);
            $stmt->bindParam(1, $item['idItems'], PDO::PARAM_INT);
            $stmt->execute();
            $item['platforms'] = $stmt->fetchAll(PDO::FETCH_COLUMN);

            
            $stmt = $conn->prepare($categoryQuery);
            $stmt->bindParam(1, $item['idItems'], PDO::PARAM_INT);
            $stmt->execute();
            $item['category'] = $stmt->fetchAll(PDO::FETCH_COLUMN);
        }

        echo json_encode($items);
        $conn = null;
        exit;

    } catch (Exception $e) {
        echo $e->getMessage();
        $conn = null;
        echo json_encode([]);
    }
}

    public function getTotalPagesAdmin(){
         try{
             $conn = $this->connect();
             $query = "SELECT COUNT(*) as total_pages FROM items";
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

    public function deleteRecord($id){
         try {
        $conn = $this->connect();
        $stmt = $conn->prepare(
            "SELECT image FROM items WHERE idItems = ?"
        );
        $stmt->bindParam(1, $id);
        $stmt->execute();
        $rs = $stmt->fetch();

        if ($rs && !empty($rs['image'])) {
            $url = $rs['image'];   
            $relativePath = parse_url($url, PHP_URL_PATH);

           
            $filePath = $_SERVER['DOCUMENT_ROOT'] . $relativePath;
            $realFile = realpath($filePath);

           
            $baseDir = realpath($_SERVER['DOCUMENT_ROOT'] . '/GameSpace/img/user');

          
            if ($realFile !== false && $baseDir !== false &&
                str_starts_with($realFile, $baseDir) && file_exists($realFile)) {
                unlink($realFile);
            }
        }
        $stmt = $conn->prepare(
            "DELETE FROM items WHERE idItems = ?"
        );
        $stmt->bindParam(1, $id);
        $stmt->execute();

        echo json_encode(['message' => 'success']);
        $conn = null;
        exit;

    } catch (Exception $e) {
        echo json_encode(['message' => $e->getMessage()]);
        $conn = null;
        die;
    }
}
}
?>