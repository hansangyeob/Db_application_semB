<?php
  session_start();
  include 'DatabaseConnection.php';
  $conn = OpenCon();
  // echo "Connected Successfully";
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
    $price = $_POST['price_min'];
    $buyer = $_SESSION['email'];

    $qry = "SELECT * FROM auction_product WHERE p_id='$id'";
    $Rslt = mysqli_query(connection(), $qry);

    $rw = mysqli_fetch_array($Rslt);

    $postbuyer = $rw['buyer'];
    $productname = $rw['p_name'];

    $message = "Dear ".$postbuyer . ", Someone Bid heigher than your Bid price on product" . $productname . '! , You Can Bid Again This Product. ';

    $insert = "INSERT INTO notification(n_id,buyer,note,status) VALUES(0,'$postbuyer','$message','Yes')";
    mysqli_query(connection(), $insert);

    $query = "UPDATE auction_product SET price_min='$price',buyer='$buyer' where p_id='$id'";

    mysqli_query(connection(), $query);

    header('Location:Bidding.php');
  }

  ?>

  <?php

  if (isset($_GET['bid'])) {

    $email = $_SESSION['email'];
    $id = $_GET['bid'];

    $query = "SELECT * FROM auction_product WHERE p_id ='$id'";

    $Result = mysqli_query(connection(), $query);

    $row = mysqli_fetch_array($Result);

    $Buyer = $row['buyer'];

    if ($Buyer == $email) {
      echo "<script>alert('This Is Your Product, You Can Not Bid Your Own Product!');</script>";
      header("Location:Bidding.php");
    } else {
      echo '<a href="Bidding.php"> <= GO BACK </a>';

      $qry = "SELECT * FROM auction_product WHERE p_id ='$id'";
      $Result = mysqli_query(connection(), $qry);
      $row = mysqli_fetch_array($Result);
      $Price = $row['price_min'];

      $price1 = $Price + 100;
      $price2 = $Price + 200;
      $price3 = $Price + 300;
      $query = "SELECT * FROM auction_product WHERE p_id='$id'";
      $Result = mysqli_query(connection(), $query);
      $break = 0;

      $row = mysqli_fetch_array($Result);
      echo '<table align="center">';
      // echo '<td>';
      // echo "<img src='" . $row['Image'] . "' width='350px' height='250px'>";
      // echo '</td>';
      echo '<td>';
      echo "Product Name :";
      echo "<b>";
      echo $row['p_name'];
      echo "</b>";
      echo "<br>";
      echo "Current Price: ";
      echo "<b>";
      echo $row['price_min'];
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
            <form method="POST" name="CatagoryForm"  onsubmit="return validform();">
              <br>
              <div align="center">
                  <select name="price_min" id="price_min" onchange="fetch_select(this.value);">
                    <option>' . $price1 . '</option>
                    <option>' . $price2 . '</option>
                    <option>' . $price3 . '</option>
                  </select><br>
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