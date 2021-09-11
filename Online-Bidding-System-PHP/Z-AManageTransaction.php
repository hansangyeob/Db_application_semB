<?php

session_start();
include 'DatabaseConnection.php';
$conn = OpenCon();
echo "Connected Successfully";
CloseCon($conn);

?>


<!DOCTYPE html>
<html lang="en">

<head>
    <title>Transaction System(ADMIN)</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="./CSS/AManageTransaction.css">

    <script type="text/javascript">
    function tid(id) {
        if (confirm('Are you sure you want to undo this transaction?')) {
            windwo.location = 'TranasactionDelete.php?t_id=' + id
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
    <script type="text/javascript">
    function bid(id) {
        if (confirm('Are you sure to ROLLBACK this transaction?')) {
            alert(id);
            window.location = 'AManageTransaction.php?bid=' + id
        }
    }
    </script>
</head>

<body>

    <?php
    require("AHeader.php");
    ?>
    <center>
        <h2>Transaction status</h2>

        <p>
            - The admin can “undo” a transaction, i.e., subtracting the transacted money from the seller and adding it
            to the winning bidder (this feature is used to minimize the number of frauds)
        </p>
    </center>

    <div class="bodysection templete clear">

        <div class="mainsection templete clear">

            <table>
                try {
                // First of all, let's begin a transaction
                $db->beginTransaction();

                // A set of queries; if one fails, an exception should be thrown
                $db->query('first query');
                $db->query('second query');
                $db->query('third query');

                // If we arrive here, it means that no exception was thrown
                // i.e. no query has failed, and we can commit the transaction
                $db->commit();
                } catch (\Throwable $e) {
                // An exception has been thrown
                // We must rollback the transaction
                $db->rollback();
                throw $e; // but the error must be handled anyway
                }
                <?php

                //Declare varible
                $seller = $_SESSION['email'];

                $query_seller = "SELECT * FROM customer_account WHERE email = '$seller'";

                $Result = mysqli_query(connection(), $query_seller);
     
                $query = "SELECT * FROM transaction "; 
                $Rows = mysqli_query(connection(), $query);
                $break = 0;
                // transaction table

                if (mysqli_num_rows($Rows) > 0) {

                    echo '<table class="data-table">';
                    echo '<thead>';
                    echo '<tr>';
                    echo '<th>ID</th>';
                    echo '<th>START TIME</th>';
                    echo '<th>END TIME</th>';
                    echo '<th>AMOUNT</th>';
                    echo '<th>SELLER</th>';
                    echo '<th>PRODUCT</th>';
                    echo '<th>WINNER</th>';
                    echo '<th>Rollback</th>';
                    echo '</tr>';
                    echo '</thead>';
                    echo '<tbody>';

                    while ($row = mysqli_fetch_array($Rows)) {

                        echo '<tr>
                         <td>' . $row['t_id']  . '</td>
                         <td>' . $row['start_time'] . '</td>
                         <td>' . $row['end_time'] . '</td>
                         <td>' . $row['t_amount'] . '</td>
                         <td>' . $row['t_seller'] . '</td>
                         <td>' . $row['pro_id'] . '</td>
                         <td>' . $row['win_bidder'] . '</td>
                         <td>'

                ?>

                <!-- show transaction button -->
                <a href="javascript:tid(<?php echo $row[0]; ?>)"><b>Rollback</b> </a>

                <?php
                        '</td>
          </tr>';
                    }
                } else {
                    echo "you have an error";
                }
                echo '</tbody>';
                ?>



                <?php
                $query_BidderBalance =  "UPDATE customer_account
                                        SET balance += $amount 
                                        WHERE win_bidder = '$winBidder'";
                $winBidder = "SELECT bidder FROM bids";
                $amount = "SELECT t_amount FROM bids WHERE bidder = '$winBidder'";


                ?>
            </table>

        </div>


    </div>

</body>

</html>