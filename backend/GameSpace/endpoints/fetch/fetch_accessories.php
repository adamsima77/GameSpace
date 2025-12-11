<?php
header('Content-Type: application/json; charset=utf-8');
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type");
require $_SERVER['DOCUMENT_ROOT'] . '/GameSpace/classes/Item.php';
$item = new Item();
$data = $item->fetchAccessories();

echo json_encode($data);
?>