<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/GameSpace/classes/Database.php';
class Cart extends Database{
    private $cart = [];
    private $conn;
    public function __construct(){
        if(session_status() == PHP_SESSION_NONE) session_start();
        if (isset($_COOKIE['cart'])) {
            $this->cart = json_decode($_COOKIE['cart'], true) ?? [];
        }
    }

    private function updateCartCookie(){
       setcookie('cart', json_encode($this->cart), time() + 60 * 60 * 24 * 30, '/', '', false, true);
    }
    
   public function addToCart($id, $platform){
    try{
        $id = (int)$id;
        $platform = (int)$platform;

       $query = "SELECT i.idItems as id, pi.stock as stock 
          FROM items i
          JOIN platform_has_items pi ON i.idItems = pi.idItems
          WHERE i.idItems = ? AND pi.platform_id = ?";
        $conn = $this->connect();
        $stmt = $conn->prepare($query);
        $stmt->bindValue(1, $id);
        $stmt->bindValue(2, $platform);
        $stmt->execute();
        $rs = $stmt->fetch();
        $conn = null; 
        
        if (!$rs) {
            http_response_code(404);
            echo json_encode([
                "status"=>"error",
                "message"=>"Produkt neexistuje alebo platforma je neplatná"
            ]);
            return;
        }
        
        $found = false;
        foreach($this->cart as &$value){
            if($value['id'] == $rs['id'] && $value['platform'] == $platform){
                if($value['quantity'] < $rs['stock']){
                    $value['quantity'] += 1;
                }
                $found = true;
                break; 
            }
        }

        if(!$found){
            $this->cart[] = ['id' => $rs['id'], 'platform' => $platform, 'quantity' => 1];
        }

        $this->updateCartCookie();

        http_response_code(200);
        echo json_encode([
              "status" => "success",
              "message" => "Produkt bol úspešne pridaný do košíka",
        ]);
    } catch(Exception $e){
        $conn = null;
        http_response_code(500);
        echo json_encode([
            "status" => "error",
            "message" => "Nastala chyba pri pridávaní produktu do košíka: " . $e->getMessage()
        ]);
    }      
}

  public function getCart(){
    if (empty($this->cart)) {
        http_response_code(200);
        echo json_encode([
            'cart' => [],
            'total' => 0
        ]);
        return;
    }

    $cartItems = [];
    $conn = $this->connect();

    try {
        foreach ($this->cart as $item) {
  
            $query = "SELECT idItems AS id, name, price, description, image, alt, slug 
                      FROM items 
                      WHERE idItems = ?";
            $stmt = $conn->prepare($query);
            $stmt->execute([$item['id']]);
            $product = $stmt->fetch();

            if ($product) {
                $product['quantity'] = $item['quantity'];
                $product['platform'] = $item['platform'];

                $queryPlatform = "SELECT name FROM platform WHERE platform_id = ?";
                $stmtPlatform = $conn->prepare($queryPlatform);
                $stmtPlatform->execute([$item['platform']]);
                $platformData = $stmtPlatform->fetch();
                $product['platform_name'] = $platformData['name'] ?? 'Unknown';

                $cartItems[] = $product;
            }
        }

        $total = array_reduce($cartItems, function($sum, $item){
            return $sum + ($item['price'] * $item['quantity']);
        }, 0);

        echo json_encode([
            'cart' => $cartItems,
            'total' => $total
        ]);

    } catch(Exception $e){
        http_response_code(500);
        echo json_encode([
            "status" => "error",
            "message" => "Nastala chyba pri načítaní košíka: " . $e->getMessage()
        ]);
    } finally {
        $conn = null;
    }
}

    public function removeFromCart($id, $platform){    
          $found = false;
          foreach($this->cart as $index => $value){
              if($value['id'] == $id && $value['platform'] == $platform){
                    unset($this->cart[$index]);
                    $found = true;
                    break;
              }
          }
          $this->cart = array_values($this->cart);
          $this->updateCartCookie();
          if($found){
                http_response_code(200);
                echo json_encode([
                 "status" => "success",
                 "message" => "Produkt bol úspešne vymazaný"
             ]);
          } else{
              http_response_code(404);
              echo json_encode([
                 "status" => "error",
                 "message" => "Nastala chyba pri mazaní z košíka"
             ]);
          }
    }

