<?php
header('Content-Type: application/json; charset=utf-8');
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type");

if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(204);
    exit;
}

$data = json_decode(file_get_contents('php://input'), true);
require $_SERVER['DOCUMENT_ROOT'] . '/GameSpace/classes/Login.php';
$login = new Login();
$role = isset($data['role']) ? $data['role'] : '1';
$login->registerUser($data['name'], $data['surname'], $data['email'], $data['password'], $data['repeat_password'], $role);
?>