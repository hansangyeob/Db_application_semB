<?php
DEFINE('DB_USER','admin');
DEFINE('DB_PASSWORD','');
$dsn = 'mysql:host=localhost;dbname=db_a2';


try{
    $db = new PDO($dsn,DB_USER,DB_PASSWORD);
}catch(PDOException $e){
    $err_msg = $e->getMessage();
    include("db_error.php");
    exit();
}
?>