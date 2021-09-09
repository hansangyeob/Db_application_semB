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
    function validadmin() {

        var email = AAdmin.email;
        var balance = AAdmin.balance;

        if (balance.value == "") {
            window.alert("Need Valid balance");
            balance.focus();
            return false;
        }

        if (email.value == "") {
            window.alert("Need Valid Email");
            email.focus();
            return false;

        }
        if (!validateCaseSensitiveEmail(email.value)) {
            window.alert("Please enter a valid e-mail address.");
            email.focus();
            return false;
        }
        return true;

    }
    </script>
</head>

<body>


    <?php

    if ($_SERVER["REQUEST_METHOD"] == "POST") {

        $email    = $_POST['email'];
        $balance = $_POST['balance'];

        $query = "UPDATE customer_account SET balance='$balance' where email='$email'";
        mysqli_query(connection(), $query);
        echo '<script language="javascript">';
        echo 'alert("Balance updated successfully")';
        echo '</script>';
    }

    ?>

    <?php
    require("AHeader.php");
    ?>

    <div class="container-fluid">
        <H3>Enter the email of the user and balance you wish to provide</H3>
        <br>
        <form class="register-form" method="POST" name="AAdmin">
            <div class="row">
                <div class="col-md-4 col-sm-4 col-lg-4">
                    <label for="email">EMAIL</label>
                    <input type="email" name="email" class="form-control">
                </div>
            </div>
            <div class="row">
                <div class="col-md-4 col-sm-4 col-lg-4">
                    <label for="email">BALANCE</label>
                    <input type="number" name="balance" class="form-control">
                </div>
            </div>

            <hr>
            <div class="row">
                <div class="col-md-6 col-sm-6 col-xs-6 col-lg-6">
                    <input type="submit" class="btn btn-default regbutton" onclick=" return validadmin();">
                </div>
            </div>
        </form>
    </div>
    <hr>
    <form action="" method="POST">
        <table class="data-table">
            <thead>
                <tr>
                    <!-- <th>Photo</th> -->
                    <th>Identification Number</th>
                    <th>Name</th>
                    <th>email</th>
                    <th>Balance</th>
                </tr>
            </thead>

            <tbody>

                <?php

                $query = "select * from customer_account";
                $Result = mysqli_query(connection(), $query);
                while ($row = mysqli_fetch_array($Result)) {
                    echo "<tr>";
                    echo "<td>";
                    echo $row['i_num'];
                    echo "</td>";
                    echo "<td>";
                    echo $row['last_name'];
                    echo " " . $row['first_name'];
                    echo "</td>";
                    echo "<td>";
                    echo $row['email'];
                    echo "</td>";
                    echo "<td>";
                    echo $row['balance'];
                    echo "</td>";
                }
                ?>


            </tbody>
        </table>
    </form>
</body>

</html>