HOW TO USE ACUTION APPLICATION

0. Start your localhost and mongodb server.
1. Insert `db-test.sql` to your local host.
2. Change function in connection() and OpenCon() in`DatabaseConnection.php` to your local setting.
3. For mongodb, go to `../phpmongo/insert.php` and change setting to your computer.

Explain about `Data`file

1. Like above, `db-test.sql` is for you to insert.
2. `test_performance.sql` is to test perfromance,
   which will be done at the demo video.
3. `trigger.sql` is for adding the trigger. We contain 4 trigger which is
   3.1) Check the customer place bids for only one product
   3.2) Check the updated product price is higher than maximum existing price
   3.3) Checkinng user balance.
   3.4) Cannot delete or withdraw once the customer bid for a product

