<!-- Customers can register accounts and login using either email or phone together with a password (that means customers can login with a pair of email/password or a pair of phone/password) -->

<?php
require('db_connect/db_connect.php');
?>


<!DOCTYPE html>
<html lang="en">

<?php
include('../header/header.php');
?>

<title>Login page</title>

<body>
    <h1>Welcome to Web Auction</h1>
    <p>In order to log in, type your email <strong>or</strong> password</p>
    <div>
        <form action="" method="post" id="login-form">
            <label> Email : </label>
            <input type="text" name="email">

            <label> Phone Number : </label>
            <input type="text" name="phone_number">
            <br>
            <br>
            <label> password : </label>
            <input type="password" name="password">
            <button type="submit"> log in</button>
        </form>

    </div>
    <hr>
    <div>
        <p>First here? Click <a href="register.php">here</a> to register</p>
    </div>

</body>

</html>