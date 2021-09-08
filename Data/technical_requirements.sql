drop table CUSTOMER_ACCOUNT;
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
	balance DECIMAL(8,2) not null,
	registered_branch mediumint(8) unsigned not null,
	primary key (i_num)
)PARTITION BY RANGE (i_num)(
    PARTITION P0 VALUES LESS THAN (201),
    PARTITION P1 VALUES LESS THAN (401),
    PARTITION P2 VALUES LESS THAN (601),
    PARTITION P3 VALUES LESS THAN (801),
    PARTITION P4 VALUES LESS THAN (MAXVALUE)
    );


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
create procedure getBalance(in inum varchar(255))
begin
    select balance
    from customer_account
    where i_num = inum;
end $$
delimiter ;

# insert p_id and get the minimum price
# delimiter $$
# create function get_Min_Price(in pid mediumint(8))
# returns integer(8,2)
# begin
#     declare minPrice integer;
#     set minPrice = null;
#
#     select price_min into minPrice
#     from auction_product
#     where pid = p_id;
#     return minPrice;
# end $$
# delimiter ;

# insert p_id and get the minimum price
delimiter $$
create procedure get_Min_Price(in pid mediumint(8))
begin
    select price_min
    from auction_product
    where pid = p_id;
end $$
delimiter ;

-- TRIGGER
# 1. check the customer place bids for only one product
delimiter $$
create trigger only_one_bid
    before insert on bids
    for each row
    begin


        if  then

            signal sqlstate '45000' set message_text = 'you can bid for only one product';
        end if ;
    end $$
delimiter ;

INSERT INTO bids (product_id,bidder,b_id,offer_price,offer_time) VALUES (11,17,12,25.38,'2022-01-26 19:21:50');



# 2. check the updated product price > maximum existing price
delimiter $$
create trigger check_updated_price
    before update on auction_product
    for each row
    begin
        if new.current_price < OLD.current_price then
            signal sqlstate '45000' set message_text = 'cannot update the current product price';
        end if ;
    end $$
delimiter ;

# 3
delimiter $$
create trigger check_balance
    before insert on bids
    for each row
    begin
        declare current_max_price decimal;

        select current_price into current_max_price
        from auction_product
        where p_id = new.product_id;

        # check the offer_price > maximum current price
        if  current_max_price >= new.offer_price then
            signal sqlstate '45000' set message_text = 'cannot bid the product. check you offer price';
        end if ;

        # to check the 'bids.offer_price >= auction_product.price_min'
        if new.offer_price <= get_Min_Price(new.product_id) then
            signal sqlstate '45000' set message_text = 'you cannot offer lower price than minimum price';
        end if ;

        # check the customer_account.balance >= bids.offer_price,
        # (cannot insert higher bid price than balance)
        if new.offer_price > getBalance(new.bidder) then
            signal sqlstate '45000' set message_text = 'check your balance';
        end if ;
    end $$
DELIMITER ;

# 4. cannot delete or withdraw once the customer bid for a product
Delimiter $$
create trigger prevent_bid_deletion
    before delete on bids
    for each row
    begin
        call do_not_delete();
    end $$
delimiter ;