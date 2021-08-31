<!-- https://github.com/rmzn17/Online-Bidding-System-PHP- -->
<?php
session_start();
include 'DatabaseConnection.php';
$conn = OpenCon();
// echo "Connected Successfully";
CloseCon($conn);

?>

<?php

$query = "SELECT * FROM auction_product WHERE status = 'No' ";

$result = mysqli_query(connection(), $query);

while ($row = mysqli_fetch_array($result)) {
  $datenow = date("Y-m-d");

  $duedate = $row['closing_time'];

  $prodid = $row['p_id'];
  if ($datenow >= $duedate) {

    $buyer = $row['Buyer'];

    if ($buyer == "Null") {
      $seller = $row['email'];
      $ProductName = $row['p_name'];

      $message = "Sorry Mr." . $seller . ", Your Product " . $ProductName . " Remain Unsold  No one bid your product";
      $query1 = "insert into Notification values('$seller','$message','No')";
      mysqli_query(connection(), $query1);
    } else {

      $qry = "UPDATE auction_product SET status = 'Yes' WHERE p_id = '$prodid'";
      mysqli_query(connection(), $qry);

      $seller = $row['email'];
      $buyer = $row['Buyer'];
      $ProductName = $row['p_name'];

      $qry1 = "select * from custoemr_account where email='$seller'";
      $result1 = mysqli_query(connection(), $qry1);
      $row1 = mysqli_fetch_array($result1);
      $sname = $row1['l_name'];
      $semail = $row1['email'];
      $sphone = $row1['phone'];

      $qry2 = "select * from custoemr_account where email='$buyer'";
      $result2 = mysqli_query(connection(), $qry2);
      $row2 = mysqli_fetch_array($result2);
      $bname = $row2['l_name'];
      $bemail = $row2['email'];
      $bphone = $row2['phone'];

      $message = "Congratulation Mr." . $sname . ", Your Product " . $ProductName . " has been sold and Buyer is " . $bname . " You can contact with Buyer by Email:" . $bemail . " or You can use phone:" . $bphone . ".";
      $query1 = "insert into notification values('$seller','$message','No')";
      mysqli_query(connection(), $query1);

      $message = "Congratulation Mr." . $bname . ", Your are the final and highest bidder of  Product " . $ProductName . ". Now This is Your Product. Product Seller is " . $sname . ", You can contact with Seller by Email:" . $semail . " or You can use phone: " . $sphone . ".";
      $query2 = "insert into notification values('$buyer','$message','No')";
      mysqli_query(connection(), $query2);
    }
  }
}

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

  <script type="text/javascript">
    function bid(id) {
      if (confirm('Sure Participate?')) {
        alert('You Are Not Sign in, Please Sign In For Bid');
        window.location = 'BidProduct.php?bid=' + id
      }
    }
  </script>


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
              // echo '<td>';
              // echo "<img src='" . $row['Image'] . "' width='170px' height='220px'><br>";
              // echo '</td>';
              echo '<td>';
              // echo "<h2> Description</h2>";

              echo "<h4>";
              echo "<b>";
              $name = $row['p_id'];
              echo $row['p_name'];
              echo "</b>";
              echo "</h4>";

              // echo $row['Description'];
              echo "<br>";
              echo "<b>";
              echo "Price: ";
              echo $row['price_min'];
              echo "</b>";
              echo "<br>";

          ?>
              <a href="javascript:bid(<?php echo $row[0]; ?>)"> <span style="color: green;font-size: 15px"><b>Running</b></span> </a>
          <?php
              $break++;
              echo "<hr>";
              echo '</td>';
            }
          }
          ?>

        </table>
    </div>

    <div class="sidebar clear">

      <div class="Semisidebar clear">
        <h2>Sold Product</h2>
        <?php

        $query = "select * from auction_product where Status='Yes'";
        $Result = mysqli_query(connection(), $query);
        $break = 0;
        while ($row = mysqli_fetch_array($Result)) {

          if ($break == 1) {
            echo "<tr>";
            $break = 0;
          }
          // echo '<td>';
          // echo "<img src='" . $row['Image'] . "' width='285px' height='220px'><br>";
          // echo '</td>';

          echo '<td>';

          echo "<h4>";
          echo "<b>";
          echo $row['p_name'];
          echo "</b>";
          echo "</h4>";

          // echo $row['Description'];

          // echo "<br>";
          echo "<b>";

          echo "Sold Price: ";
          echo $row['price_min'];
          echo "</b>";

          echo "<br>";
        ?>
          <!-- <a href="#"> <img src="Image/sold.jpg" width="285px" height="100px" alt="Bid" /> </a> -->
        <?php

          $break++;
          echo '</td>';
          echo "<hr>";
        }

        ?>


      </div>


    </div>


    </form>

</body>

</html>