CREATE TABLE branch (
  `b_code` int(8) unsigned NOT NULL auto_increment,
  `b_name` varchar(50),
  `address` varchar(255) default NULL,
  `hotline_num` varchar(100) default NULL,
  PRIMARY KEY (`b_code`)
) engine = innoDB;
create table customer_account (
  i_num int(8) unsigned not null,
  first_name VARCHAR(50) not null,
  last_name VARCHAR(50) not null,
  email VARCHAR(50) not null,
  phone VARCHAR(50) not null,
  password VARCHAR(50) not null,
  address VARCHAR(50),
  city VARCHAR(50),
  country VARCHAR(50),
  profile_pic blob default null,
  balance DECIMAL(8, 2) not null,
  registered_branch int(8) not null,
  primary key (i_num)
) Engine = InnoDB;
CREATE TABLE auction_product (
  `p_id` int(8) unsigned NOT NULL auto_increment,
  `p_name` varchar(255) NOT NULL,
  `price_min` decimal NOT NULL,
  `current_price` decimal,
  `closing_time` datetime,
  `seller` varchar(255) NOT NULL,
  `bidder` varchar(255),
  `picture` blob,
  `status` varchar(4),
  PRIMARY KEY (`p_id`)
) AUTO_INCREMENT = 1,
engine = innoDB;
create table admin(
  a_email varchar(255),
  a_password varchar(255)
) engine = innoDB;
create table bids(
  b_id int(8) unsigned NOT NULL auto_increment,
  seller varchar (255) NOT NULL,
  bidder varchar(255) NOT NULL,
  product_id int(8) unsigned NOT NULL,
  offer_price decimal(8, 2),
  offer_time datetime,
  status varchar(255),
  primary key (b_id)
) engine = innoDB;
create table transaction(
  t_id int(8) unsigned not null auto_increment,
  start_time datetime,
  end_time datetime,
  t_amount decimal(8, 2),
  t_seller varchar(255) NOT NULL,
  win_bidder varchar(255) NOT NULL,
  pro_id int(8) unsigned NOT NULL,
  primary key (t_id)
) engine = innoDB;
-- INSERT DATA INTO 'BRANCH' TABLE
INSERT INTO `branch` (`b_code`, `b_name`, `address`, `hotline_num`)
VALUES (
    1,
    'Orlando',
    'P.O. Box 637, 6345 Lacus. Ave',
    '6326365471'
  );
INSERT INTO `branch` (`b_code`, `b_name`, `address`, `hotline_num`)
VALUES (2, 'Lukou', '106-3563 Enim St.', '5372588585');
INSERT INTO `branch` (`b_code`, `b_name`, `address`, `hotline_num`)
VALUES (
    3,
    'Hwaseong-si',
    'P.O. Box 157, 4728 Convallis St.',
    '2167445971'
  );
INSERT INTO `branch` (`b_code`, `b_name`, `address`, `hotline_num`)
VALUES (
    4,
    'Karlstad',
    'P.O. Box 802, 5060 Volutpat. St.',
    '8228137743'
  );
-- INSERT DATA INTO 'CUSTOMER_ACCOUNT' TABLE
insert into customer_account (
    i_num,
    first_name,
    last_name,
    email,
    phone,
    password,
    address,
    city,
    country,
    profile_pic,
    balance,
    registered_branch
  )
values (
    7,
    'test_first_name',
    'test_last_name',
    'user1@gmail.com',
    '00000000',
    '1234',
    '45952 Ramsey Crossing',
    'Denton',
    'United Kingdom',
    'https://www.google.com/search?q=profile+picture+png&rlz=1C1NHXL_koKR781KR781&sxsrf=AOaemvKbl_FE6buo6rh7RJ6dX7HuqvTXOw:1631443382892&tbm=isch&source=iu&ictx=1&fir=GHbdym26eAzRCM%252CFdNZT9hRZ6zyYM%252C_&vet=1&usg=AI4_-kRjtKGd4Wcj6SxohfXgtGK06BfaLg&sa=X&ved=2ahUKEwigrruaoPnyAhWiL6YKHVZeDhkQ9QF6BAgSEAE#imgrc=GHbdym26eAzRCM',
    0,
    1
  );
