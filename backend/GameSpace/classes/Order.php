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
}
?>