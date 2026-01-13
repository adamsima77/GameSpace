<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/GameSpace/classes/Database.php';
class Slideshow extends Database{
    private $conn;

    public function fetchSlides(){
        try{
            $conn = $this->connect();
            $query = "SELECT img,alt,link FROM slideshow ORDER BY last_update DESC;";
            $stmt = $conn->prepare($query);
            $stmt->execute();
            $data = $stmt->fetchAll();
            $conn = null;
            return $data;
        } catch(Exception $e){
                $conn = null;
                return [];
        }
    }

     public function fetchSlideshowAdmin($limit, $offset){
        try{
             $conn = $this->connect();
             $query = "SELECT idSlideshow as id, img, alt, created_at, last_update, link FROM slideshow ORDER BY created_at DESC LIMIT ? OFFSET ?";
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
             $query = "SELECT COUNT(*) as total_pages FROM slideshow";
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
            $query = "DELETE FROM slideshow WHERE idSlideshow = ?;";
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

   public function checkAdd() {
    if (!isset($_FILES['img']) || !isset($_POST['alt']) || !isset($_POST['link'])) {
        echo json_encode(['message' => 'error', 'reason' => 'Nevyplnili ste polia !']);
        exit;
    }

    $file = $_FILES['img'];
    $alt = $_POST['alt'];
    $link = $_POST['link'];

    $allowedExtensions = ['jpg', 'jpeg', 'png', 'webp'];
    $maxFileSize = 5 * 1024 * 1024; // 5MB

    $originalName = $file['name'];
    $fileSize = $file['size'];
    $fileTmpPath = $file['tmp_name'];
    $extension = strtolower(pathinfo($originalName, PATHINFO_EXTENSION));

    if (!in_array($extension, $allowedExtensions)) {
        echo json_encode(['message' => 'error', 'reason' => 'Zlá prípona. Povolené: jpg, jpeg, png, webp']);
        exit;
    }

    if ($fileSize > $maxFileSize) {
        echo json_encode(['message' => 'error', 'reason' => 'Maximálna veľkosť súboru je 5MB']);
        exit;
    }

    if ($file['error'] !== 0) {
        echo json_encode(['message' => 'error', 'reason' => 'Chyba pri nahrávaní súboru']);
        exit;
    }

    $uploadDir = $_SERVER['DOCUMENT_ROOT'] . '/GameSpace/img/user/';
    $uniqueName = uniqid() . '.' . $extension;
    $destPath = $uploadDir . $uniqueName;

    if (move_uploaded_file($fileTmpPath, $destPath)) {
        $this->addRecord($uniqueName, $alt, $link);
    } else {
        echo json_encode(['message' => 'error', 'reason' => 'Nepodarilo sa uložiť súbor']);
        exit;
    }
}

     public function addRecord($fileName, $alt, $link){
        try{
             $base_url = "http://localhost/GameSpace/img/user/";
             $url = $base_url . $fileName;
             $query = "INSERT INTO slideshow(img,alt,link) VALUES(?,?,?);";
             $conn = $this->connect();
             $stmt = $conn->prepare($query);
             $stmt->bindParam(1, $url);
             $stmt->bindParam(2, $alt);
             $stmt->bindParam(3, $link);

             $stmt->execute();
             echo json_encode(['message' => 'success']);
             $conn = null;
             exit;
        } catch(Exception $e){ 
            echo json_encode(['message' => 'error']);
            $conn = null;
            die;
        }
    }

     public function fetchSingle($id){
        try{
             $query = "SELECT img, alt, link FROM slideshow WHERE idSlideshow = ?;";
             $conn = $this->connect();
             $stmt = $conn->prepare($query);
             $stmt->bindParam(1, $id);
             $stmt->execute();
             $rs = $stmt->fetch();
             echo json_encode($rs);
             $conn = null;
             exit;
        } catch(Exception $e){
            die;
        }
    }

  public function checkUpdate() {
    if (!isset($_POST['alt']) || !isset($_POST['link']) || !isset($_POST['id'])) {
        echo json_encode(['message' => 'error', 'reason' => 'Nevyplnili ste polia !']);
        exit;
    }

    $alt = $_POST['alt'];
    $link = $_POST['link'];
    $id = $_POST['id'];

    $fileName = null;

    if (isset($_FILES['img']) && $_FILES['img']['error'] === 0) {
        $file = $_FILES['img'];
        $allowedExtensions = ['jpg', 'jpeg', 'png', 'webp'];
        $maxFileSize = 5 * 1024 * 1024; // 5MB
        $originalName = $file['name'];
        $fileSize = $file['size'];
        $fileTmpPath = $file['tmp_name'];
        $extension = strtolower(pathinfo($originalName, PATHINFO_EXTENSION));

        if (!in_array($extension, $allowedExtensions)) {
            echo json_encode(['message' => 'error', 'reason' => 'Zlá prípona. Povolené: jpg, jpeg, png, webp']);
            exit;
        }

        if ($fileSize > $maxFileSize) {
            echo json_encode(['message' => 'error', 'reason' => 'Maximálna veľkosť súboru je 5MB']);
            exit;
        }

        $uploadDir = $_SERVER['DOCUMENT_ROOT'] . '/GameSpace/img/user/';
        $uniqueName = uniqid('slideshow_') . '.' . $extension;
        $destPath = $uploadDir . $uniqueName;

        if (!move_uploaded_file($fileTmpPath, $destPath)) {
            echo json_encode(['message' => 'error', 'reason' => 'Nepodarilo sa uložiť súbor']);
            exit;
        }

        //Delete old image
        try{
             $query = "SELECT img FROM slideshow WHERE idSlideshow = ?";
             $conn = $this->connect();
             $stmt = $conn->prepare($query);
             $stmt->bindParam(1, $id);
             $stmt->execute();
             $rs = $stmt->fetch();

             if ($rs && $rs['img']) {
                   $filePath = $_SERVER['DOCUMENT_ROOT'] . parse_url($rs['img'], PHP_URL_PATH);
                  if (file_exists($filePath)) {
                      unlink($filePath);
                  }
             }
            
        } catch(Exception $e){
                  die;
        }

        $fileName = "http://localhost/GameSpace/img/user/" . $uniqueName;
    }

    $this->updateRecord($alt, $link, $id, $fileName);
}

      public function updateRecord($alt, $link, $id, $imgUrl = null) {
        try {
        $conn = $this->connect();

        if ($imgUrl) {
            $query = "UPDATE slideshow SET img = ?, alt = ?, link = ? WHERE idSlideshow = ?;";
            $stmt = $conn->prepare($query);
            $stmt->bindParam(1, $imgUrl);
            $stmt->bindParam(2, $alt);
            $stmt->bindParam(3, $link);
            $stmt->bindParam(4, $id);
        } else {
            $query = "UPDATE slideshow SET alt = ?, link = ? WHERE idSlideshow = ?;";
            $stmt = $conn->prepare($query);
            $stmt->bindParam(1, $alt);
            $stmt->bindParam(2, $link);
            $stmt->bindParam(3, $id);
        }

        $stmt->execute();
        echo json_encode(['message' => 'success']);
        $conn = null;
        exit;
    } catch (Exception $e) {
        echo json_encode(['message' => 'error', 'reason' => $e->getMessage()]);
        $conn = null;
        die;
    }
}

}
?>