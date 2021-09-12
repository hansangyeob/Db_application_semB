
use test;
drop table transaction;
drop table bids;
drop table notification;
drop table admin;
drop table auction_product;
drop table customer_account;
drop table branch;

START TRANSACTION;

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
	balance DECIMAL(8,2)  not null,
	registered_branch int(8) not null,
	primary key (i_num)
)    Engine = InnoDB;

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
) AUTO_INCREMENT=1, engine = innoDB;

create table admin(
    a_email varchar(255),
    a_password varchar(255)
) engine = innoDB;

create table notification(
    n_id  int(8) unsigned NOT NULL auto_increment,
    buyer varchar(255),
    note varchar(255),
    status varchar(4),
    primary key(n_id)
)engine = innoDB;

create table bids(
    b_id int(8) unsigned NOT NULL auto_increment,
    seller varchar (255) NOT NULL,
    bidder varchar(255) NOT NULL,
    product_id int(8) unsigned NOT NULL ,
    offer_price decimal(8,2),
    offer_time datetime,
    status varchar(255),
    primary key (b_id)
)engine = innoDB;

create table transaction(
    t_id int(8) unsigned not null auto_increment,
    start_time datetime,
    end_time datetime,
    t_amount decimal(8,2),
    t_seller varchar(255) NOT NULL,
    win_bidder varchar(255) NOT NULL,
    pro_id int(8) unsigned NOT NULL,
    primary key (t_id)
) engine = innoDB;



