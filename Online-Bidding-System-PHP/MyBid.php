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
      font-size: 14px;
      min-width: 537px;
    }

    .data-table th,
    .data-table td {
      border: 1px solid #e1edff;
      padding: 7px 17px;
    }

    .data-table caption {
      margin: 7px;
    }

    /* Table Header */
    .data-table thead th {
      background-color: #508abb;
      color: #FFFFFF;
      border-color: #6ea1cc !important;
      text-transform: uppercase;
    }

    /* Table Body */
    .data-table tbody td {
      color: #353535;
    }

    .data-table tbody td:first-child,
    .data-table tbody td:nth-child(4),
    .data-table tbody td:last-child {
      text-align: right;
    }

    .data-table tbody tr:nth-child(odd) td {
      background-color: #f4fbff;
    }

    .data-table tbody tr:hover td {
      background-color: green;
      border-color: #ffff0f;
    }

    /* Table Footer */
    .data-table tfoot th {
      background-color: #e5f5ff;
      text-align: right;
    }

    .data-table tfoot th:first-child {
      text-align: left;
    }

    .data-table tbody td:empty {
      background-color: #ffcccc;
    }
  </style>
</head>

<body>

  <?php
  require("Header.php");
  ?>
  <?php

  $field = 'offer_price';
  $sort = 'ASC';
  if (isset($_GET['sorting'])) {
    if ($_GET['sorting'] == 'ASC') {
      $sort = 'DESC';
    } else {
      $sort = 'ASC';
    }
  }
  if ($_GET['field'] == 'offer_price') {
    $field = "offer_price";
  } else {
    $field = "offer_time";
  } 


  $email = $_SESSION['email'];

  $query = "SELECT * FROM bids WHERE bidder='$email' ORDER BY $field $sort";
  $Rows = mysqli_query(connection(), $query);

  if (mysqli_num_rows($Rows) > 0) {
    echo '<table class="data-table">';
    echo '<thead>';
    echo '<tr>';
    echo '<th>Bid ID</th>';
    echo '<th>Name</th>';
    echo '<th>Seller</th>';
    echo '<th><a style="color:black;" href="MyBid.php?sorting=' . $sort . '&field=offer_time">Offer Time</a></th>';
    echo '<th><a style="color:black;" href="MyBid.php?sorting=' . $sort . '&field=offer_price">Offer Price</a></th>';
    echo '<th>Status</th>';

    echo '</tr>';
    echo '</thead>';

    echo '<tbody>';

    while ($row = mysqli_fetch_array($Rows)) {

      echo '<tr>
      <td>' . $row['b_id'] . '</td>       
      <td>' . $row['product_id'] . '</td>
      <td>' . $row['seller'] . '</td>
      <td>' . $row['offer_time'] . '</td>
      <td>' . $row['offer_price'] . '</td>

        </tr>';
    }
  } else {
    echo "<script> window.alert('You Are Not Participate Any Bid Yet');</script>";
  }

  ?>
</body>

</html>