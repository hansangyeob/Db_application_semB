<?php
require './vendor/autoload.php'; // include Composer's autoloader
$client = new MongoDB\Client("mongodb://localhost:27017");
echo "connected to mondgo database!" . "<br>";
$collection = $client->product_mongo->product;
echo "Mongodb Databases selected";

?>