-- INSERT DATA INTO 'BRANCH' TABLE
INSERT INTO `branch` (`b_code`,`b_name`,`address`,`hotline_num`) VALUES (1,'Orlando','P.O. Box 637, 6345 Lacus. Ave','6326365471');
INSERT INTO `branch` (`b_code`,`b_name`,`address`,`hotline_num`) VALUES (2,'Lukou','106-3563 Enim St.','5372588585');
INSERT INTO `branch` (`b_code`,`b_name`,`address`,`hotline_num`) VALUES (3,'Hwaseong-si','P.O. Box 157, 4728 Convallis St.','2167445971');
INSERT INTO `branch` (`b_code`,`b_name`,`address`,`hotline_num`) VALUES (4,'Karlstad','P.O. Box 802, 5060 Volutpat. St.','8228137743');
INSERT INTO `branch` (`b_code`,`b_name`,`address`,`hotline_num`) VALUES (5,'Kokubunji','Ap #799-7781 Dignissim. Avenue','4955525907');
INSERT INTO `branch` (`b_code`,`b_name`,`address`,`hotline_num`) VALUES (6,'Cusco','P.O. Box 792, 7171 Tristique Rd.','9612294377');
INSERT INTO `branch` (`b_code`,`b_name`,`address`,`hotline_num`) VALUES (7,'Budapest','Ap #579-8024 Mauris Avenue','1454479403');
INSERT INTO `branch` (`b_code`,`b_name`,`address`,`hotline_num`) VALUES (8,'putrajaya','2871 Lectus Street','8174589596');
INSERT INTO `branch` (`b_code`,`b_name`,`address`,`hotline_num`) VALUES (9,'Galapa','P.O. Box 618, 6603 Vivamus Road','9146735117');
INSERT INTO `branch` (`b_code`,`b_name`,`address`,`hotline_num`) VALUES (10,'Méru','Ap #560-2240 Gravida St.','3131096876');
-- INSERT DATA INTO 'CUSTOMER_ACCOUNT' TABLE
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance, registered_branch) values (1, 'Demetria', 'Orniz', 'dorniz0@forbes.com', '7788169754', '2MTnEm5IJ', '8121 Arrowood Place', 'Izmaylovo', 'Russia', 'http://dummyimage.com/237x100.png/ff4444/ffffff', 3091.8,10);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance, registered_branch) values (2, 'Blaire', 'Peirazzi', 'bpeirazzi1@pinterest.com', '4803845551', 'gaUjLyl3BLU', '4 Memorial Lane', 'Baishan', 'China', 'http://dummyimage.com/179x100.png/5fa2dd/ffffff', 3804.14,9);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance, registered_branch) values (3, 'Marquita', 'Skinner', 'mskinner2@t.co', '4076594684', 'a44i1GOM', '48404 Atwood Street', 'Orlando', 'United States', 'http://dummyimage.com/137x100.png/5fa2dd/ffffff', 8387.42,8);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance, registered_branch) values (4, 'Berke', 'Gable', 'bgable3@freewebs.com', '7899825450', '0T6nBEQM', '63613 Moose Terrace', 'Néa Ionía', 'Greece', 'http://dummyimage.com/159x100.png/dddddd/000000', 8360.61,7);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance, registered_branch) values (5, 'Roberto', 'Kovalski', 'rkovalski4@google.com.au', '6951852041', 'baBP9omQQ6', '69760 Hansons Hill', 'Río de Oro', 'Colombia', 'http://dummyimage.com/135x100.png/dddddd/000000', 8721.27,6);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance, registered_branch) values (6, 'Shawnee', 'Masurel', 'smasurel5@wired.com', '6886452552', 'SvqSSw', '270 Sunfield Hill', 'Lukou', 'China', 'http://dummyimage.com/150x100.png/ff4444/ffffff', 7245.72,5);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance, registered_branch) values (7, 'Guss', 'Bartlet', 'gbartlet6@addthis.com', '9805219964', '8LC6GVarhZq', '19862 Springview Crossing', 'Jingyu', 'China', 'http://dummyimage.com/213x100.png/5fa2dd/ffffff', 4533.96,1);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance, registered_branch) values (8, 'Rolando', 'Dacca', 'rdacca7@census.gov', '4816331206', '6HpCYOf', '36399 Autumn Leaf Pass', 'Fuzhai', 'China', 'http://dummyimage.com/207x100.png/ff4444/ffffff', 5852.19,2);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance, registered_branch) values (9, 'Issi', 'Exposito', 'iexposito8@geocities.com', '8424541241', 'GAzlJVRMUB', '14 Calypso Hill', 'Hwaseong-si', 'South Korea', 'http://dummyimage.com/127x100.png/5fa2dd/ffffff', 9644.5,3);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance, registered_branch) values (10, 'Denny', 'MacCorley', 'dmaccorley9@jiathis.com', '4802078830', 'GNHlc32gZjF', '247 Lake View Lane', 'Mesa', 'United States', 'http://dummyimage.com/219x100.png/dddddd/000000', 2383.44,4);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance, registered_branch) values (11, 'Laurent', 'Tilzey', 'ltilzeya@github.com', '5071839114', 'yYSlGd', '6077 Vahlen Hill', 'Osby', 'Sweden', 'http://dummyimage.com/106x100.png/cc0000/ffffff', 2520.29,8);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance, registered_branch) values (12, 'Chaddy', 'Keasy', 'ckeasyb@uol.com.br', '1733761136', 'ABgX8armqEH', '82 Mccormick Point', 'Pitai', 'Indonesia', 'http://dummyimage.com/120x100.png/cc0000/ffffff', 2944.38,4);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance, registered_branch) values (13, 'Malinda', 'Tabour', 'mtabourc@blinklist.com', '4281820296', 'ar8nUOV', '3157 Park Meadow Road', 'Calvão', 'Portugal', 'http://dummyimage.com/177x100.png/ff4444/ffffff', 3373.84,6);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance, registered_branch) values (14, 'Chance', 'Kidney', 'ckidneyd@reference.com', '9724774908', 'tk4vlJl', '5305 Crowley Hill', 'Hucheng', 'China', 'http://dummyimage.com/138x100.png/dddddd/000000', 3246.38,3);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance, registered_branch) values (15, 'Karmen', 'Messum', 'kmessume@craigslist.org', '6861300324', 'nLJGcCbtZ7J', '9056 Londonderry Junction', 'Kanie', 'Japan', 'http://dummyimage.com/149x100.png/ff4444/ffffff', 893.11,1);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance, registered_branch) values (16, 'Claudio', 'Carvil', 'ccarvilf@nhs.uk', '5815471246', 'V6acEuPQNvh', '123 Morning Crossing', 'Ar Rumaythah', 'Iraq', 'http://dummyimage.com/196x100.png/ff4444/ffffff', 6437.99,7);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance, registered_branch) values (17, 'Chandal', 'Wiltshire', 'cwiltshireg@wikimedia.org', '7314661428', 'Xe7yvIgULu', '08534 Mendota Circle', 'Perniö', 'Finland', 'http://dummyimage.com/183x100.png/dddddd/000000', 699.32,5);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance, registered_branch) values (18, 'Hube', 'Huncoot', 'hhuncooth@nps.gov', '2916540633', 'MD8jF6p', '43246 Nancy Court', 'Shijie', 'China', 'http://dummyimage.com/107x100.png/dddddd/000000', 6043.75,1);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance, registered_branch) values (19, 'Gaylord', 'Twatt', 'gtwatti@netvibes.com', '3121243341', '07NJz5zeiqs', '45952 Ramsey Crossing', 'Denton', 'United Kingdom', 'http://dummyimage.com/249x100.png/cc0000/ffffff', 35438.0,2);
 -- INSERT DATA INTO 'AUCTION_PRODUCT' TABLE
