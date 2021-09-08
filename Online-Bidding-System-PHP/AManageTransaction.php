<?php
session_start();
include 'DatabaseConnection.php';
$conn = OpenCon();
// echo "Connected Successfully";
CloseCon($conn);
?>


<!DOCTYPE html>
<html lang="en">

<head>
    <title>Bidding System(ADMIN)</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>

<body>

    <?php
    require("AHeader.php");
    ?>
    <center>
        <h2>Transaction status</h2>
        <p>
            - The admin can see the total amount transacted between 2 time points (e.g. start time and end time)
        </p>
        <p>
            - The admin can “undo” a transaction, i.e., subtracting the transacted money from the seller and adding it to the winning bidder (this feature is used to minimize the number of frauds)
        </p>
    </center>


</body>

</html>