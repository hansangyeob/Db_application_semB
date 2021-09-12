<?php
session_start();
include 'DatabaseConnection.php';
$conn = OpenCon();
CloseCon($conn);

?>


<?php

$bidder = $_SESSION['email'];
$seller = "SELECT seller from bids WHERE status = 'win' AND bidder = '$bidder'";
$winBidderBalance = "SELECT balance FROM customer_account WHERE email='$bidder'";
$sellerBalance = "SELECT balance FROM customer_account WHERE bidder='$bidder'";
$amount = "SELECT offer_price FROM bids WHERE bidder = '$bidder' AND status = 'win'";

mysqli_query(connection(), "SET AUTOCOMMIT = 0");
mysqli_query(connection(), "START TRANSACTION");
/* $bidderTransaction = "UPDATE customer_account
                       SET balance = $winBidderBalance - $amount 
                       WHERE win_bidder = '$winBidder'";
 $sellerTransaction = "UPDATE customer_account
                       SET balance = $sellerBalance + $amount 
                       WHERE win_bidder = '$winBidder'"; */


$bidder = $_SESSION['email'];
$sql = "INSERT INTO customer_account (balance) VALUES ($winBidderBalance - $amount) WHERE bidder = '$bidder'
        INSERT INTO customer_account (balance) VALUES ($sellerBalance + $amount) WHERE bidder = $bidder";
$result = mysqli_query(connection(), $sql);

if (!$result) {
    mysqli_query(connection(), "ROLLBACK");
    echo "Transaction rolled back";
    exit;
} else {
    mysqli_query(connection(), "COMMIT");
    echo "Transaction was successful";
}

?>