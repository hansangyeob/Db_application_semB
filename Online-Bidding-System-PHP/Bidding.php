<?php

session_start();

?>

<!DOCTYPE html>
<html lang="en">

<head>
  <title>Bidding System</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" type="text/css" href="CSS/Bidding.css">

  <script type="text/javascript">
    function bid(id) {
      if (confirm('Sure Participate ?')) {
        window.location = 'UserBid.php?bid=' + id
      }
    }
  </script>


</head>

<body>




  <?php
  require("Header.php");
  ?>


  <div class="bodysection templete clear">

    <div class="mainsection templete clear">


      <table>


        <?php
        $Server = "localhost";
        $username = "admin";
        $psrd = "";
        $dbname = "db_a2";
        $connection = mysqli_connect($Server, $username, $psrd, $dbname);
        $email = $_SESSION['email'];
        $query = "select * from auction_product where status='No' and email!='$email'";
        $Result = mysqli_query($connection, $query);
        $break = 0;

        while ($row = mysqli_fetch_array($Result)) {
          if ($break == 2) {
            echo "<tr>";
            $break = 0;
          }
          $datenow = date("Y-m-d");

          $edate = $row['closing_time'];
          if ($edate >= $datenow) {
            echo '<td>';
            echo "<h3>";
            echo $row['p_name'];
            echo "</h3>";
            echo "<br>";
            echo "<b>";
            echo "Product ID: ";
            echo "</b>";
            echo $row['p_id'];
            echo "<br>";
            echo "<b>";
            echo "Price: ";
            echo "</b>";
            echo $row['price_min'];
            echo "<br>";
            echo "<b>";
            echo "Seller: ";
            echo "</b>";
            echo $row['email'];

            echo "<br><br>";
        ?>
            <a href="javascript:bid(<?php echo $row[0]; ?>)"><span style="color: green;font-size: 15px"><b>Running</b></span> </a>
        <?php
            $break++;
            echo '</td>';
          }
        }
        ?>


      </table>

    </div>


  </div>



</body>

</html>