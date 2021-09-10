<?php

    function connection()
    {
        $DATABASE = "localhost";
        $username = "root";
        $dbname = "test";
        $psrd = "1234";
        $connection = mysqli_connect($DATABASE, $username, $psrd, $dbname);

        return $connection;
    }

    function OpenCon()
    {
        $dbhost = "localhost";
        $dbuser = "root";
        $dbpass = "1234";
        $db = "test";
        $conn = new mysqli($dbhost, $dbuser, $dbpass, $db) or die("Connect failed: %s\n" . $conn->error);

        return $conn;
    }


    function CloseCon($conn)
    {
        $conn->close();
    }



    ?>