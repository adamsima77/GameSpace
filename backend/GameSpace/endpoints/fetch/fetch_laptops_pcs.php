<?php
header('Content-Type: application/json; charset=utf-8');
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type");
require $_SERVER['DOCUMENT_ROOT'] . '/GameSpace/classes/Item.php';
$items = new Item();
$data = $items->fetchLaptopsPcs($_GET['limit'], $_GET['offset']);

echo json_encode($data);
?>