-- FUNCTION
# 1. insert email and get the balance
delimiter $$ create function getBalance(c_email varchar(255)) returns decimal (8, 2) begin
declare bal decimal (8, 2);
set bal = null;
select balance into bal
from customer_account
where email = c_email;
return bal;
end $$ delimiter;
# select getBalance('asdf@asdf.com');
# insert p_id and get the minimum price
delimiter $$ create function get_Min_Price(pid mediumint(8)) returns decimal begin
declare min decimal;
select price_min into min
from auction_product
where pid = p_id;
return min;
end $$ delimiter;
# select get_Min_Price(8);
# -- TRIGGER
# 1. check if the customer place bids for only one product
delimiter $$ create trigger only_one_bid before
insert on bids for each row begin
declare bidder_dup varchar(255);
select count(b_id) into bidder_dup
from bids
where bidder = new.bidder
    and product_id = new.product_id;
if bidder_dup > 0 then signal sqlstate '45000'
set message_text = 'you can bid for only one product';
end if;
end $$ delimiter;
# INSERT INTO bids (product_id,seller,bidder,b_id,offer_price,offer_time,status) VALUES (10,'gbartlet6@addthis.com','rdacca7@census.gov',10,14.42,'2022-09-06 01:48:48','win');
# INSERT INTO bids (product_id,seller,bidder,b_id,offer_price,offer_time,status) VALUES (10,'gbartlet6@addthis.com','rdacca7@census.gov',11,14.42,'2022-09-06 01:48:48','win');
# 2.check if the updated product price > maximum existing price delimiter $$ create trigger check_updated_price before
update on auction_product for each row begin if new.current_price < OLD.current_price then signal sqlstate '45000'
set message_text = 'cannot update the current product price';
end if;
end $$ delimiter;
# update auction_product set current_price = 110 where p_id = 4;
# 3
delimiter $$ create trigger check_balance before
insert on bids for each row begin
declare current_max_price decimal;
select current_price into current_max_price
from auction_product
where p_id = new.product_id;
# check if the offer_price > maximum current price if current_max_price > new.offer_price then signal sqlstate '45000'
set message_text = 'cannot bid the product. check you offer price';
end if;
# to check if the 'offer_price >= auction_product.price_min' if new.offer_price <= get_Min_Price(new.product_id) then signal sqlstate '45000'
set message_text = 'you cannot offer lower price than minimum price';
end if;
# check if the customer_account.balance >= bids.offer_price,
# (cannot insert higher bid price than balance)
if new.offer_price > getBalance(new.bidder) then signal sqlstate '45000'
set message_text = 'check your balance';
end if;
end $$ DELIMITER;
-- 1
# INSERT INTO bids (product_id,seller,bidder,b_id,offer_price,offer_time,status) VALUES (10,'gbartlet6@addthis.com','rdacca7@census.gov',10,14.42,'2022-09-06 01:48:48','win');
# INSERT INTO bids (product_id,seller,bidder,b_id,offer_price,offer_time,status) VALUES (10,'gbartlet6@addthis.com','asdf@census.gov',11,15.42,'2022-09-06 01:48:49','win');
-- 2
# INSERT INTO bids (product_id,seller,bidder,b_id,offer_price,offer_time,status) VALUES (20,'iexposito8@geocities.com@addthis.com','asdf@asdf.com',13,500,'2022-09-06 01:48:48','ongoing');
-- 3
# INSERT INTO bids (product_id,seller,bidder,b_id,offer_price,offer_time,status) VALUES (10,'gbartlet6@addthis.com','asdf@asdf.com',12,110,'2022-09-06 01:48:48','ongoing');
# 4. cannot delete or withdraw once the customer bid for a product
Delimiter $$ create trigger prevent_bid_deletion before delete on bids for each row begin IF OLD.b_id >= 1 THEN signal sqlstate '45000'
set message_text = 'cannot delete';
END IF;
end $$ delimiter;
# delete from bids where b_id = 1;