INSERT INTO auction_product (p_id,p_name,price_min,current_price,closing_time,seller,bidder,picture,status) VALUES (1,'Dejesus','99.94','300','2025-09-19 12:11:17','iexposito8@geocities.com','dmaccorley9@jiathis.com','1.png','No');
INSERT INTO auction_product (p_id,p_name,price_min,current_price,closing_time,seller,bidder,picture,status) VALUES (2,'Leblanc','10.22','10.22','2024-06-17 22:09:42','bpeirazzi1@pinterest.com','iexposito8@geocities.com','2.png','No');
INSERT INTO auction_product (p_id,p_name,price_min,current_price,closing_time,seller,bidder,picture,status) VALUES (3,'Santiago','50.04','50.04','2022-06-17 03:46:02','mskinner2@t.co','rdacca7@census.gov','3.png','Yes');
INSERT INTO auction_product (p_id,p_name,price_min,current_price,closing_time,seller,bidder,picture,status) VALUES (4,'Bond','423.10','430','2026-02-12 02:02:51','bgable3@freewebs.com','gbartlet6@addthis.com','4.png','No');
INSERT INTO auction_product (p_id,p_name,price_min,current_price,closing_time,seller,bidder,picture,status) VALUES (5,'Parrish','54.32','55','2027-10-16 12:26:28','rkovalski4@google.com.au','smasurel5@wired.com','5.png','No');
INSERT INTO auction_product (p_id,p_name,price_min,current_price,closing_time,seller,bidder,picture,status) VALUES (6,'Bruce','83.89','100','2027-10-13 05:55:27','smasurel5@wired.com','rkovalski4@google.com.au','6.png','No');
INSERT INTO auction_product (p_id,p_name,price_min,current_price,closing_time,seller,bidder,picture,status) VALUES (7,'Richards','21.99','21.99','2022-02-16 08:17:18','gbartlet6@addthis.com','bgable3@freewebs.com','7.png','No');
INSERT INTO auction_product (p_id,p_name,price_min,current_price,closing_time,seller,bidder,picture,status) VALUES (8,'Vaughan','69.36','69.36','2023-06-24 05:32:59','rdacca7@census.gov','mskinner2@t.co','8.png','No');
INSERT INTO auction_product (p_id,p_name,price_min,current_price,closing_time,seller,bidder,picture,status) VALUES (9,'Weiss','22.53','23','2033-10-02 12:59:04','iexposito8@geocities.com','bpeirazzi1@pinterest.com','9.png','No');
INSERT INTO auction_product (p_id,p_name,price_min,current_price,closing_time,seller,bidder,picture,status) VALUES (10,'Gibson','49.83','49.83','2021-07-15 06:53:39','ckeasyb@uol.com.br','dorniz0@forbes.com','10.png','No');
INSERT INTO auction_product (p_id,p_name,price_min,current_price,closing_time,seller,bidder,picture,status) VALUES (11,'Wolf','117.62','118','2021-04-10 22:33:24','mtabourc@blinklist.com','hhuncooth@nps.gov','11.png','Yes');
INSERT INTO auction_product (p_id,p_name,price_min,current_price,closing_time,seller,bidder,picture,status) VALUES (12,'Vang','33.29','34','2021-12-23 23:43:06','ckidneyd@reference.com','cwiltshireg@wikimedia.org','12.png','Yes');
INSERT INTO auction_product (p_id,p_name,price_min,current_price,closing_time,seller,bidder,picture,status) VALUES (13,'Pickett','27.93','28','2021-12-13 02:57:28','kmessume@craigslist.org','ccarvilf@nhs.uk','13.png','Yes');
INSERT INTO auction_product (p_id,p_name,price_min,current_price,closing_time,seller,bidder,picture,status) VALUES (14,'Gibson','22.63','23','2021-09-16 06:57:40','ccarvilf@nhs.uk','kmessume@craigslist.org','14.png','Yes');
INSERT INTO auction_product (p_id,p_name,price_min,current_price,closing_time,seller,bidder,picture,status) VALUES (15,'Blankenship','14.50','15','2022-07-11 21:58:56','bpeirazzi1@pinterest.com','mtabourc@blinklist.com','16.png','Yes');
INSERT INTO auction_product (p_id,p_name,price_min,current_price,closing_time,seller,bidder,picture,status) VALUES (16,'Knight','22.75','23','2021-12-04 22:26:32','dorniz0@forbes.com','ckeasyb@uol.com.br','17.png','Yes');
INSERT INTO auction_product (p_id,p_name,price_min,current_price,closing_time,seller,bidder,picture,status) VALUES (17,'Avila','90.33','100','2022-03-05 11:18:01','gtwatti@netvibes.com','ltilzeya@github.com','18.png','Yes');
INSERT INTO auction_product (p_id,p_name,price_min,current_price,closing_time,seller,bidder,picture,status) VALUES (18,'Davis','77.87','78','2022-05-26 16:15:23','gbartlet6@addthis.com','hhuncooth@nps.gov','19.png','No');
INSERT INTO auction_product (p_id,p_name,price_min,current_price,closing_time,seller,bidder,picture,status) VALUES (19,'Bright','500.87','501','2020-09-25 21:56:58','rkovalski4@google.com.au','gtwatti@netvibes.com','20.png','No');
-- INSERT DATA INTO 'ADMIN' TABLE
insert into admin (a_email, a_password) values ('jsawnwy0@tuttocitta.it', 'gPKc9Tz');
insert into admin (a_email, a_password) values ('pklais1@vistaprint.com', 'xCdpnDycKcy');
insert into admin (a_email, a_password) values ('fpaulitschke2@opensource.org', 'N0naYnbkp');
insert into admin (a_email, a_password) values ('bswidenbank3@ehow.com', 'J64ZiV');
insert into admin (a_email, a_password) values ('awight4@nsw.gov.au', 'hq44Lz8y2khN');
-- INSERT DATA INTO 'NOTIFICATION' TABLE
INSERT INTO notification (n_id,buyer,note,status) VALUES (1,'dorniz0@forbes.com','tortor nibh sit amet orci.','No');
INSERT INTO notification (n_id,buyer,note,status) VALUES (2,'ltilzeya@github.com','Vestibulum ante ipsum primis in faucibus orci luctus et ultrices','Yes');
INSERT INTO notification (n_id,buyer,note,status) VALUES (3,'cwiltshireg@wikimedia.org','dignissim  aucs. Aliquam rutrum lorem ac risus.','Yes');
INSERT INTO notification (n_id,buyer,note,status) VALUES (4,'hhuncooth@nps.gov','est. Nunc ullamcorper, velit in','Yes');
INSERT INTO notification (n_id,buyer,note,status) VALUES (5,'mskinner2@t.co','Donec nibh. Quisque nonummy ipsum non arcu. Vivamus sit amet','No');
INSERT INTO notification (n_id,buyer,note,status) VALUES (6,'bgable3@freewebs.com','vitae','No');
INSERT INTO notification (n_id,buyer,note,status) VALUES (7,'rkovalski4@google.com.au','porttitor scelerisque neque. Nullam nisl. Maecenas','Yes');
INSERT INTO notification (n_id,buyer,note,status) VALUES (8,'rkovalski4@google.com.au','tincidunt, neque vitae semper egestas, urna justo faucibus','Yes');
INSERT INTO notification (n_id,buyer,note,status) VALUES (9,'rdacca7@census.gov','porttitor scelerisque neque. Nullam nisl. Maecenas malesuada fringilla est. Mauris','Yes');
INSERT INTO notification (n_id,buyer,note,status) VALUES (10,'gtwatti@netvibes.com','vulputate,  aucs. Cras interdum. Nunc sollicitudin commodo ipsum. Suspendisse non','Yes');

