<?php
session_start();
include 'DatabaseConnection.php';
$conn = OpenCon();
CloseCon($conn);
?>

<!DOCTYPE html>
<html>

<head>
  <title>Bidding System</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<style type="text/css">
  select {
    width: 300px;
    height: 40px;
    border: 1px solid #20B2AA;
    margin-top: 20px;
    padding: 2px;
    font-size: 20px;
    color: grey;
    border-radius: 5px;

  }

  #heading {
    text-align: center;
    margin-top: 10px;
    font-size: 30px;
    color: #228B22;
  }
</style>

<body>

  <?php

  if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $id = $_GET['bid'];
    $offered_price = $_POST['offer_price'];

    $qy = "SELECT * FROM auction_product WHERE p_id='$id'";
    $Rst = mysqli_query(connection(), $qy);
    $rws = mysqli_fetch_array($Rst);
    $seller = $rws['seller'];
    $started_price = $rws['price_min'];
    $productname = $rws['p_name'];
    $currentPrice = $rws['current_price'];
    $offeredTime = date("Y-m-d h:i:sa");
    $postbuyer = $_SESSION['email'];

    $queryInsert = "INSERT INTO bids(b_id,seller,bidder,product_id,offer_price,offer_time)
    VALUES ('0','$seller','$postbuyer','$id','$offered_price','$offeredTime')";

    $customer = $_SESSION['email'];
    $query_balance = "SELECT * FROM customer_account WHERE email = '$customer'";
    $Resultss = mysqli_query(connection(), $query_balance);
    $rowww = mysqli_fetch_array($Resultss);
    $customer_balance = $rowww['balance'];

    if (!mysqli_query(connection(), $queryInsert)) {
      // echo '<script language="javascript">';
      // echo 'alert("Something went wrong, please try again.")';
      // echo '</script>';
      // echo "Error creating dat dabase: " . mysqli_error(connection());
    } elseif (!mysqli_query(connection(), $queryInsert)) {
      echo '<script language="javascript">';
      echo 'alert("something wrong related to your balance!")';
      echo '</script>';
    } else {
      if (true) {
        $queryInsertt = "INSERT INTO bids(b_id,seller,bidder,product_id,offer_price,offer_time)
    VALUES ('0','$seller','$postbuyer','$id','$offered_price','$offeredTime')";
        $queryUpdate = "UPDATE auction_product SET current_price='$offered_price' where p_id='$id'";
        echo '<script language="javascript">';
        echo 'alert("Your bid has been successfully added. Good luck to you!")';
        echo '</script>';
        mysqli_query(connection(), $queryInsertt);
        mysqli_query(connection(), $queryUpdate);
    //   }
    }
  }
}
  // header('Location:Bidding.php');


  ?>

  <?php

  if (isset($_GET['bid'])) {

    $email = $_SESSION['email'];
    $id = $_GET['bid'];

    $query = "SELECT * FROM auction_product WHERE p_id ='$id'";
    $Result = mysqli_query(connection(), $query);
    $row = mysqli_fetch_array($Result);
    $Buyer = $row['seller'];


    if ($Buyer == $email) {
      echo "<script>alert('This Is Your Product, You Can Not Bid Your Own Product!');</script>";
      header("Location:Bidding.php");
    } else {
      echo '<a href="Bidding.php"> <= GO BACK </a>';

      $qry = "SELECT * FROM auction_product WHERE p_id ='$id'";
      $Result = mysqli_query(connection(), $qry);
      $row = mysqli_fetch_array($Result);
      $Price = $row['current_price'];

      $query = "SELECT * FROM auction_product WHERE p_id='$id'";
      $Result = mysqli_query(connection(), $query);
      $break = 0;

      $row = mysqli_fetch_array($Result);
      echo '<table align="center">';
      echo '<td>';
      echo "<img src='" . $row['picture'] . "' width='350px' height='250px'>";
      echo '</td>';
      echo '<td>';
      echo "Product Name :";
      echo "<b>";
      echo $row['p_name'];
      echo "</b>";
      echo "<br>";
      echo "Current Price: ";
      echo "<b>";
      echo $row['current_price'];
      echo "</b>";
      echo "<br>";
      echo "Closing time: ";
      echo "<b>";
      echo $row['closing_time'];
      echo "</b>";
      echo "<br><br>";
      echo '</table>';

      echo ' 
            <p id="heading">Choose Your Price</p>

          <center>
          <label for = "offer_price"> Please type the amount you want to bid </br> (only available up to the current price)</label>

            <form method="POST" name="CatagoryForm"  onsubmit="return validform();">
              <br>
              <div align="center">
              <input type = "number" id="offer_price" name = "offer_price" required>

              </div>   
          </center>
              <p style=" margin: -2.7% 10% 10% 62%">
              <button type="submit" class="btn btn-primary">Bid Now</button>
            </form>
';
    }
  }
  ?>

</body>

</html>