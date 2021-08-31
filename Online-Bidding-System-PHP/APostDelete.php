<?php
session_start();
include 'DatabaseConnection.php';
$conn = OpenCon();
// echo "Connected Successfully";
CloseCon($conn);
?>


<?php
if (isset($_GET['bid'])) {

  $id = $_GET['bid'];
  $query = "delete from auction_product where p_id='$id'";

  mysqli_query(connection(), $query);
  header('Location:ADeletePost.php');
}
?>