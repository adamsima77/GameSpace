<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/GameSpace/classes/Database.php';
class Order extends Database{
     private $conn;
     public function __construct(){
        if(session_status() == PHP_SESSION_NONE) session_start();
     }
     public function fetchOrderDetail($id){
        $conn = $this->connect();
        $array = [];
        try{          
            $query = "SELECT o.creation_date, o.status, o.total_price, od.name, od.last_name, od.email, od.mobile_number, a.city,
                      a.postal_code, a.street, t.name AS transport_name, p.name AS payment_name
                     FROM orders o
                     JOIN orderdetail od ON o.OrderDetail_idOrderDetail = od.idOrderDetail
                     LEFT JOIN address a ON od.Address_idAddress = a.idAddress
                     LEFT JOIN payment p ON od.Payment_idPayment = p.idPayment
                     LEFT JOIN transport t ON od.Transport_idTransport = t.idTransport
                     WHERE o.idOrders = ?;";

            $stmt = $conn->prepare($query);
            $stmt->bindParam(1, $id);
            $stmt->execute();
            $rs_order = $stmt->fetch();

            $query = "SELECT i.name,i.price,i.image,i.alt,i.slug, oi.quantity FROM items i JOIN orders_has_items oi ON 
                      i.idItems = oi.Items_idItems WHERE oi.Orders_idOrders = ?;";

            $stmt = $conn->prepare($query);
            $stmt->bindParam(1, $id);
            $stmt->execute();
            $rs_items = $stmt->fetchAll();
            $array = ['order' => $rs_order, 'items' => $rs_items];

            echo json_encode($array);
        } catch(Exception $e){
            $conn = null;
            die;
        } finally{
              $conn = null;
              exit;
        }
     }

      public function fetchOrdersAdmin($limit, $offset){
        try{
             $conn = $this->connect();
             $query = "SELECT idOrders as id, creation_date, last_update, status,total_price FROM orders ORDER BY creation_date DESC LIMIT ? OFFSET ?";
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
             $query = "SELECT COUNT(*) as total_pages FROM orders";
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
        try{
            $query = "DELETE FROM orders WHERE idOrders = ?;";
            $conn = $this->connect();
            $stmt = $conn->prepare($query);
            $stmt->bindParam(1, $id);
            $stmt->execute();
            echo json_encode(['message' => 'success']);
            $conn = null;
            exit;
        } catch(Exception $e){
             echo json_encode(['message' => $e->getMessage()]);
             $conn = null;
             die;
        }
    }

    public function fetchForUpdateAdmin($id){
            try{
             $conn = $this->connect();
             $query = "SELECT idOrders as id, status FROM orders WHERE idOrders = ?;";
             $stmt = $conn->prepare($query);
             $stmt->bindParam(1, $id);
             $stmt->execute();
             $rs = $stmt->fetch();
             echo json_encode($rs);
             $conn = null;
             exit;
        } catch(Exception $e){
              $conn = null;
              echo json_encode([]);
        }
        }

    public function updateOrders($id, $status){
        try{
             $conn = $this->connect();
             $query = "UPDATE orders SET status = ? WHERE idOrders = ?;";
             $stmt = $conn->prepare($query);
             $stmt->bindParam(1, $status);
             $stmt->bindParam(2, $id);
             $stmt->execute();
             echo json_encode(['message' => 'success']);
             $conn = null;
             exit;
        } catch(Exception $e){
              $conn = null;
              echo json_encode(['message' => 'error']);
        }
    }
}
?>