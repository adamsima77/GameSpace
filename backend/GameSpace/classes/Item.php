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
            $query = "SELECT name,price,description,image,alt,slug FROM items
            WHERE is_deleted = 0
            ORDER BY created_at DESC
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
            $query = "SELECT i.image as image,i.alt as alt, state, i.slug as slug FROM items i JOIN most_anticipated m ON i.idItems = m.id WHERE is_deleted = 0 ORDER BY anticipated_rank LIMIT 4";
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
            $query = "SELECT idItems as id,name,price,description,image,alt, html_description FROM items WHERE slug = ?";
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
            $query = "SELECT name,price,description,image,alt,slug 
            FROM items i JOIN items_has_category ih ON i.idItems = ih.Items_idItems JOIN category c ON ih.Category_idCategory = c.idCategory WHERE c.slug = ? AND i.is_deleted = 0";
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
        $orderBy = "i.idItems DESC";

        if($filter !== NULL){
            switch($filter){
                case 'Newest':
                    $orderBy = "i.idItems DESC";
                    break;
                case 'Cheapest':
                    $orderBy = "i.price ASC";
                    break;
                case 'MostExpensive':
                    $orderBy = "i.price DESC";
                    break;
            }
        }

        $query = "SELECT i.name, i.price, i.description, i.image, i.alt, i.slug
                  FROM items i
                  JOIN items_has_category ih ON i.idItems = ih.Items_idItems
                  WHERE ih.Category_idCategory = ? AND i.is_deleted = 0
                  ORDER BY $orderBy
                  LIMIT ? OFFSET ?";

        $conn = $this->connect();
        $stmt = $conn->prepare($query);
        $stmt->bindValue(1, $game_category, PDO::PARAM_INT);
        $stmt->bindValue(2, $limit, PDO::PARAM_INT);
        $stmt->bindValue(3, $offset, PDO::PARAM_INT);
        $stmt->execute();
        $rs = $stmt->fetchAll(PDO::FETCH_ASSOC);
        $conn = null;
        return $rs;
    } catch(Exception $e){
        $conn = null;
        return [];
    }
}

   

   public function fetchLaptopsPcs($limit, $offset, $filter){
    try{
        $laptops_category = 2;
        $orderBy = "i.idItems DESC"; 

        if($filter !== NULL){
            switch($filter){
                case 'Newest':
                    $orderBy = "i.idItems DESC";
                    break;
                case 'Cheapest':
                    $orderBy = "i.price ASC";
                    break;
                case 'MostExpensive':
                    $orderBy = "i.price DESC";
                    break;
            }
        }

        $query = "SELECT i.name, i.price, i.description, i.image, i.alt, i.slug
                  FROM items i
                  JOIN items_has_category ih ON i.idItems = ih.Items_idItems
                  WHERE ih.Category_idCategory = ? AND i.is_deleted = 0
                  ORDER BY $orderBy
                  LIMIT ? OFFSET ?";

        $conn = $this->connect();
        $stmt = $conn->prepare($query);
        $stmt->bindValue(1, $laptops_category, PDO::PARAM_INT);
        $stmt->bindValue(2, $limit, PDO::PARAM_INT);
        $stmt->bindValue(3, $offset, PDO::PARAM_INT);
        $stmt->execute();
        $rs = $stmt->fetchAll(PDO::FETCH_ASSOC);
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
        $orderBy = "i.idItems DESC"; 

        if($filter !== NULL){
            switch($filter){
                case 'Newest':
                    $orderBy = "i.idItems DESC";
                    break;
                case 'Cheapest':
                    $orderBy = "i.price ASC";
                    break;
                case 'MostExpensive':
                    $orderBy = "i.price DESC";
                    break;
            }
        }

        $query = "SELECT i.name, i.price, i.description, i.image, i.alt, i.slug
                  FROM items i
                  JOIN items_has_category ih ON i.idItems = ih.Items_idItems
                  WHERE ih.Category_idCategory = ? AND i.is_deleted = 0
                  ORDER BY $orderBy
                  LIMIT ? OFFSET ?";

        $conn = $this->connect();
        $stmt = $conn->prepare($query);
        $stmt->bindValue(1, $accessories_id, PDO::PARAM_INT);
        $stmt->bindValue(2, $limit, PDO::PARAM_INT);
        $stmt->bindValue(3, $offset, PDO::PARAM_INT);
        $stmt->execute();
        $rs = $stmt->fetchAll(PDO::FETCH_ASSOC);
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
        $orderBy = "i.idItems";

        if($filter !== NULL){
            switch($filter){
                case 'Newest':
                    $orderBy = "i.idItems DESC";
                    break;
                case 'Cheapest':
                    $orderBy = "i.price ASC";
                    break;
                case 'MostExpensive':
                    $orderBy = "i.price DESC";
                    break;
            }
        }

        $query = "SELECT i.name, i.price, i.description, i.image, i.alt, i.slug
                  FROM items i
                  JOIN items_has_category ih ON i.idItems = ih.Items_idItems
                  WHERE ih.Category_idCategory = ? AND i.is_deleted = 0
                  ORDER BY $orderBy
                  LIMIT ? OFFSET ?";

        $conn = $this->connect();
        $stmt = $conn->prepare($query);
        $stmt->bindValue(1, $consoles_category, PDO::PARAM_INT);
        $stmt->bindValue(2, $limit, PDO::PARAM_INT);
        $stmt->bindValue(3, $offset, PDO::PARAM_INT);
        $stmt->execute();
        $rs = $stmt->fetchAll(PDO::FETCH_ASSOC);
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
        $orderBy = "i.idItems DESC";

        if($filter !== NULL){
            switch($filter){
                case 'Newest':
                    $orderBy = "i.idItems DESC";
                    break;
                case 'Cheapest':
                    $orderBy = "i.price ASC";
                    break;
                case 'MostExpensive':
                    $orderBy = "i.price DESC";
                    break;
            }
        }

        $query = "SELECT i.name, i.price, i.description, i.image, i.alt, i.slug
                  FROM items i
                  JOIN items_has_category ih ON i.idItems = ih.Items_idItems
                  WHERE ih.Category_idCategory = ? AND i.is_deleted = 0
                  ORDER BY $orderBy
                  LIMIT ? OFFSET ?";

        $conn = $this->connect();
        $stmt = $conn->prepare($query);
        $stmt->bindValue(1, $extras_category, PDO::PARAM_INT);
        $stmt->bindValue(2, $limit, PDO::PARAM_INT);
        $stmt->bindValue(3, $offset, PDO::PARAM_INT);
        $stmt->execute();
        $rs = $stmt->fetchAll(PDO::FETCH_ASSOC);
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
            $query = "SELECT name,price,description,image,alt,slug FROM items i JOIN items_has_category ih ON i.idItems = ih.Items_idItems WHERE ih.Category_idCategory = ? AND is_deleted = 0 ORDER BY last_update LIMIT 4;";
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
        $orderBy = "idItems DESC"; 

        if($filter !== NULL){
            switch($filter){
                case 'Newest':
                    $orderBy = "idItems DESC";
                    break;
                case 'Cheapest':
                    $orderBy = "price ASC";
                    break;
                case 'MostExpensive':
                    $orderBy = "price DESC";
                    break;
            }
        }

        $query = "SELECT name, price, description, image, alt, slug 
                  FROM items 
                  WHERE name LIKE ? AND is_deleted = 0
                  ORDER BY $orderBy 
                  LIMIT 15";

        $conn = $this->connect();
        $stmt = $conn->prepare($query);
        $stmt->bindParam(1, $searchValue);
        $stmt->execute();
        $rs = $stmt->fetchAll(PDO::FETCH_ASSOC);
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
                               FROM items i 
                               JOIN items_has_category ic ON i.idItems = ic.Items_idItems
                               WHERE i.slug = ? AND i.is_deleted = 0";
        $stmt = $conn->prepare($getCategoriesQuery);
        $stmt->bindParam(1, $slug);
        $stmt->execute();

        $rows = $stmt->fetchAll();
        if (!$rows) return []; 

        $itemId = $rows[0]['idItems'];
        $categories = array_column($rows, 'Category_idCategory');
        if (empty($categories)) return []; 

        $placeholders = implode(',', array_fill(0, count($categories), '?'));

      $recommendedQuery = "
    SELECT i.idItems, i.name, i.price, i.description, i.image, i.alt, i.slug
    FROM items i
    JOIN items_has_category ic ON i.idItems = ic.Items_idItems
    WHERE ic.Category_idCategory IN ($placeholders)
      AND i.idItems != ?
      AND i.is_deleted = 0
    GROUP BY i.idItems
    LIMIT 15
";

        $stmt = $conn->prepare($recommendedQuery);
        $stmt->execute(array_merge($categories, [$itemId]));

        echo json_encode($stmt->fetchAll());

    } catch (Exception $e) {
        echo json_encode([]);
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
                  $query = "SELECT p.platform_id, p.name as name , pi.stock as stock FROM platform p JOIN platform_has_items pi ON p.platform_id = pi.platform_id JOIN items i ON pi.idItems = i.idItems WHERE i.slug = ?";
                  $conn = $this->connect();
                  $stmt = $conn->prepare($query);
                  $stmt->bindParam(1, $slug);
                  $stmt->execute();
                  $rs = $stmt->fetchAll();
                  echo json_encode($rs);
                  $conn = null;
                  exit;
             } catch(Exception $e){
                   echo json_encode(['message' => $e->getMessage()]);
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
                alt,
                release_date,
                slug,
                html_description
            FROM items
            WHERE is_deleted = 0
            ORDER BY created_at DESC
            LIMIT ? OFFSET ?
        ";

        $stmt = $conn->prepare($query);
        $stmt->bindParam(1, $limit);
        $stmt->bindParam(2, $offset);
        $stmt->execute();

        $items = $stmt->fetchAll();



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
             $query = "SELECT COUNT(*) as total_pages FROM items WHERE is_deleted = 0;";
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
        $conn->beginTransaction();
        $stmt = $conn->prepare(
            "UPDATE items SET is_deleted = 1 WHERE idItems = ?;"
        );
        $stmt->bindParam(1, $id);
        $stmt->execute();

        echo json_encode(['message' => 'success']);
        $conn->commit();
        $conn = null;
        exit;

    } catch (Exception $e) {
        echo json_encode(['message' => $e->getMessage()]);
        $conn->rollback();
        $conn = null;
        die;
    }
}
   public function fetchActual($id){
       try{
           $sql = "SELECT idItems as id, i.name as name, price, description, image, alt, release_date, html_description, c.idCategory as main_category 
           FROM items i JOIN items_has_category ic ON i.idItems = ic.Items_idItems JOIN category c ON ic.Category_idCategory = c.idCategory
            WHERE i.idItems = ? AND ic.Items_idItems = ? AND c.parent_id IS NULL;";
           $conn = $this->connect();
           $stmt = $conn->prepare($sql);
           $stmt->bindParam(1, $id);
           $stmt->bindParam(2, $id);
           $stmt->execute();
           $rs = $stmt->fetch();

           $sql_1 = "SELECT p.platform_id as platform_id, p.name as name FROM platform p JOIN platform_has_items pi ON p.platform_id = pi.platform_id WHERE pi.idItems = ?;";
           $stmt = $conn->prepare($sql_1);
           $stmt->bindParam(1, $id);
           $stmt->execute();
           $platforms = $stmt->fetchAll();

           $sql_2 = "SELECT c.idCategory as idCategory, c.name as name FROM category c JOIN items_has_category ic ON c.idCategory = ic.Category_idCategory WHERE ic.Items_idItems = ? AND c.parent_id IS NOT NULL;";
           $stmt = $conn->prepare($sql_2);
           $stmt->bindParam(1, $id);
           $stmt->execute();
           $subcategories = $stmt->fetchAll();

           $sql_3 = "SELECT * FROM platform;";
           $stmt = $conn->prepare($sql_3);
           $stmt->execute();
           $all_platforms = $stmt->fetchAll();

           $sql_4 = "SELECT * FROM category WHERE parent_id IS NULL;";
           $stmt = $conn->prepare($sql_4);
           $stmt->execute();
           $all_categories = $stmt->fetchAll();

           $cat = $rs['main_category'];
           $sql_5 = "SELECT * FROM category c WHERE parent_id IS NOT NULL AND c.parent_id = ?;";
           $stmt = $conn->prepare($sql_5);
           $stmt->bindParam(1, $cat);
           $stmt->execute();
           $all_subcategories = $stmt->fetchAll();


           $result = [
              'item' => $rs,
              'platforms' => $platforms,
              'subcategories' => $subcategories,
              'all_main_categories' =>  $all_categories,
              'all_platforms' =>  $all_platforms,
              'all_subcategories' => $all_subcategories
           ];
           echo json_encode($result);
           $conn = null;
           exit;
        } catch(Exception $e){
           die;
       }
   }

    private function createSlug($name){
         $arr = explode(" ",$name);
             $slug = "";
             if(count($arr) > 1){
                for($i = 0; $i < count($arr); $i++){
                    if($i + 1 === count($arr)){
                        $slug .= strtolower(trim($arr[$i]));
                    } else{
                        $slug .= strtolower(trim($arr[$i])) . "-";
                    }
                }
             } else {
                $slug = strtolower(trim($arr[0]));
             }
             return $slug;
    }
   

    public function checkUpdate() {
    if (!isset($_POST['id']) || !isset($_POST['name']) || !isset($_POST['price'])
        || !isset($_POST['description']) || !isset($_POST['alt'])
        || !isset($_POST['html_desc']) || !isset($_POST['release_date']) || empty($_POST['platforms'])
        || empty($_POST['subcategories']) || !isset($_POST['main_category'])  || !is_array($_POST['platforms']) 
         || !is_array($_POST['subcategories'])) {
        echo json_encode(['message' => 'Nevyplnené polia']);
        exit;
    }

    $id = $_POST['id'];
    $name = $_POST['name'];
    $price = $_POST['price'];
    $description = $_POST['description'];
    $alt = $_POST['alt'];
    $html_desc = $_POST['html_desc'];
    $release_date = $_POST['release_date'];
    $platforms = $_POST['platforms'];
    $subcategories = $_POST['subcategories'];
    $main_category = $_POST['main_category'];

    $slug = $this->createSlug($name);

   if (!is_numeric($price)) {
    echo json_encode(['message' => 'Zlý input !']);
    exit;
   } 
   $price = (float)$price; 

    $fileName = null;

    if (isset($_FILES['img']) && $_FILES['img']['error'] === 0) {
        $file = $_FILES['img'];
        $allowedExtensions = ['jpg', 'jpeg', 'png', 'webp'];
        $maxFileSize = 5 * 1024 * 1024; // 5MB
        $originalName = $file['name'];
        $fileSize = $file['size'];
        $fileTmpPath = $file['tmp_name'];
        $extension = strtolower(pathinfo($originalName, PATHINFO_EXTENSION));

        if (!in_array($extension, $allowedExtensions)) {
            echo json_encode(['message' => 'Zlá prípona. Povolené: jpg, jpeg, png, webp']);
            exit;
        }

        if ($fileSize > $maxFileSize) {
            echo json_encode(['message' => 'Maximálna veľkosť súboru je 5MB']);
            exit;
        }

        $uploadDir = $_SERVER['DOCUMENT_ROOT'] . '/GameSpace/img/user/';
        $uniqueName = uniqid('slideshow_') . '.' . $extension;
        $destPath = $uploadDir . $uniqueName;

        if (!move_uploaded_file($fileTmpPath, $destPath)) {
            echo json_encode(['message' => 'error', 'reason' => 'Nepodarilo sa uložiť súbor']);
            exit;
        }

        //Delete old image
        try{
             $query = "SELECT image FROM items WHERE idItems = ?";
             $conn = $this->connect();
             $stmt = $conn->prepare($query);
             $stmt->bindParam(1, $id);
             $stmt->execute();
             $rs = $stmt->fetch();

             if ($rs && $rs['image']) {
                   $filePath = $_SERVER['DOCUMENT_ROOT'] . parse_url($rs['image'], PHP_URL_PATH);
                  if (file_exists($filePath)) {
                      unlink($filePath);
                  }
             }
            
        } catch(Exception $e){
             if ($fileName && file_exists($destPath)) {
              unlink($destPath);
            }
            die;
        }

        $fileName = "http://localhost/GameSpace/img/user/" . $uniqueName;
    }
    $this->updateRecord($id, $name, $price, $description, $alt, $html_desc, $release_date, $platforms,
                        $subcategories, $main_category, $slug,$fileName);
}

    public function updateRecord($id,$name, $price, $description, $alt, $html_desc, $release_date, $platforms,
                        $subcategories, $main_category, $slug, $fileName = null){
        try{ 
             $conn = $this->connect();
             $conn->beginTransaction();
             if($fileName){
            $query = "UPDATE items SET name = ?, price = ?, description = ?, image = ?, alt = ?, release_date = ?,
                             slug = ?, html_description = ? WHERE idItems = ?;";
             $stmt = $conn->prepare($query);
             $stmt->bindParam(1, $name);
             $stmt->bindParam(2, $price);
             $stmt->bindParam(3, $description);
             $stmt->bindParam(4, $fileName);
             $stmt->bindParam(5, $alt);
             $stmt->bindParam(6, $release_date);
             $stmt->bindParam(7, $slug);
             $stmt->bindParam(8, $html_desc);
             $stmt->bindParam(9, $id);
             $stmt->execute();
             } else {
             $query = "UPDATE items SET name = ?, price = ?, description = ?, alt = ?, release_date = ?,
                       html_description = ?, slug = ? WHERE idItems = ?;";
             $stmt = $conn->prepare($query);
             $stmt->bindParam(1, $name);
             $stmt->bindParam(2, $price);
             $stmt->bindParam(3, $description);
             $stmt->bindParam(4, $alt);
             $stmt->bindParam(5, $release_date);
             $stmt->bindParam(6, $html_desc);
             $stmt->bindParam(7, $slug);
             $stmt->bindParam(8, $id);
             $stmt->execute();
             }

             $query = "DELETE FROM platform_has_items WHERE idItems = ?;";
             $stmt = $conn->prepare($query);
             $stmt->bindParam(1, $id);
             $stmt->execute();

             $query = "DELETE FROM items_has_category WHERE Items_idItems = ?;";
             $stmt = $conn->prepare($query);
             $stmt->bindParam(1, $id);
             $stmt->execute();

             $query = "INSERT INTO platform_has_items(platform_id, idItems, stock) VALUES(?,?, 10);";
             $stmt = $conn->prepare($query);
             foreach($platforms as $platform_id){
                $stmt->execute([$platform_id, $id]);
             }

            $query = "INSERT INTO items_has_category(Items_idItems, Category_idCategory) VALUES(?,?);";
            $stmt = $conn->prepare($query);
            $stmt->bindParam(1, $id);
            $stmt->bindParam(2, $main_category);
            $stmt->execute();

             $query = "INSERT INTO items_has_category(Items_idItems, Category_idCategory) VALUES(?,?);";
             $stmt = $conn->prepare($query);
             foreach($subcategories as $subcategory){
                $stmt->execute([$id, $subcategory]);
             }
            
            $conn->commit();
        
             echo json_encode(['message' => 'success']);
             $conn = null;
             exit;
        } catch(Exception $e){
            $conn->rollBack();
            echo json_encode(['message' => 'Nastala chyba']);
            die;
        }
    }

   public function fetchForAdd(){
    try{
        $conn = $this->connect();
      
        $sql_1 = "SELECT * FROM platform";
        $stmt = $conn->prepare($sql_1);
        $stmt->execute();
        $all_platforms = $stmt->fetchAll();

        
        $sql_2 = "SELECT * FROM category WHERE parent_id IS NULL";
        $stmt = $conn->prepare($sql_2);
        $stmt->execute();
        $all_categories = $stmt->fetchAll();
      

        
        $result = [
            'all_main_categories' => $all_categories,
            'all_platforms' => $all_platforms
        ];

        echo json_encode($result);
        $conn = null;
        exit;

    } catch(Exception $e){
        die;
    }
}

    public function fetchSubcategoryBasedOnParent($category){
         try{
        $conn = $this->connect();
      
        $sql_1 = "SELECT * FROM category WHERE parent_id = ?";
        $stmt = $conn->prepare($sql_1);
        $stmt->bindParam(1, $category);
        $stmt->execute();
        $subcategories = $stmt->fetchAll();

        echo json_encode($subcategories);
        $conn = null;
        exit;

    } catch(Exception $e){
        die;
    }
} 

    public function checkAdd() {
    if (!isset($_POST['name']) || !isset($_POST['price'])
        || !isset($_POST['description']) || !isset($_POST['alt'])
        || !isset($_POST['html_desc']) || !isset($_POST['release_date']) || empty($_POST['platforms'])
        || empty($_POST['subcategories']) || !isset($_POST['main_category'])  || !is_array($_POST['platforms']) 
         || !is_array($_POST['subcategories'])) {
        echo json_encode(['message' => 'Nevyplnené polia']);
        exit;
    }

    $name = $_POST['name'];
    $price = $_POST['price'];
    $description = $_POST['description'];
    $alt = $_POST['alt'];
    $html_desc = $_POST['html_desc'];
    $release_date = $_POST['release_date'];
    $platforms = $_POST['platforms'];
    $subcategories = $_POST['subcategories'];
    $main_category = $_POST['main_category'];

    $slug = $this->createSlug($name);

    if (!is_numeric($price)) {
        echo json_encode(['message' => 'Zadaná cena alebo počet kusov nie je číslo']);
        exit;
    } 
    $price = (float)$price; 

    $fileName = null;

    if(!isset($_FILES['img']) || $_FILES['img']['error'] !== 0){
        echo json_encode(['message' => 'Nebola nahraná fotka']);
        die;
    }

    if (isset($_FILES['img']) && $_FILES['img']['error'] === 0) {
        $file = $_FILES['img'];
        $allowedExtensions = ['jpg', 'jpeg', 'png', 'webp'];
        $maxFileSize = 5 * 1024 * 1024; // 5MB
        $originalName = $file['name'];
        $fileSize = $file['size'];
        $fileTmpPath = $file['tmp_name'];
        $extension = strtolower(pathinfo($originalName, PATHINFO_EXTENSION));

        if (!in_array($extension, $allowedExtensions)) {
            echo json_encode(['message' => 'Nepovolená prípona súboru. Povolené: jpg, jpeg, png, webp']);
            exit;
        }

        if ($fileSize > $maxFileSize) {
            echo json_encode(['message' => 'Súbor je príliš veľký. Max 5MB']);
            exit;
        }

        $uploadDir = $_SERVER['DOCUMENT_ROOT'] . '/GameSpace/img/user/';
        $uniqueName = uniqid('product_') . '.' . $extension;
        $destPath = $uploadDir . $uniqueName;

        if (!move_uploaded_file($fileTmpPath, $destPath)) {
            echo json_encode(['message' => 'Nepodarilo sa uložiť súbor']);
            exit;
        }

        $fileName = "http://localhost/GameSpace/img/user/" . $uniqueName;
    }

    $this->addRecord($name, $price, $description, $alt, $html_desc, $release_date, $platforms,
                        $subcategories, $main_category, $slug,$fileName);
}

    public function addRecord($name, $price, $description, $alt, $html_desc, $release_date, $platforms,
                        $subcategories, $main_category, $slug, $fileName){
        try{ 
             $conn = $this->connect();
             $conn->beginTransaction();
            
            $query = "INSERT INTO items(name,price,description,image,alt,release_date,slug,html_description)
                      VALUES(?,?,?,?,?,?,?,?);";
             $stmt = $conn->prepare($query);
             $stmt->bindParam(1, $name);
             $stmt->bindParam(2, $price);
             $stmt->bindParam(3, $description);
             $stmt->bindParam(4, $fileName);
             $stmt->bindParam(5, $alt);
             $stmt->bindParam(6, $release_date);
             $stmt->bindParam(7, $slug);
             $stmt->bindParam(8, $html_desc);
             $stmt->execute();

             $id = $conn->lastInsertId();
     
          
             $query = "INSERT INTO platform_has_items(platform_id, idItems, stock) VALUES(?,?, 10);";
             foreach($platforms as $platform_id){
                $stmt = $conn->prepare($query);
                $stmt->execute([$platform_id, $id]);
             }

            $query = "INSERT INTO items_has_category(Items_idItems, Category_idCategory) VALUES(?,?);";
            $stmt = $conn->prepare($query);
            $stmt->bindParam(1, $id);
            $stmt->bindParam(2, $main_category);
            $stmt->execute();

             $query = "INSERT INTO items_has_category(Items_idItems, Category_idCategory) VALUES(?,?);";
             foreach($subcategories as $subcategory){
                $stmt = $conn->prepare($query);
                $stmt->execute([$id, $subcategory]);
             }
            
            $conn->commit();
        
             echo json_encode(['message' => 'success']);
             $conn = null;
             exit;
        } catch(Exception $e){
            $conn->rollBack();
            echo json_encode(['message' => $e->getMessage()]);
            die;
        }
    }

}
?>