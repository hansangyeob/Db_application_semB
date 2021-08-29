<?php session_start() ?>

<!DOCTYPE html>
<html lang="en">

<head>
  <title>Bidding System</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<body>

  <?php
  require("Header.php");
  ?>

  <?php
  $DATABASE = "localhost";
  $username = "admin";
  $dbname = "db_a2";
  $psrd = "";
  $connection = mysqli_connect($DATABASE, $username, $psrd, $dbname);

  $email = $_SESSION['email'];

  $query = "select * from customer_account where email='$email'";
  $Result = mysqli_query($connection, $query);

  $row = mysqli_fetch_array($Result);

  echo "<div align='center'>";

  echo "<h3 style'margin:2% auto auto 40%;float:right;' >";
  echo "<b>"."Welcome, "."</b>" . $row['email'];
  echo "<br>";
  echo "<br>";
  echo "Your Imformation";
  echo "<br>";
  echo "<h5 style'margin:2% auto auto 40%;float:right;' >";
  echo "Identification Number : " . $row['i_num'];
  echo "<br>";
  echo "First Name : " . $row['f_name'];
  echo "<br>";
  echo "Last Name : " . $row['l_name'];
  echo "<br>";
  echo "Email : " . $row['email'];
  echo "<br>";
  echo "Phone Number: " . $row['phone'];
  echo "<br>";
  echo "Address : " . $row['address'];
  echo "<br>";
  echo "Country : " . $row['country'];
  echo "<br>";
  echo "City : " . $row['city'];
  echo "<br>";
  echo "Balance : " . $row['balance'];
  echo "</div>";
  echo "</div>";

  ?>
</body>

</html>