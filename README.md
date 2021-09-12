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


For the simplicity for you to use inserted databases for login,
user 1
id : user1@gmail.com
phone number : 00000000
password:1234

user2
id : user2@gmail.com
phone number : 00000001
password:1234

admin
id: admin1@gmail.com
password:123456
