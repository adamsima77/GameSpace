<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/GameSpace/classes/Database.php';
class Dashboard extends Database{

    private $conn;
    public function fetchKPIs(){
        try{
            $kpis = [];
            $total_revenue = "SELECT ROUND(SUM(total_price),2) as total_revenue FROM orders WHERE status = 'Doručené';";
            $revenue_this_month = "SELECT ROUND(SUM(total_price),2) as revenue_this_month FROM orders 
            WHERE status = 'Doručené' AND MONTH(creation_date) = MONTH(CURRENT_DATE())
            AND YEAR(creation_date) = YEAR(CURRENT_DATE());";
            $total_orders = "SELECT COUNT(*) as total_orders FROM orders WHERE status = 'Doručené' OR status = 'Odoslané'";
            $avg_order_value = "SELECT ROUND(SUM(total_price) / COUNT(*),2) as avg_order_value FROM orders WHERE status = 'Doručené' OR status = 'Odoslané'";
                
            $conn = $this->connect();
            $stmt = $conn->prepare($total_revenue);
            $stmt->execute();
            $rs = $stmt->fetch();
            $total_revenue = $rs['total_revenue'];

            $stmt = $conn->prepare($revenue_this_month);
            $stmt->execute();
            $rs = $stmt->fetch();
            $revenue_this_month = $rs['revenue_this_month'];

            
            $stmt = $conn->prepare($total_orders);
            $stmt->execute();
            $rs = $stmt->fetch();
            $total_orders = $rs['total_orders'];

            $stmt = $conn->prepare($avg_order_value);
            $stmt->execute();
            $rs = $stmt->fetch();
            $avg_order_value = $rs['avg_order_value'];

             $trendRevenueMonth = $total_revenue > 0 ? round(($revenue_this_month / $total_revenue) * 100, 2) : 0;

              $kpis = [
            [
                'title' => 'Celkový príjem',
                'value' => $total_revenue . '€',
                'trend' => null
            ],
            [
                'title' => 'Príjem tento mesiac',
                'value' => $revenue_this_month . '€',
                'trend' => $trendRevenueMonth
            ],
            [
                'title' => 'Celkový počet objednávok',
                'value' => $total_orders,
                'trend' => null
            ],
            [
                'title' => 'Priemerná hodnota objednávky',
                'value' => $avg_order_value . '€',
                'trend' => null
            ],
        ];

        echo json_encode($kpis);
        $conn = null;
        exit;
        } catch(Exception $e){
            die;
        }
    }

}

?>