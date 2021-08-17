<!-- - The admin can see the total amount transacted between 2 time points (e.g. start time and end time) -->
<!-- - The admin can “undo” a transaction, i.e., subtracting the transacted money from the seller and adding it to the winning bidder (this feature is used to minimize the number of frauds) -->

<?php
require('../db_connect/db_connect.php');
$query_customers = 'SELECT * FROM customer_account ORDER BY i_num';
$customer_statement = $db->prepare($query_customers);
$customer_statement->execute();
$customers = $customer_statement->fetchAll();
$customer_statement->closeCursor();
?>

<!DOCTYPE html>
<html lang="en">
<?php
include('../header/header.php');
?>

<title>View Users / Transactions</title>

<h1>View User list</h1>

<body>
    <table>
        <tr>
            <th>i_num</th>
            <th>f_name</th>
            <th>l_name</th>
            <th>email</th>
            <th>phone</th>
            <th>address</th>
            <th>city</th>
            <th>country</th>
            <th>profile_pic</th>
            <th>balanace</th>
        </tr>

        <?php foreach ($customers as $customer) : ?>
            <tr>
                <td><?php echo $customer["i_num"]; ?></td>
                <td><?php echo $customer["f_name"]; ?></td>
                <td><?php echo $customer["l_name"]; ?></td>
                <td><?php echo $customer["email"]; ?></td>
                <td><?php echo $customer["phone"]; ?></td>
                <td><?php echo $customer["address"]; ?></td>
                <td><?php echo $customer["city"]; ?></td>
                <td><?php echo $customer["country"]; ?></td>
                <td><?php echo $customer["profile_pic"]; ?></td>
                <td><?php echo $customer["balance"]; ?></td>
            </tr>
        <?php endforeach; ?>
    </table>

</body>

</html>