<!-- Customers can register accounts and login using either email or phone together with a password (that means customers can login with a pair of email/password or a pair of phone/password) -->
<!-- https://www.tutorialrepublic.com/php-tutorial/php-mysql-login-system.php -->
https://github.com/codingWithElias/Login-System-PHP-and-MYSQL

<!-- connecting db -->
<?php
require('db_connect/db_connect.php');
?>

<!-- login php -->
<?php

session_start();

if (isset($_POST['email']) && isset($_POST['password'])) {


    function validate($data)
    {
        $data = trim($data);
        $data = stripslashes($data);
        $data = htmlspecialchars($data);
        return $data;
    }

    $email = validate($_POST['email']);
    $password = validate($_POST['password']);


    $email = $_POST['email'];
    $password = $_POST['password'];

    if (empty($email)) {
        echo "Email empty";
        // header("Location: homepage.php?error=User Name is required");

    } else if (empty($password)) {
        // header("Location: homepage.php?error=Password is required");
        echo "Password empty";
    } else {
        $sql = "SELECT email,password FROM customer_account WHERE email='$email' AND password='$password' order by i_num";

        $result = mysqli_query($conn, $sql);

        if (mysqli_num_rows($result) == 1) {
            $row = mysqli_fetch_assoc($result);
            if ($row['email'] == $email && $row['password'] == $password) {
                $_SESSION['email'] = $row['email'];
                echo "You are in";
                header("Location: /db_a2/customer/homepage.php");
            } else {
                echo "Incorect User name or password";
                exit();
            }
        } else {
            echo "Incorect User name or password";
            exit();
        }
    }
} else {
}
?>


<!DOCTYPE html>
<html lang="en">

<?php
include('../header/header.php');
?>

<title>Login page</title>

<body>
    <h1>Welcome to Web Auction</h1>
    <p>In order to log in, type your email & password</p>


    <!-- login format -->
    <form action="login.php" method="post">
        <div>
            <label>Email : </label>
            <input type="text" name="email" value="<?php echo $email; ?>">
            <span style="color:red;"><?php echo $email_err; ?></span>
        </div>
        <div>
            <label>Password : </label>
            <input type="password" name="password" <?php echo (!empty($password_err)) ? 'is-invalid' : ''; ?>">
            <span style="color:red;"><?php echo $password_err; ?></span>
        </div>
        <div>
            <input type="submit" value="Login">
        </div>

        <hr>
        <div>
            <p>First here? Click <a href="../db_a2/customer/register.php">here</a> for Registeration</p>
        </div>

</body>

</html>