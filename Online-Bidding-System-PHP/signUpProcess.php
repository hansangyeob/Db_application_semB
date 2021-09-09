<?php
session_start();
include 'DatabaseConnection.php';
$conn = OpenCon(); CloseCon($conn);?>
<?php
$i_num = $_GET['i_num'];
$f_name = $_GET['f_name'];
$l_name = $_GET['l_name'];
$email = $_GET['email'];
$phone = $_GET['phone'];
$password = $_GET['password'];
$address = $_GET['address'];
$city = $_GET['city'];
$country = $_GET['country'];
// $hashedPassword = password_hash($_POST['password'], PASSWORD_DEFAULT);

$sql = "
INSERT INTO user
(i_num, first_name, last_name,email,phone,password,address,country)
VALUES($i_num,$f_name,$l_name,$email,$phone,$password,$city,$country)";

$result = $conn->query($sql);

//저장이 됬다면 (result = true) 가입 완료
if($result) {
?>
<script>
alert('가입 되었습니다.');
location.replace("./home.php");
</script>

<?php   }
else{
?> <script>
alert("fail");
</script>
<?php   }

mysqli_close($connect);
?>