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
  - Check the customer place bids for only one product
  - Check the updated product price is higher than maximum existing price
  - Checkinng user balance.
  - Cannot delete or withdraw once the customer bid for a product

