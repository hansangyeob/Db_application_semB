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
create function getBalance(iNum varchar(255))
returns decimal (8,2)
begin
    declare bal decimal (8,2);
    set bal = null;

    select balance into bal
    from customer_account
    where i_num = iNum ;

    return bal;
end $$
delimiter ;


# insert p_id and get the minimum price
delimiter $$
create function get_Min_Price(pid mediumint(8))
returns decimal
begin
    declare min decimal;

    select price_min into min
    from auction_product
    where pid = p_id;
    return min;
end $$
delimiter ;



# -- TRIGGER
# 1. check the customer place bids for only one product
delimiter $$
create trigger only_one_bid
    before insert on bids
    for each row
    begin
        declare bidder_dup varchar(255);
        select count(b_id) into bidder_dup from bids where bidder= new.bidder;
        if bidder_dup > 0 then
            signal sqlstate '45000' set message_text = 'you can bid for only one product';
        end if ;
    end $$
delimiter ;
drop trigger only_one_bid;


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
drop trigger check_updated_price;

UPDATE auction_product set (p_id,p_name,price_min,current_price,closing_time,seller,picture,status) VALUES (23,'Avila','90.33','99','2022-03-05 11:18:01',19,'18.png','Yes');
drop trigger check_balance;
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

# INSERT INTO bids (product_id,bidder,b_id,offer_price,offer_time) VALUES (10,19,11,50.42,'2022-09-06 01:48:48');
# INSERT INTO bids (product_id,bidder,b_id,offer_price,offer_time) VALUES (10,19,11,500,'2022-09-06 01:48:48');

drop trigger prevent_bid_deletion;
# 4. cannot delete or withdraw once the customer bid for a product
Delimiter $$
create trigger prevent_bid_deletion
    before delete
    on bids
    for each row
    begin
        IF OLD.b_id >= 1 THEN
            signal sqlstate '45000' set message_text = 'cannot delete';
        END IF;
    end $$
delimiter ;

Delimiter $$
create trigger startTransaction
    before insert
    on bids
    for each row
    begin
        IF status = 'win' AND t_seller = seller AND win_bidder = bidder
            THEN
            INSERT INTO transaction (`t_amount`,`t_seller`,`pro_id`,`win_bidder`) VALUES (offer_price,seller,product_id,bidder);
            END IF;
    end $$
delimiter ;