   public function decrementQuantity($id, $platform){
    $found = false;

    foreach($this->cart as $index => $value){
    
        if($value['id'] == $id && $value['platform'] == $platform){
            $found = true;

     
            $this->cart[$index]['quantity'] -= 1;

    
            if($this->cart[$index]['quantity'] <= 0){
                unset($this->cart[$index]);
                $this->cart = array_values($this->cart);
            }

            break;
        }
    }

    if($found){
        $this->updateCartCookie();
        http_response_code(200);
        echo json_encode([
            "status" => "success",
            "message" => "Množstvo bolo znížené"
        ]);
    } else {
        http_response_code(404);
        echo json_encode([
            "status" => "error",
            "message" => "Produkt sa v košíku nenašiel"
        ]);
    }
}
public function addQuantity($id, $platform){
    $found = false;

    foreach($this->cart as $index => $value){
     
        if($value['id'] == $id && $value['platform'] == $platform){
            $found = true;

            try{
                
                $query = "SELECT stock FROM platform_has_items WHERE idItems = ? AND platform_id = ?";
                $conn = $this->connect();
                $stmt = $conn->prepare($query);
                $stmt->bindParam(1, $id);
                $stmt->bindParam(2, $platform);
                $stmt->execute();
                $rs = $stmt->fetch(PDO::FETCH_ASSOC);
                $conn = null;
            } catch(Exception $e){
                http_response_code(500);
                echo json_encode([
                    "status" => "error",
                    "message" => "Nastala chyba pri získaní skladu: " . $e->getMessage()
                ]);
                return;
            }

            $stock = $rs['stock'] ?? 0;

            if($this->cart[$index]['quantity'] < $stock){
                $this->cart[$index]['quantity'] += 1;
                $this->updateCartCookie();
                http_response_code(200);
                echo json_encode([
                    "status" => "success",
                    "message" => "Množstvo bolo zvýšené"
                ]);
            } else {
                http_response_code(400);
                echo json_encode([
                    "status" => "error",
                    "message" => "Nie je dostatočný sklad"
                ]);
            }

            break; 
        }
    }

    if(!$found){
        http_response_code(404);
        echo json_encode([
            "status" => "error",
            "message" => "Produkt sa nenašiel v košíku"
        ]);
    }
}

    public function fetchTransits(){
        try{
            $query = "SELECT idTransport as id, name FROM transport";
            $conn = $this->connect();
            $stmt = $conn->prepare($query);
            $stmt->execute();
            $rs = $stmt->fetchAll();
            echo json_encode($rs);
        } catch(Exception $e){
              die;
        } 
    }

    public function fetchPayments(){
        try{
            $query = "SELECT idPayment as id, name FROM payment";
            $conn = $this->connect();
            $stmt = $conn->prepare($query);
            $stmt->execute();
            $rs = $stmt->fetchAll();
            echo json_encode($rs);
        } catch(Exception $e){
              die;
        } 
    }

    public function fetchSingleTransport($id){
        try{
            $query = "SELECT name FROM transport WHERE idTransport = ?";
            $conn = $this->connect();
            $stmt = $conn->prepare($query);
            $stmt->bindParam(1, $id);
            $stmt->execute();
            $rs = $stmt->fetchAll();
            echo json_encode($rs);
        } catch(Exception $e){
              die;
        } 
    }

     public function fetchSinglePayment($id){
        try{
            $query = "SELECT name FROM payment WHERE idPayment = ?";
            $conn = $this->connect();
            $stmt = $conn->prepare($query);
            $stmt->bindParam(1, $id);
            $stmt->execute();
            $rs = $stmt->fetchAll();
            echo json_encode($rs);
        } catch(Exception $e){
              die;
        } 
    }

