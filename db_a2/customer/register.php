<?php
require('../db_connect/db_connect.php');

//input validation
$email = filter_input(INPUT_POST, "email");
$phone_number = filter_input(INPUT_POST, "phone_number");
$first_name = filter_input(INPUT_POST, "first_name");
$last_name = filter_input(INPUT_POST, "last_name");
$i_number = filter_input(INPUT_POST, "i_number");
$address = filter_input(INPUT_POST, "address");
$password = filter_input(INPUT_POST, "password");
$city = filter_input(INPUT_POST, "city");
$country = filter_input(INPUT_POST, "country");
$profile_pic = filter_input(INPUT_POST, "profile_pic");
$balance = 0;

if ($email == null || $phone_number = null || $first_name == null || $last_name == null || $i_number == null ||
    $address == null || $city == null || $country == null
) {
    $err_msg = "All Values Not Entered Yet<br>";
    include('../db_connect/db_error.php');
} elseif (!preg_match("/[a-zA-Z]{3,30}$/", $first_name)) {
    $err_msg = "First Name Not Valid<br>";
    include('../db_connect/db_error.php');
} elseif (!preg_match("/[a-zA-Z]{3,30}$/", $last_name)) {
    $err_msg = "Last Name Not Valid<br>";
    include('../db_connect/db_error.php');
} elseif (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
    $err_msg = "Email Not Valid<br>";
    include('../db_connect/db_error.php');
    // } elseif (!preg_match("/^[a-zA-Z ,#'/\.]{3,100}$/", $address)) {
    //     $err_msg = "Address Not Valid<br>";
    //     include('../db_connect/db_error.php');}
} elseif (!preg_match("/^[a-zA-Z]{3,100}$/", $city)) {
    $err_msg = "City Not Valid<br>";
    include('../db_connect/db_error.php');
} elseif (!preg_match("/^[a-zA-Z]{3,100}$/", $country)) {
    $err_msg = "Country Not Valid<br>";
    include('../db_connect/db_error.php');
    // } elseif (!preg_match("/^[0-9]{10}$/", $phone_number)) {
    //     $err_msg = "Phone number must be in 10 digit number only<br>";
    //     include('../db_connect/db_error.php');
} else {
    require_once("../db_connect/db_connect.php");
    //insert statement if all the input is valid
    $query = 'INSERT INTO customer_account(i_num, f_name, l_name, email, phone, password, address, city, country, profile_pic, balance) 
    VALUES(:i_num, :f_name, :l_name, :email, :phone, :password, :address, :city, :country, :profile_pic, :balance)';

    $stm = $db->prepare($query);
    $stm->bindValue(':i_num', $i_number);
    $stm->bindValue(':f_name', $first_name);
    $stm->bindValue(':l_name', $last_name);
    $stm->bindValue(':email', $email);
    $stm->bindValue(':phone', $phone_number);
    $stm->bindValue(':password', $password);
    $stm->bindValue(':address', $address);
    $stm->bindValue(':city', $city);
    $stm->bindValue(':country', $country);
    $stm->bindValue(':profile_pic', $profile_pic);
    $stm->bindValue(':balance', $balance);
    //$stm->bindValue(':primarykey',null, PDO::PARAM_INT);
    $execute_success = $stm->execute();
    $stm->closeCursor();

    if (!$execute_success) {
        print_r($stm->errorInfo()[2]);
    }

    echo "Registered!<br>";
    echo ' Click <a href= "../customer/homepage.php"> here </a> to go to home page';
    exit();
}

// require_once('../db_connect/db_connect.php');
// $query_customers = 'SELECT * FROM customer_account';
// $customer_statement->execute();
// $customers= $customer_statement->fetchAll();
// $customer_statement->closeCursor();
?>

<!DOCTYPE html>
<html lang="en">

<?php
include('../header/header.php');
?>
<title>Register</title>

<body>

    <H3>Registeration form</H3>
    <form action="register.php" method="post" id="register_form">

        <label>Email : </label>
        <input type="email" name="email">
        <br>
        <label>Phone Number: </label>
        <input type="text" name="phone_number">
        <br>
        <label>Password : </label>
        <input type="password" name="password">
        <br>
        <label>First Name :</label>
        <input type="text" name="first_name">
        <br>
        <label>Last Name : </label>
        <input type="text" name="last_name">
        <br>
        <label>Identification Number : </label>
        <input type="text" name="i_number">
        <br>
        <label>Address : </label>
        <input type="text" name="address">
        <br>
        <label>City : </label>
        <input type="text" name="city">
        <br>
        <label>Country : </label>
        <input type="text" name="country">
        <br>
        <label>Profile Picture</label>
        <input type="file" name="profile_picture">
        <br>
        <br>
        <button type="submit" value="resigter"> Register</button>
    </form>
</body>

</html>