insert into customer_account (
    i_num,
    first_name,
    last_name,
    email,
    phone,
    password,
    address,
    city,
    country,
    profile_pic,
    balance,
    registered_branch
  )
values (
    8,
    'test_first_name2',
    'test_last_name2',
    'user2@gmail.com',
    '00000001',
    '1234',
    '45952 Ramsey Crossing',
    'Denton',
    'United Kingdom',
    'https://www.google.com/search?q=profile+picture+png&rlz=1C1NHXL_koKR781KR781&sxsrf=AOaemvKbl_FE6buo6rh7RJ6dX7HuqvTXOw:1631443382892&tbm=isch&source=iu&ictx=1&fir=GHbdym26eAzRCM%252CFdNZT9hRZ6zyYM%252C_&vet=1&usg=AI4_-kRjtKGd4Wcj6SxohfXgtGK06BfaLg&sa=X&ved=2ahUKEwigrruaoPnyAhWiL6YKHVZeDhkQ9QF6BAgSEAE#imgrc=GHbdym26eAzRCM',
    0,
    1
  );
-- INSERT DATA INTO 'AUCTION_PRODUCT' TABLE
INSERT INTO auction_product (
    p_id,
    p_name,
    price_min,
    current_price,
    closing_time,
    seller,
    bidder,
    picture,
    status
  )
VALUES (
    1,
    'Cleaning stuff',
    '423.10',
    '430',
    '2026-02-12 02:02:51',
    'user1@gmail.com',
    null,
    'data:image/jpeg;base64,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',
    'No'
  );
INSERT INTO auction_product (
    p_id,
    p_name,
    price_min,
    current_price,
    closing_time,
    seller,
    bidder,
    picture,
    status
  )
VALUES (
    2,
    'iPhone',
    '54.32',
    '55',
    '2027-10-16 12:26:28',
    'user1@gmail.com',
    null,
    'data:image/jpeg;base64,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',
    'No'
  );
INSERT INTO auction_product (
    p_id,
    p_name,
    price_min,
    current_price,
    closing_time,
    seller,
    bidder,
    picture,
    status
  )
VALUES (
    3,
    'shampoo',
    '83.89',
    '100',
    '2027-10-13 05:55:27',
    'user1@gmail.com',
    null,
    'https://www.google.com/imgres?imgurl=https%3A%2F%2Fpng.pngitem.com%2Fpimgs%2Fs%2F43-434027_product-beauty-skin-care-personal-care-liquid-tree.png&imgrefurl=https%3A%2F%2Fwww.pngitem.com%2Fso%2Fproduct%2F&tbnid=79Woqwhy1aGbrM&vet=12ahUKEwjQp7nZofnyAhUkNqYKHdqZDgMQMygBegUIARC_AQ..i&docid=x1KUFAOnlEHFoM&w=500&h=280&q=product%20picture%20png&hl=en&ved=2ahUKEwjQp7nZofnyAhUkNqYKHdqZDgMQMygBegUIARC_AQ',
    'No'
  );
-- INSERT DATA INTO 'ADMIN' TABLE
insert into admin (a_email, a_password)
values ('admin1@gmail.com', '123456');


-- INSERT DATA INTO 'TRANSACTION' TABLE
INSERT INTO `transaction` (`t_id`,`start_time`,`end_time`,`t_amount`,`t_seller`,`pro_id`,`win_bidder`) VALUES (1,'2021-02-03 12:07:46','2021-12-18 23:21:57','100.92','gtwatti@netvibes.com',1,'bgable3@freewebs.com');
INSERT INTO `transaction` (`t_id`,`start_time`,`end_time`,`t_amount`,`t_seller`,`pro_id`,`win_bidder`) VALUES (2,'2021-10-13 23:51:22','2022-02-14 20:53:23','300.15','ckeasyb@uol.com.br',2,'rkovalski4@google.com.au');
INSERT INTO `transaction` (`t_id`,`start_time`,`end_time`,`t_amount`,`t_seller`,`pro_id`,`win_bidder`) VALUES (3,'2022-02-15 04:49:39','2022-07-27 23:00:05','400.15','mtabourc@blinklist.com',3,'iexposito8@geocities.com');