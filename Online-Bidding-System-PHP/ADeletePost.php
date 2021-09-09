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
        background-color: lightgray;
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

    <script type="text/javascript">
    function bid(id) {
        if (confirm('Are You Sure you want to delete This Post?')) {
            alert(id);
            window.location = 'APostDelete.php?bid=' + id
        }
    }
    </script>

</head>

<body>

    <?php
  require("AHeader.php");
  ?>

    <form action="" method="POST">
        <table class="data-table">
            <thead>
                <tr>
                    <th>Product</th>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Price</th>
                    <th>End Date</th>
                    <th>Seller</th>
                    <th>Buyer</th>
                    <th>Sold or Not</th>
                    <th>Delete</th>
                </tr>
            </thead>

            <tbody>

                <?php

        $query = "select * from auction_product";
        $Result = mysqli_query(connection(), $query);
        while ($row = mysqli_fetch_array($Result)) {
          echo "<tr>";
          echo "<td>";
          echo "<img style='width:100px;height:100px' src='" . $row['picture'] . "'>";
          echo "</td>";
          echo "<td>";
          echo $row['p_id'];
          echo "</td>";
          echo "<td>";
          echo $row['p_name'];
          echo "</td>";
          echo "<td>";
          echo $row['price_min'];
          echo "</td>";
          echo "<td>";
          echo $row['closing_time'];
          echo "</td>";
          echo "<td>";
          echo $row['seller'];
          echo "</td>";
          echo "<td>";
          echo $row['buyer'];
          echo "</td>";
          echo "<td>";
          echo $row['status'];
          echo "</td>";
          echo "<td>";
        ?>
                <a href="javascript:bid(<?php echo $row[0]; ?>)"> Delete </a>
                <?php

          echo '</td>';
        }
        ?>

            </tbody>
        </table>
    </form>
</body>

</html>