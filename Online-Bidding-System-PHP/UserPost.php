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
  <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

  <style>
    form {
      margin: 0px 10px;
    }

    h2 {
      margin-top: 2px;
      margin-bottom: 2px;
    }

    .container {
      max-width: 30%;
    }

    .divider {
      text-align: center;
      margin-top: 20px;
      margin-bottom: 5px;
    }

    .divider hr {
      margin: 7px 0px;
      width: 35%;
    }

    .left {
      float: left;
    }

    .right {
      float: right;
    }
  </style>


  <script>
    function ValidateBidForm() {

      var name = BidForm.name;
      var price = BidForm.price;
      // var description = BidForm.description;
      var Quantity = BidForm.qty;
      // var sdate = BidForm.sdate;
      var edate = BidForm.edate;

      if (name.value == "") {
        window.alert("Please Enter Product Name.");
        name.focus();
        return false;
      }
      // if (document.getElementById("catagory").value == "Select Catagory") {
      //   alert("Please select Catagory"); 
      //   document.getElementById("catagory").focus();
      //   return false;
      // }
      if (price.value == "") {
        window.alert("Need Product Base Price.");
        price.focus();
        return false;
      }
      // if (description.value == "") {
      //   window.alert("Please Give Pruduct Description");
      //   description.focus();
      //   return false;
      // }
      // if (Quantity.value == "") {
      //   window.alert("Please Enter Product Quantity");
      //   Quantity.focus();
      //   return false;
      // }
      // if (sdate.value == "") {
      //   window.alert("Please Enter Start Date For Bid");
      //   Quantity.focus();
      //   return false;
      // }
      if (edate.value == "") {
        window.alert("Please Enter End Date For Bid");
        Quantity.focus();
        return false;
      }
      $datenow = date("Y-m-d");
      if (sdate < datenow) {
        window.alert("wrong date format");
        Quantity.focus();
        return false;
      }
      // if (edate < datenow || edate < sdate) {
      //   window.alert("wrong date format");
      //   Quantity.focus();
      //   return false;
      // }
      return true;
    }
  </script>

</head>

<body>

  <?php
  if ($_SERVER["REQUEST_METHOD"] == "POST") {


    $seller = $_SESSION['email'];
    $name = $_POST['name'];
    $price = $_POST['price'];
    $closing_time = $_POST['edate'];
    // $ProductStatus = 'No';

    // $destination = "ProductPhoto/" . $_FILES['Cpicture']['name'];
    // $filename    = $_FILES['Cpicture']['tmp_name'];
    // move_uploaded_file($filename, $destination);

    $query = "INSERT INTO auction_product(p_id,p_name,price_min,closing_time,seller,buyer,status)
    VALUES('0','$name','$price','$closing_time','$seller','null','No')";

    $exe = mysqli_query(connection(), $query);
    if (!$exe) {
      echo '<script language="javascript">';
      echo 'alert("insertion Problem")';
      echo '</script>';
      echo "Error creating database: " . mysqli_error(connection());
    } else {
      echo '<script language="javascript">';
      echo 'alert("Your item has been successfully added.")';
      echo '</script>';
    }
  }

  ?>

  <?php
  require("Header.php");
  ?>

  <div class="container">
    <div class="row">
      <div class="panel panel-primary">
        <div class="panel-body">
          <form action="" method="POST" enctype="multipart/form-data" role="form" name="BidForm">
            <div class="form-group">
              <h2>Add New Product</h2>
            </div>
            <div class="form-group">
              <label class="control-label" for="signupName">Product Name</label>
              <input type="text" name="name" maxlength="50" class="form-control" required>
            </div>


            <div class="form-group">
              <label class="control-label" for="signupEmail">Priduct Price</label>
              <input type="text" name="price" maxlength="50" class="form-control" required>
            </div>

            <div class="form-group">
              <label class="control-label">End Date</label>
              <input type="date" name="edate" maxlength="50" class="form-control" required>
            </div>
            <!-- <div class="form-group">
              <label class="control-label">Product Picture</label>
              <input type="file" name="Cpicture">
            </div> -->

            <div class="form-group">

              <button id="signupSubmit" type="submit" class="btn btn-info btn-block" onclick="return ValidateBidForm();">Add Now</button>
            </div>

          </form>
        </div>
      </div>
    </div>
  </div>

</body>

</html>