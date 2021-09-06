<?php
session_start();
include 'DatabaseConnection.php';
$conn = OpenCon();
// echo "Connected Successfully";
CloseCon($conn);

?>

<!DOCTYPE html>

<html>

<head>
  <title>Bidding System</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" type="text/css" href="CSS/userlogin.css">

  <style>
    table {
      border-spacing: 20px;
      margin: 4% auto auto 20%;
      border-radius: 20px;
    }


    body {
      background-color: whitesmoke;
    }

    .size {
      width: 250px;
      height: 30px;
      padding: 2px
    }

    .Error {
      color: red;
    }

    div.temp {
      margin: 4% auto auto 20%;
    }

    td {
      font-size: 35px;
      border-width: 10px;
    }

    input,
    select,
    textarea {
      font-size: 75%;
      text-align: center;
    }
  </style>


  <script type="text/javascript">
    function ValidUser() {
      var name = UserLogin.uname;
      var Password = UserLogin.Pass;

      if (name.value == "") {
        window.alert("Name Field Can Not Be Empty");
        name.focus();
        return false;
      }
      if (Password.value == "") {
        window.alert("Password Field Can Not Be Empty");
        Password.focus();
        return false;
      }
      return true;
    }
  </script>
</head>

<body>


  <?php

  if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $email = $_POST['email'];
    $password = $_POST['password'];

    $query = "SELECT * FROM customer_account WHERE email='$email' and password='$password'";

    $Complete = mysqli_query(connection(), $query) or die("unable to connect");

    $Rows = mysqli_fetch_array($Complete);

    if ($Rows['email'] == $email && $Rows['password'] == $password) {
      session_start();
      $_SESSION['email'] = $email;
      $_SESSION['Pass'] = $password;
      header("Location:UserProfile.php");
      exit();
    } else {

      echo "<script>window.alert('Wrong User Name Or Password Try Again');</script>";
    }

    mysqli_close($connection);
  }



  ?>

  <div>
    <nav class="navbar navbar-inverse">
      <div class="container-fluid">
        <div class="navbar-header">
          <a class="navbar-brand" href="Home.php">Oline-ACTION</a>
        </div>

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

  <div class="container">
    <div class="row">
      <div class="col-sm-6 col-md-4 col-md-offset-4">
        <h1 class="text-center login-title"><b>Sign in to continue</b></h1>
        <div class="account-wall">
          <form class="form-signin" action="" method="POST" name="UserLogin" onsubmit="return ValidUser();">
            <input type="text" class="form-control" name="email" placeholder="Enter User Name">
            <input type="password" class="form-control" name="password" placeholder="Password">
            <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
          </form>
        </div>

      </div>
    </div>
  </div>

  </div>




</body>

</html>
