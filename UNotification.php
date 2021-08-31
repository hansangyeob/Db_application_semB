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
  <title>Bidding System</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

  <style>
    .msg {
      font-size: 30px;

      padding: 10px;
      margin-left: 200px;

    }

    table {
      margin: auto;
      font-family: "Lucida Sans Unicode", "Lucida Grande", "Segoe Ui";
      font-size: 12px;
    }

    h1 {
      margin: 25px auto 0;
      text-align: center;
      text-transform: uppercase;
      font-size: 17px;
    }

    table td {
      transition: all .5s;
    }

    /* Table */
    .data-table {
      border-collapse: collapse;
      font-size: 20px;
      min-width: 80%;
    }

    .data-table th,
    .data-table td {
      border: 1px solid #e1edff;
      padding: 7px 17px;
    }

    .data-table caption {
      margin: 7px;
    }
  </style>
</head>

<body>

  <?php
  require("Header.php");
  ?>

  <?php

  if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $seller = $_SESSION['email'];

    $query = "DELETE FROM notification WHERE buyer='$seller'";
    mysqli_query(connection(), $query);
  }

  ?>

  <?php

  $seller = $_SESSION['email'];

  $count = 0;
  $query = "select * from notification where buyer='$seller' and status='No'";
  $Rows = mysqli_query(connection(), $query);
  $count = mysqli_num_rows($Rows);

  if ($count == 0) {
    echo "<br><br>";
    echo "<h1 style='font-size:30px;color:green'>";
    echo "You Have Not Any New Notification Now";
    echo "</h1>";
  }

  if ($count > 0) {

    echo "<script> alert('You Have $count New Notification');</script>";

    echo "<form method='POST'>";
    echo '<table  style="width:200px;height:500px;border:2px solid black" class="data-table">
     <thead>
     <tr>
       <th>Message</th>   
    </tr>
  </thead>

<tbody>';

    while ($row = mysqli_fetch_array($Rows)) {
      echo "<tr>";
      echo "<td>";
      echo $row['note'];
      echo "</td>";
    }

    echo "<p style=' margin: 1% 0% 0% 45%'>
<button type='submit' class='btn btn-primary' >Delete All Message</button>
</p>";

    echo "</form>";
    echo "</tbody>";
  }



  ?>

</body>

</html>