-- INSERT DATA INTO 'BIDS' TABLE
INSERT INTO bids (product_id,seller,bidder,b_id,offer_price,offer_time,status) VALUES (1,'gtwatti@netvibes.com','bgable3@freewebs.com',3,60.22,'2020-11-17 16:55:15','win');
INSERT INTO bids (product_id,seller,bidder,b_id,offer_price,offer_time,status) VALUES (2,'ckeasyb@uol.com.br','rkovalski4@google.com.au',7,53.83,'2022-01-06 14:00:19','lose');
INSERT INTO bids (product_id,seller,bidder,b_id,offer_price,offer_time,status) VALUES (3,'mtabourc@blinklist.com','iexposito8@geocities.com',8,54.64,'2021-03-05 19:59:08','win');
INSERT INTO bids (product_id,seller,bidder,b_id,offer_price,offer_time,status) VALUES (4,'ckidneyd@reference.com','ltilzeya@github.com',9,52.40,'2021-07-24 23:54:39','lose');
INSERT INTO bids (product_id,seller,bidder,b_id,offer_price,offer_time,status) VALUES (5,'bpeirazzi1@pinterest.com','cwiltshireg@wikimedia.org',2,25.38,'2022-01-26 19:21:50','win');
INSERT INTO bids (product_id,seller,bidder,b_id,offer_price,offer_time,status) VALUES (6,'iexposito8@geocities.com','gtwatti@netvibes.com',1,58.01,'2022-07-10 08:41:28','lose');
INSERT INTO bids (product_id,seller,bidder,b_id,offer_price,offer_time,status) VALUES (7,'dorniz0@forbes.com','mtabourc@blinklist.com',6,44.75,'2021-10-21 16:53:50','win');
INSERT INTO bids (product_id,seller,bidder,b_id,offer_price,offer_time,status) VALUES (8,'smasurel5@wired.com','ckeasyb@uol.com.br',4,85.38,'2020-09-26 02:08:38','lose');
INSERT INTO bids (product_id,seller,bidder,b_id,offer_price,offer_time,status) VALUES (9,'bgable3@freewebs.com','dorniz0@forbes.com',5,98.32,'2022-03-14 02:54:21','win');
INSERT INTO bids (product_id,seller,bidder,b_id,offer_price,offer_time,status) VALUES (10,'gbartlet6@addthis.com','rdacca7@census.gov',10,14.42,'2022-09-06 01:48:48','win');

