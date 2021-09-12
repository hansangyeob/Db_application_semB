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
  <link rel="stylesheet" type="text/css" href="CSS/Home.css">

</head>

<body>


  <div>
    <nav class="navbar navbar-inverse">
      <div class="container-fluid">
        <div class="navbar-header">
          <a class="navbar-brand" href="#">Oline-ACTION</a>
        </div>

        </ul>

        <ul class="nav navbar-nav navbar-right">
          <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#"><b>Login</b><span class="caret"></span></a>
            <ul class="dropdown-menu">
              <li><a href="UserLogin.php"><b>User Login</b></a></li>
              <li><a href="AdminLogin.php"><b>Admin Login</b></a></li>
            </ul>
          </li>

          <li><a href="Registration.php"><span class="glyphicon glyphicon-user"></span> <b>Sign Up</b></a></li>

        </ul>
      </div>
    </nav>
    <h2>current Auction</h3>
      <p>In order to use our service, please login</p>
  </div>

  <?php
  if (isset($_GET['message'])) {
    print '<script type="text/javascript">alert("' . $_GET['message'] . '");</script>';
  }

  if (isset($_GET['loginmessage'])) {
    print '<script type="text/javascript">alert("' . $_GET['loginmessage'] . '");</script>';
  }


  if ($_SERVER["REQUEST_METHOD"] == "POST") {

    echo "<script> alert('name'); </script>";
  }

  ?>

  <div class="bodysection templete clear">

    <div class="mainsection templete clear">

      <form action="" method="POST">

        <table>


          <?php

          $query = "select * from auction_product where status='No'";
          $Result = mysqli_query(connection(), $query);
          $break = 0;


          while ($row = mysqli_fetch_array($Result)) {

            if ($break == 2) {
              echo "<tr>";
              $break = 0;
            }

            $datenow = date("Y-m-d");

            $edate = $row['closing_time'];
            if ($edate >= $datenow) {
              echo '<td>';
              echo "<img src='" . $row['picture'] . "' width='170px' height='200px'><br>";
              echo '</td>';
              echo '<td>';
              echo "<h4>";
              echo "<b>";
              $name = $row['p_id'];
              echo $row['p_name'];
              echo "</b>";
              echo "</h4>";
              echo "<br>";
              echo "Price : ";
              echo "<b>";
              echo $row['price_min'];
              echo "</b>";
              echo "<br>";
              echo "Closing Time : ";
              echo "<b>";
              echo $edate;
              echo "</b>";
              echo "<br>";
          ?>
              <span style="color: green;font-size: 15px"><b>Running</b></span>
          <?php
              $break++;
              echo "<hr>";
              echo '</td>';
            }
          }
          ?>

        </table>
    </div>


</body>

</html>