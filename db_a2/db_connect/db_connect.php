<?php
DEFINE('DB_USER','admin');
DEFINE('DB_PASSWORD','');
$dsn = 'mysql:host=localhost;dbname=db_a2';

$sname = "localhost";
$db_name ="db_a2";

$conn = mysqli_connect($sname, DB_USER, DB_PASSWORD, $db_name);

try{
    $db = new PDO($dsn,DB_USER,DB_PASSWORD);
}catch(PDOException $e){
    $err_msg = $e->getMessage();
    include("db_error.php");
    exit();
}
?>