-- INSERT DATA INTO 'TRANSACTION' TABLE
INSERT INTO `transaction` (`t_id`,`start_time`,`end_time`,`t_amount`,`t_seller`,`pro_id`,`win_bidder`) VALUES (1,'2021-02-03 12:07:46','2021-12-18 23:21:57','100.92','gtwatti@netvibes.com',1,'bgable3@freewebs.com');
INSERT INTO `transaction` (`t_id`,`start_time`,`end_time`,`t_amount`,`t_seller`,`pro_id`,`win_bidder`) VALUES (2,'2021-10-13 23:51:22','2022-02-14 20:53:23','300.15','ckeasyb@uol.com.br',2,'rkovalski4@google.com.au');
INSERT INTO `transaction` (`t_id`,`start_time`,`end_time`,`t_amount`,`t_seller`,`pro_id`,`win_bidder`) VALUES (3,'2022-02-15 04:49:39','2022-07-27 23:00:05','400.15','mtabourc@blinklist.com',3,'iexposito8@geocities.com');
INSERT INTO `transaction` (`t_id`,`start_time`,`end_time`,`t_amount`,`t_seller`,`pro_id`,`win_bidder`) VALUES (4,'2021-07-17 02:20:09','2022-03-15 10:29:58','400.51','ckidneyd@reference.com',4,'ltilzeya@github.com');
INSERT INTO `transaction` (`t_id`,`start_time`,`end_time`,`t_amount`,`t_seller`,`pro_id`,`win_bidder`) VALUES (5,'2021-04-15 01:18:14','2020-10-20 06:58:22','800.32','bpeirazzi1@pinterest.com',5,'cwiltshireg@wikimedia.org');
INSERT INTO `transaction` (`t_id`,`start_time`,`end_time`,`t_amount`,`t_seller`,`pro_id`,`win_bidder`) VALUES (6,'2020-09-30 11:13:25','2020-12-13 00:02:36','800.17','iexposito8@geocities.com',6,'gtwatti@netvibes.com');
INSERT INTO `transaction` (`t_id`,`start_time`,`end_time`,`t_amount`,`t_seller`,`pro_id`,`win_bidder`) VALUES (7,'2021-03-06 12:09:45','2021-08-22 11:33:36','900.38','dorniz0@forbes.com',7,'mtabourc@blinklist.com');
INSERT INTO `transaction` (`t_id`,`start_time`,`end_time`,`t_amount`,`t_seller`,`pro_id`,`win_bidder`) VALUES (8,'2021-01-02 19:09:36','2020-10-09 21:24:02','700.62','smasurel5@wired.com',8,'ckeasyb@uol.com.br');
INSERT INTO `transaction` (`t_id`,`start_time`,`end_time`,`t_amount`,`t_seller`,`pro_id`,`win_bidder`) VALUES (9,'2021-12-20 08:20:39','2022-09-03 09:39:06','700.27','bgable3@freewebs.com',9,'dorniz0@forbes.com');
INSERT INTO `transaction` (`t_id`,`start_time`,`end_time`,`t_amount`,`t_seller`,`pro_id`,`win_bidder`) VALUES (10,'2020-10-15 02:24:14','2020-11-09 17:38:47','200.14','gbartlet6@addthis.com',10,'rdacca7@census.gov');




