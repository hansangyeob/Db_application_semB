
 <?php
    $servername = "localhost";
    $username = "admin";
    $password = "";
    $database = "db_a2";

    $connection = new mysqli($servername, $username, $password, $database);


    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    ?> 
