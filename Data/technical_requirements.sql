
-- PARTITIONING
CREATE TABLE CUSTOMER_ACCOUNT(
    i_num INT not null,
	first_name VARCHAR(50) not null,
	last_name VARCHAR(50) not null,
	email VARCHAR(50) not null,
	phone VARCHAR(50) not null,
	password VARCHAR(50) not null,
	address VARCHAR(50),
	city VARCHAR(50),
	country VARCHAR(50),
	profile_pic blob,
	balance DECIMAL(8,2)  not null,
    primary key (i_num)
)PARTITION BY RANGE (balance)(
    PARTITION P0 VALUES LESS THAN (201),
    PARTITION P1 VALUES LESS THAN (401),
    PARTITION P2 VALUES LESS THAN (601),
    PARTITION P3 VALUES LESS THAN (801),
    PARTITION P4 VALUES LESS THAN (MAXVALUE)
    );


# check the customer place bids for only one product

# check the customer_account.balance >= bids.offer_price,
# to check the 'bids.offer_price >= auction_product.price_min' and to check 'customer_account.balance > bids.offer_price'

# check the offer_price > maximum existing offer_price
# after update the offer_price (maximum)
# check the updated product price >

# cannot delete or withdraw once the customer bid for a product


-- STORED PROCEDURE / FUNCTION

# accepts bid offer price and return the i_num of the bidder who offer the highest number among the offer price
DELIMITER $$
CREATE PROCEDURE sp_highest_offer_price(bid_price decimal(8,2))
RETURN varchar(225) not deterministic
    DECLARE
BEGIN
#     SELECT c1.balance, c2.balance, offer_price
#     FROM customer_account c1, customer_account c2 join bids
#     WHERE bidder = c1.i_num and bidder = c2.i_num;
    select balance
    from customer_account
    where i_num in (select i_num, ma)
end $$
DELIMITER ;


-- TRIGGER
DELIMITER $$

CREATE TRIGGER check_bidding_price
    BEFORE UPDATE
    ON CUSTOMER_ACCOUNT,
    FOR EACH ROW
    OK: BEGIN
        -- Check if no balance changed
        IF OLD.balance = NEW.balance THEN
            LEAVE OK;
        end if ;

        -- Check if the offer price is higher than balance
               > balance
            signal sqlstate '45000' set message_text = 'cannot bid for the new product';
        end if $$
    end $$
DELIMITER ;