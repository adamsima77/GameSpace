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

    }
}