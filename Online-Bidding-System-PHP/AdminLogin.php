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
  <link rel="stylesheet" type="text/css" href="CSS/Adminlogin.css">

  <script type="text/javascript">
    function validadmin() {
      var name = AdminLogin.uName;
      var Password = AdminLogin.Pass;

      if (name.value == "") {
        window.alert("Name Field Can Not Be Empty.");
        name.focus();
        return false;
      }
      if (Password.value == "") {
        window.alert("Password Field Can Not Be Empty.");
        Password.focus();
        return false;
      }
      return true;
    }
  </script>

</head>


<?php



if ($_SERVER["REQUEST_METHOD"] == "POST") {

  $aname = $_POST['a_email'];
  $Pass = $_POST['a_password'];

  $query = "select * from Admin where a_email='$aname' and a_password='$Pass'";

  $Complete = mysqli_query(connection(), $query) or die("unable to connect");

  $Rows = mysqli_fetch_array($Complete);

  if ($Rows['a_email'] == $aname && $Rows['a_password'] == $Pass) {
    session_start();
    $_SESSION['a_email'] = $aname;
    $_SESSION['a_password'] = $Pass;
    header("Location:AdminMagane.php");
    exit();
  } else {

    echo "<script>alert('Wrong User Name Or Password Try Again');</script>";
  }

  mysqli_close($connection);
}




?>


<?php
require("Header.php");
?>

<div class="container" style="margin-top:40px">
  <div class="row">
    <div class="col-sm-6 col-md-4 col-md-offset-4">
      <div class="panel panel-default">
        <div class="panel-heading">
          <strong>Sign in to continue for Admin</strong>
        </div>
        <div class="panel-body">
          <form role="form" action="#" method="POST" name="AdminLogin" onsubmit=" return validadmin();">
            <fieldset>

              <div class="row">
                <div class="col-sm-12 col-md-10  col-md-offset-1 ">
                  <div class="form-group">
                    <div class="input-group">
                      <span class="input-group-addon">
                        <i class="glyphicon glyphicon-user"></i>
                      </span>
                      <input class="form-control" placeholder="Username" name="a_email" type="text">
                    </div>
                  </div>
                  <div class="form-group">
                    <div class="input-group">
                      <span class="input-group-addon">
                        <i class="glyphicon glyphicon-lock"></i>
                      </span>
                      <input class="form-control" placeholder="Password" name="a_password" type="password">
                    </div>
                  </div>
                  <div class="form-group">
                    <input type="submit" class="btn btn-lg btn-primary btn-block" value="Sign in">
                  </div>
                </div>
              </div>
            </fieldset>
          </form>
        </div>

      </div>
    </div>
  </div>
</div>


</body>

</html>