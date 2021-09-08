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
      background-color: cadetblue;
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
        // bidding table
        $seller = $_SESSION['email'];

        $query = "SELECT * FROM auction_product WHERE status='No' and seller!='$seller'";
        $Rows = mysqli_query(connection(), $query);

        $break = 0;

        if (mysqli_num_rows($Rows) > 0) {
          echo '<table class="data-table">';
          echo '<thead>';
          echo '<tr>';
          echo '<th>Product</th>';
          echo '<th>ID</th>';
          echo '<th>Product Name</th>';
          echo '<th>Price started</th>';
          echo '<th>Current Price</th>';
          echo '<th>End Date</th>';
          echo '<th>Status</th>';
          echo '</tr>';
          echo '</thead>';
          echo '<tbody>';

          while ($row = mysqli_fetch_array($Rows)) {


            echo '<tr>
              <td>' . "<img style='width:100px;height:100px' src='" . $row['picture'] . "'>" . '</td>            
              <td>' . $row['p_id'] . '</td>
              <td>' . $row['p_name'] . '</td>
              <td>' . $row['price_min'] . '</td>
              <td>' . $row['current_price'] . '</td>
              <td>' . $row['closing_time'] . '</td>
              <td>'
        ?>
            <a href="javascript:bid(<?php echo $row[0]; ?>)"><span style="color: green;font-size: 15px"><b>Running</b></span> </a>
            .<?php
              '</td>
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