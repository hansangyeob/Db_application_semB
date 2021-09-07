
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

# to check the 'bids.offer_price >= auction_product.price_min'


# check the updated product price >


-- STORED PROCEDURE / FUNCTION

#i_num, balance, offer_price of the customer who bids for the product
delimiter $$
create procedure sp_cus_balance()
begin
    select i_num, balance, offer_price
    from customer_account join bids
    on i_num = bidder;
end $$
delimiter ;

# accepts bid.offer_price and return the i_num of the bidder who offer the highest number among the offer price
DELIMITER $$
CREATE function sp_highest_offer_price(bid_price decimal(8,2))
RETURNS varchar(225) not deterministic
BEGIN
declare i_num varchar(255);
    select bids.bidder into i_num
    from customer_account join bids
    where offer_price = (SELECT *
                       from bids
                       where offer_price = (select max(offer_price) from bids));
    return i_num;
end $$
DELIMITER ;

# insert i_num and get the balance
delimiter $$
create function getBalance(inum varchar(255))
returns decimal (8,2)
begin
    select balance
    from customer_account
    where inum = i_num;
end $$
delimiter ;


-- TRIGGER
##
DELIMITER $$
CREATE TRIGGER prevent_update_price
    BEFORE UPDATE
    ON CUSTOMER_ACCOUNT
    FOR EACH ROW
    OK: BEGIN
        -- Check if no balance changed
        IF OLD.balance = NEW.balance THEN
            LEAVE OK;
        end if ;

        -- Check if the offer price is higher than balance
        if new.offer_price       > balance
            signal sqlstate '45000' set message_text = 'cannot bid for the new product';
        end if $$

    end $$
DELIMITER ;

# check the offer_price > maximum existing offer_price

# check the customer_account.balance >= bids.offer_price,
# (cannot insert higher bid price than balance)
delimiter $$
create trigger check_balance
    before insert on bids
    for each row
    begin
        declare current_max_price decimal;

        select
        if  <= new.offer_price then
            signal sqlstate '45000' set message_text = 'cannot bid the product. check you offer price';
        end if $$

        if new.offer_price > getBalance(new.bidder) then
            signal sqlstate '45000' set message_text = 'check your balance';
        end if ;
    end $$
DELIMITER ;

# cannot delete or withdraw once the customer bid for a product
Delimiter $$
create trigger prevent_bid_deletion
    before delete on bids
    for each row
    begin
        signal sqlstate '45000' set message_text = 'cannot withdraw the bid';
    end $$
delimiter ;