    public function placeOrder($name, $surname, $email, $telephone_number, $city, $street, $postal_code, $transport, $payment) {
    $conn = $this->connect();

    try {
        $conn->beginTransaction();

        $stmt = $conn->prepare("INSERT INTO address(city, postal_code, street) VALUES(?, ?, ?)");
        $stmt->execute([$city, $postal_code, $street]);
        $address_id = $conn->lastInsertId();

        $stmt = $conn->prepare("INSERT INTO orderdetail(name, last_name, email, mobile_number, Address_idAddress, Payment_idPayment, Transport_idTransport) VALUES(?,?,?,?,?,?,?)");
        $stmt->execute([$name, $surname, $email, $telephone_number, $address_id, $payment, $transport]);
        $order_detail_id = $conn->lastInsertId();

        $total = 0;
        foreach ($this->cart as $value) {
            $stmt = $conn->prepare("SELECT price FROM items WHERE idItems = ?");
            $stmt->execute([$value['id']]);
            $item = $stmt->fetch();
            $total += ($item['price'] * $value['quantity']);
        }

        $status = "V príprave";
        $logged_user = $_SESSION['user_id'] ?? null;
        $stmt = $conn->prepare("INSERT INTO orders(OrderDetail_idOrderDetail, status, total_price, Users_idUsers) VALUES(?,?,?,?)");
        $stmt->execute([$order_detail_id, $status, $total, $logged_user]);
        $order_id = $conn->lastInsertId();

        foreach ($this->cart as $value) {
            $quantity = $value['quantity'];
            $item_id = $value['id'];
            $platform_id = $value['platform'];

            $stmt = $conn->prepare("INSERT INTO orders_has_items(Orders_idOrders, Items_idItems, quantity, platform_id) VALUES(?,?,?,?)");
            $stmt->execute([$order_id, $item_id, $quantity, $platform_id]);

            $stmt = $conn->prepare("SELECT stock FROM platform_has_items WHERE idItems = ? AND platform_id = ?");
            $stmt->execute([$item_id, $platform_id]);
            $stock = $stmt->fetchColumn();

            $new_stock = max(0, $stock - $quantity);

            $stmt = $conn->prepare("UPDATE platform_has_items SET stock = ? WHERE idItems = ? AND platform_id = ?");
            $stmt->execute([$new_stock, $item_id, $platform_id]);
        }

        $conn->commit();

        $this->cart = [];
        setcookie('cart', '', time() - 3600, '/');

        http_response_code(200);
        echo json_encode([
            "status" => "success",
            "message" => "Objednávka bola úspešne vytvorená"
        ]);

    } catch (Exception $e) {
        $conn->rollBack();
        http_response_code(500);
        echo json_encode([
            "status" => "error",
            "message" => "Nastala chyba pri spracovaní objednávky: " . $e->getMessage()
        ]);
    } finally {
        $conn = null;
    }
}

    public function getOrders($limit, $offset){
        
        $user_id = $_SESSION['user_id'];

        try{ 
            $query = "SELECT o.idOrders as id_Orders,o.creation_date as creation_date,o.status as status,o.total_price as total_price
                      FROM orders o
                      WHERE o.Users_idUsers = ? ORDER BY o.creation_date DESC
                      LIMIT ? OFFSET ?";
            $conn = $this->connect();
            $stmt = $conn->prepare($query);
            $stmt->bindParam(1, $user_id);
            $stmt->bindParam(2, $limit);
            $stmt->bindParam(3, $offset);
            $stmt->execute();
            $rs = $stmt->fetchAll();
            $conn = null;
            echo json_encode($rs);
        } catch(Exception $e){
              $conn = null;
              die;
        }
    }

    public function getTotalPagesOfUserOrders(){
         try{
             $user_id = $_SESSION['user_id'];
             $query = "SELECT COUNT(*) as total_pages FROM orders WHERE Users_idUsers = ?";
             $conn = $this->connect();
             $stmt = $conn->prepare($query);
             $stmt->bindParam(1, $user_id);
             $stmt->execute();
             $rs = $stmt->fetch();
             echo json_encode($rs);
             $conn = null;
             exit;
         } catch(Exception $e){
            die;
         }
    }
}