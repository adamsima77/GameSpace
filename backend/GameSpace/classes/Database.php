<?php
class Database{
    private $host = "localhost";
    private $db   = "gamespace";
    private $user = "root";
    private $pass = "";
    private $conn;

  public function connect() {
        if ($this->conn) {
            return $this->conn; 
        }

        try {
            $options = [
                PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION, 
                PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,      
                PDO::ATTR_EMULATE_PREPARES   => false,                  
                PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8mb4"    
            ];

            $dsn = "mysql:host={$this->host};dbname={$this->db};charset=utf8mb4";

            $this->conn = new PDO($dsn, $this->user, $this->pass, $options);

            return $this->conn;

        } catch (PDOException $e) {
            die("Database connection failed: " . $e->getMessage());
        }
    }
}
?>