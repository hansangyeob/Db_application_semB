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
  <link rel="stylesheet" type="text/css" href="CSS/Bidding.css">

  <script type="text/javascript">
    function bid(id) {
      if (confirm('Sure you want to participate bidding in this item?')) {
        window.location = 'UserBid.php?bid=' + id
      }
    }
  </script>

  <style>
    #heading {
      text-align: center;
      margin-top: 10px;
      font-size: 30px;
    }

    #election {
      width: 400px;
      background-color: #286090;
      padding: 2px;
      height: 40px;
      border-radius: 5px;
      box-shadow: 0px 0px 10px 0px grey;
    }


    table {
      margin: auto;
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
      text-align: center;
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
      text-align: center;
    }

    .data-table tbody tr:nth-child(odd) td {
      background-color: #f4fbff;
    }

    .data-table tbody tr:nth-child(even) td {
      background-color: whitesmoke;
    }

    .data-table tbody tr:hover td {
      background-color: green;
      border-color: #ffff0f;
    }

    /* Table Footer */
    .data-table tfoot th {
      background-color: #e5f5ff;
      text-align: center;
    }

    .data-table tfoot th:first-child {
      text-align: center;
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
  <h2 style="text-align:center;">Current Auction</h2>

  <div class="bodysection templete clear">

    <div class="mainsection templete clear">

      <table>

        <?php

        //original format
        $seller = $_SESSION['email'];
        $query = "SELECT * FROM auction_product WHERE status='No' and seller!='$seller'";
        $Result = mysqli_query(connection(), $query);
        $break = 0;

        while ($row = mysqli_fetch_array($Result)) {
          if ($break == 2) {
            echo "<td>";
            $break = 0;
          }
          $datenow = date("Y-m-d");

          $edate = $row['closing_time'];
          if ($edate >= $datenow) {
            echo '<td>';
            echo "<h3>";
            echo $row['p_name'];
            echo "</h3>";
            echo "<br>";
            echo "<b>";
            echo "Product ID: ";
            echo "</b>";
            echo $row['p_id'];
            echo "<br>";
            echo "<b>";
            echo "Price: ";
            echo "</b>";
            echo $row['price_min'];
            echo "<br>";
            echo "<b>";
            echo "Seller: ";
            echo "</b>";
            echo $row['seller'];
            echo "<br>";
            echo "<b>";
            echo "End Date: ";
            echo "</b>";
            echo $row['closing_time'];

            echo "<br><br>";
        ?>
            <a href="javascript:bid(<?php echo $row[0]; ?>)"><span style="color: green;font-size: 15px"><b>Running</b></span> </a>
        <?php
            $break++;
            echo '</td>';
          }
        }
        ?>
        <?php


        // bidding table
        $seller = $_SESSION['email'];

        $query = "SELECT * FROM auction_product WHERE status='No' and seller!='$seller'";
        $Rows = mysqli_query(connection(), $query);
        $Result = mysqli_query(connection(), $query);
        $break = 0;

        if (mysqli_num_rows($Rows) > 0) {
          echo '<table class="data-table">';
          echo '<thead>';
          echo '<tr>';
          echo '<th>ID</th>';
          echo '<th>Product Name</th>';
          echo '<th>Price</th>';
          echo '<th>Seller</th>';
          echo '<th>End Date</th>';
          echo '<th>Sold</th>';
          echo '<th>Bid</th>';
          echo '</tr>';
          echo '</thead>';

          echo '<tbody>';

          while ($row = mysqli_fetch_array($Rows)) {
            $new_id = $row['p_id'];
            echo '<tr>
              <td>' . $row['p_id'] . '</td>
              <td>' . $row['p_name'] . '</td>
              <td>' . $row['price_min'] . '</td>
              <td>' . $row['seller'] . '</td>
              <td>' . $row['closing_time'] . '</td>
              <td>' . $row['status'] . '</td>
              <td>' . ' <a href="javascript:bid(<?php echo $row[0]; ?>)"><span style="color: green;font-size: 15px"><b>Running</b></span> </a>' . '</td>
            </tr>';
          }
        } else {
          echo "<script> window.alert('You Have Not Any Post Yet');</script>";
        }
        echo '</tbody>';

        ?>

      </table>

    </div>


  </div>



</body>

</html>