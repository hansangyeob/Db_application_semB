
 <?php

    function connection()
    {
        $DATABASE = "localhost";
        $username = "root";
        $dbname = "db_a2";
        $psrd = "";
        $connection = mysqli_connect($DATABASE, $username, $psrd, $dbname);

        return $connection;
    }

    function OpenCon()
    {
        $dbhost = "localhost";
        $dbuser = "root";
        $dbpass = "";
        $db = "db_a2";
        $conn = new mysqli($dbhost, $dbuser, $dbpass, $db) or die("Connect failed: %s\n" . $conn->error);

        return $conn;
    }


    function CloseCon($conn)
    {
        $conn->close();
    }



    ?>
