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
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

  <link rel="stylesheet" type="text/css" href="CSS/userReg.css">
  <title>Bidding System</title>

  <script type="text/javascript">
    function RegisterValid() {

      var i_num = Registerform.i_num;
      var l_name = Registerform.l_name;
      var f_name = Registerform.f_name;
      var Password = Registerform.password;
      var email = Registerform.email;
      var phone = Registerform.phone;
      var address = Registerform.address;
      var city = Registerform.city;
      var country = Registerform.country;


      if (i_num.value == "") {
        window.alert("Please enter your Identification Number.");
        i_num.focus();
        return false;
      }

      if (l_name.value == "") {
        window.alert("Please enter your Last Name.");
        l_name.focus();
        return false;
      }

      if (f_name.value == "") {
        window.alert("Please enter your First Name.");
        f_name.focus();
        return false;
      }

      if (!/^[a-zA-Z ]*$/g.test(l_name.value)) {
        alert("Invalid Characters For Last Name.");
        l_name.focus();
        return false;
      }

      if (!/^[a-zA-Z ]*$/g.test(f_name.value)) {
        alert("Invalid Characters For First Name.");
        f_name.focus();
        return false;
      }


      if (Password.value == "") {
        window.alert("Please enter your Password.");
        Password.focus();
        return false;
      }

      if (email.value == "") {
        window.alert("Please enter your email.");
        email.focus();
        return false;
      }

      if (!validateCaseSensitiveEmail(email.value)) {
        window.alert("Please enter a valid e-mail address.");
        email.focus();
        return false;
      }

      if (phone.value == "") {
        window.alert("Please enter your telephone number.");
        phone.focus();
        return false;
      }

      if (phone.value.length != 10) {
        window.alert("Please  your telephone number must be 10 digit.");
        phone.focus();
        return false;
      }

      if (address.value == "") {
        window.alert("Please provide Your Address.");
        address.focus();
        return false;
      }

      if (city.value == "") {
        window.alert("Please provide Your city.");
        city.focus();
        return false;
      }

      if (country.value == "") {
        window.alert("Please provide Your country.");
        country.focus();
        return false;
      }

      return true;
    }


    function validateCaseSensitiveEmail(email) {
      var reg = /^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})$/;
      if (reg.test(email)) {
        return true;
      } else {
        return false;
      }


    }
  </script>
</head>

<body>
  <?php

  if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $i_num    = $_POST['i_num'];
    $f_name   = $_POST['f_name'];
    $l_name   = $_POST['l_name'];
    $email    = $_POST['email'];
    $phone    = $_POST['phone'];
    $password = $_POST['password'];
    $address  = $_POST['address'];
    $city     = $_POST['city'];
    $country  = $_POST['country'];
    $balance = 0;

    // $destination = "UserPhoto/" . $_FILES['profile_pic']['name'];
    // $filename    = $_FILES['profile_pic']['tmp_name'];
    // move_uploaded_file($filename, $destination);

    $query = "INSERT INTO customer_account(i_num,f_name,l_name,email,phone,password,address,city,country,profile_pic,balance) 
    VALUES('$i_num','$f_name','$l_name','$email','$phone','$password','$address','$city','$country',null,$balance)";

    // if (connection()->query($query) === TRUE) {
    //   echo "New record created successfully";
    // } else {
    //   echo "Error: " . $query . "<br>" . connection()->error;
    // }

    // connection()->close();

    // $destination
    $ret = mysqli_query(connection(), $query);

    echo '<script language="javascript">';
    echo 'alert("Registration successfully.")';
    echo '</script>';
    header("Location:Home.php");
  }

  ?>



  <div class="container">
    <div class="row main">
      <div class="main-login main-center">
        <h3>User Registration Form</h5>
          <form method="POST" enctype="multipart/form-data" name="Registerform" onsubmit="return RegisterValid();">

            <!-- i_num input format -->
            <div class="form-group">
              <div class="cols-sm-10">
                <div class="input-group">
                  <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                  <input type="text" class="form-control" name="i_num" id="i_num" placeholder="Identification Number" />
                </div>
              </div>
            </div>

            <div class="form-group">
              <div class="cols-sm-10">
                <div class="input-group">
                  <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                  <input type="text" class="form-control" name="f_name" id="f_name" placeholder=" First Name" />
                </div>
              </div>
            </div>
            <div class="form-group">
              <div class="cols-sm-10">
                <div class="input-group">
                  <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                  <input type="text" class="form-control" name="l_name" id="l_name" placeholder=" Last Name" />
                </div>
              </div>
            </div>

            <div class="form-group">

              <div class="cols-sm-10">
                <div class="input-group">
                  <span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
                  <input type="text" class="form-control" name="email" id="email" placeholder=" Email" />
                </div>
              </div>
            </div>

            <div class="form-group">

              <div class="cols-sm-10">
                <div class="input-group">
                  <span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
                  <input type="text" class="form-control" name="phone" id="phone" placeholder=" Phone Number" />
                </div>
              </div>
            </div>

            <div class="form-group">
              <div class="cols-sm-10">
                <div class="input-group">
                  <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
                  <input type="password" class="form-control" name="password" id="password" placeholder=" Password" />
                </div>
              </div>
            </div>


            <div class="form-group">
              <div class="cols-sm-10">
                <div class="input-group">
                  <span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
                  <input type="text" class="form-control" name="address" id="address" placeholder=" Address" />
                </div>
              </div>
            </div>

            <div class="form-group">
              <div class="cols-sm-10">
                <div class="input-group">
                  <span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
                  <input type="text" class="form-control" name="city" id="city" placeholder=" City" />
                </div>
              </div>
            </div>

            <div class="form-group">
              <div class="cols-sm-10">
                <div class="input-group">
                  <span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
                  <input type="text" class="form-control" name="country" id="country" placeholder=" Country" />
                </div>
              </div>
            </div>


            <!-- <div class="form-group">
              <label class="cols-sm-2 control-label">Your Profile Picture</label>
              <div class="cols-sm-10">
                <div class="input-group">

                  <input type="file" name="profile_pic">
                </div>
              </div>
            </div> -->

            <div class="form-group ">
              <input type="submit" id="button" class="btn btn-primary btn-lg btn-block login-button">
            </div>

          </form>
      </div>
    </div>
  </div>


</body>

</html>