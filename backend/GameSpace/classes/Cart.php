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
    
    public function addToCart($id){
          try{
              $query = "SELECT idItems as id, stock FROM items WHERE idItems = ?";
              $conn = $this->connect();
              $stmt = $conn->prepare($query);
              $stmt->bindParam(1, $id);
              $stmt->execute();
              $rs = $stmt->fetch();
              $conn = null; 
              
              if (!$rs) {
                  http_response_code(404);
                  echo json_encode(["status"=>"error","message"=>"Produkt neexistuje"]);
                  return;
              }
              
              $found = false;
              foreach($this->cart as &$value){
                      if($value['id'] == $rs['id']){
                           
                            if($value['quantity'] < $rs['stock']){
                               $value['quantity'] += 1;
                            }
                            $found = true;
                            break; 
                      }
              }

              if(!$found){
                 $this->cart[] = ['id' => $rs['id'], 'quantity' => 1];
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
                 "message" => "Nastala chyba pri pridávaní produktu do košíka"
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

    $ids = array_column($this->cart, 'id');
    $placeholders = implode(',', array_fill(0, count($ids), '?'));

    try {
        $query = "SELECT idItems AS id, name, price, description, image, alt, available, slug
                  FROM items
                  WHERE idItems IN ($placeholders)";
        $conn = $this->connect();
        $stmt = $conn->prepare($query);
        $stmt->execute($ids);
        $products = $stmt->fetchAll();

       
        foreach ($products as &$product) {
            foreach ($this->cart as $item) {
                if ($item['id'] == $product['id']) {
                    $product['quantity'] = $item['quantity'];
                    break;
                }
            }
        }

        $total = array_reduce($products, function($sum, $item){
            return $sum + ($item['price'] * $item['quantity']);
        }, 0);

        echo json_encode([
            'cart' => $products,
            'total' => $total
        ]);

    } catch(Exception $e){
        http_response_code(500);
        echo json_encode([
            "status" => "error",
            "message" => "Nastala chyba pri načítaní košíka"
        ]);
    }
}

    public function removeFromCart($id){    
          $found = false;
          foreach($this->cart as $index => $value){
              if($value['id'] === $id){
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

   public function decrementQuantity($id){
    $found = false;

    foreach($this->cart as $index => $value){
        if($value['id'] === $id){
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
public function addQuantity($id){
    $found = false;

    foreach($this->cart as $index => $value){
        if($value['id'] === $id){
            $found = true;

            try{
                $query = "SELECT stock FROM items WHERE idItems = ?";
                $conn = $this->connect();
                $stmt = $conn->prepare($query);
                $stmt->bindParam(1, $id);
                $stmt->execute();
                $rs = $stmt->fetch();
                $conn = null;
            } catch(Exception $e){
                http_response_code(500);
                echo json_encode([
                    "status" => "error",
                    "message" => "Nastala chyba pri získaní skladu"
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

    public function placeOrder($name,$surname,$email,$telephone_number,$city,$street,$postal_code,$transport,$payment){
        $conn = $this->connect();
        try{ 
             $conn->beginTransaction();
             $query = "INSERT INTO address(city,postal_code,street) VALUES(?,?,?);";
             $stmt = $conn->prepare($query);
             $stmt->bindParam(1, $city);
             $stmt->bindParam(2, $postal_code);
             $stmt->bindParam(3, $street);
             $stmt->execute();
             $address_id = $conn->lastInsertId();

             $query = "INSERT INTO orderdetail(name,last_name,email,mobile_number,Address_idAddress, Payment_idPayment, Transport_idTransport) VALUES(?,?,?,?,?,?,?);";
             $stmt = $conn->prepare($query);
             $stmt->bindParam(1, $name);
             $stmt->bindParam(2, $surname);
             $stmt->bindParam(3, $email);
             $stmt->bindParam(4, $telephone_number);
             $stmt->bindParam(5, $address_id);
             $stmt->bindParam(6, $payment);
             $stmt->bindParam(7, $transport);
             $stmt->execute();
              $order_detail_id = $conn->lastInsertId();
             $total = 0;
             foreach($this->cart as $value){
                 $query = "SELECT price FROM items WHERE idItems = ?";
                 $stmt = $conn->prepare($query);
                 $id = $value['id'];
                 $stmt->bindParam(1, $id);
                 $stmt->execute();
                 $rs = $stmt->fetch();
                 $total += $rs['price'] * $value['quantity'];
             }
            

             $status = "V príprave";
             $query = "INSERT INTO `orders` (OrderDetail_idOrderDetail, status, total_price) VALUES (?,?,?)";
             $stmt = $conn->prepare($query);
             $stmt->bindParam(1, $order_detail_id);
             $stmt->bindParam(2, $status);
             $stmt->bindParam(3, $total);
             $stmt->execute();

             $order_id = $conn->lastInsertId();
             foreach($this->cart as $value){
                   $quantity = $value['quantity'];
                   $item_id = $value['id'];
                   $query = "INSERT INTO orders_has_items(Orders_idOrders, Items_idItems, quantity) VALUES(?,?,?);";
                   $stmt = $conn->prepare($query);
                   $stmt->bindParam(1, $order_id);
                   $stmt->bindParam(2, $item_id);
                   $stmt->bindParam(3, $quantity);
                   $stmt->execute();
             }

             foreach($this->cart as $value){
                    $quantity = $value['quantity'];
                    $item_id = $value['id'];
                    $query = "SELECT stock FROM items WHERE idItems = ?;";
                    $stmt = $conn->prepare($query);
                    $stmt->bindParam(1, $item_id);
                    $stmt->execute();
                    $rs = $stmt->fetch();
                
                    $stock_change = $rs['stock'] - $value['quantity'];
                    $available_text = $stock_change <= 0 ? "Nie je na sklade" : "Na sklade";
                    $query_1 = "UPDATE items SET stock = ?, available = ? WHERE idItems = ?";
                    $stmt = $conn->prepare($query_1);
                    $stmt->bindParam(1, $stock_change);
                    $stmt->bindParam(2, $available_text);
                    $stmt->bindParam(3, $item_id);
                    $stmt->execute();
             }

             $conn->commit();
             $this->cart = [];
             setcookie('cart', '', time() - 3600, '/');
        } catch(Exception $e){
               die($e->getMessage());
               $conn->rollback();
               die;
        } finally{
            $conn = null;
        }
    }
}