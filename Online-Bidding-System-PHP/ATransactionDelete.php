<?php
session_start();
include 'DatabaseConnection.php';
$conn = OpenCon();
CloseCon($conn);
?>


<?php
if (isset($_GET['tid'])) {

  $id = $_GET['tid'];
  
  $query = "delete from transaction where t_id=$id

  
  ";

  mysqli_query(connection(), $query);
  // mysqli_query(connection(), $query_BidderBalance);
  // mysqli_query(connection(), $query_SellerBalance);
  header('Location:AManageTransaction.php');

  
}
?>