
use test;
drop table transaction;
drop table bids;
drop table notification;
drop table admin;
drop table auction_product;
drop table customer_account;
drop table branch;


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





/*
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
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance, registered_branch) values (1, 'Demetria', 'Orniz', 'dorniz0@forbes.com', '7788169754', '2MTnEm5IJ', '8121 Arrowood Place', 'Izmaylovo', 'Russia', 'http://dummyimage.com/237x100.png/ff4444/ffffff', 91.8,10);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance, registered_branch) values (2, 'Blaire', 'Peirazzi', 'bpeirazzi1@pinterest.com', '4803845551', 'gaUjLyl3BLU', '4 Memorial Lane', 'Baishan', 'China', 'http://dummyimage.com/179x100.png/5fa2dd/ffffff', 804.14,9);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance, registered_branch) values (3, 'Marquita', 'Skinner', 'mskinner2@t.co', '4076594684', 'a44i1GOM', '48404 Atwood Street', 'Orlando', 'United States', 'http://dummyimage.com/137x100.png/5fa2dd/ffffff', 887.42,8);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance, registered_branch) values (4, 'Berke', 'Gable', 'bgable3@freewebs.com', '7899825450', '0T6nBEQM', '63613 Moose Terrace', 'Néa Ionía', 'Greece', 'http://dummyimage.com/159x100.png/dddddd/000000', 860.61,7);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance, registered_branch) values (5, 'Roberto', 'Kovalski', 'rkovalski4@google.com.au', '6951852041', 'baBP9omQQ6', '69760 Hansons Hill', 'Río de Oro', 'Colombia', 'http://dummyimage.com/135x100.png/dddddd/000000', 871.27,6);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance, registered_branch) values (6, 'Shawnee', 'Masurel', 'smasurel5@wired.com', '6886452552', 'SvqSSw', '270 Sunfield Hill', 'Lukou', 'China', 'http://dummyimage.com/150x100.png/ff4444/ffffff', 725.72,5);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance, registered_branch) values (7, 'Guss', 'Bartlet', 'gbartlet6@addthis.com', '9805219964', '8LC6GVarhZq', '19862 Springview Crossing', 'Jingyu', 'China', 'http://dummyimage.com/213x100.png/5fa2dd/ffffff', 453.96,1);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance, registered_branch) values (8, 'Rolando', 'Dacca', 'rdacca7@census.gov', '4816331206', '6HpCYOf', '36399 Autumn Leaf Pass', 'Fuzhai', 'China', 'http://dummyimage.com/207x100.png/ff4444/ffffff', 585.19,2);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance, registered_branch) values (9, 'Issi', 'Exposito', 'iexposito8@geocities.com', '8424541241', 'GAzlJVRMUB', '14 Calypso Hill', 'Hwaseong-si', 'South Korea', 'http://dummyimage.com/127x100.png/5fa2dd/ffffff', 964.5,3);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance, registered_branch) values (10, 'Denny', 'MacCorley', 'dmaccorley9@jiathis.com', '4802078830', 'GNHlc32gZjF', '247 Lake View Lane', 'Mesa', 'United States', 'http://dummyimage.com/219x100.png/dddddd/000000', 283.44,4);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance, registered_branch) values (11, 'Laurent', 'Tilzey', 'ltilzeya@github.com', '5071839114', 'yYSlGd', '6077 Vahlen Hill', 'Osby', 'Sweden', 'http://dummyimage.com/106x100.png/cc0000/ffffff', 250.29,8);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance, registered_branch) values (12, 'Chaddy', 'Keasy', 'ckeasyb@uol.com.br', '1733761136', 'ABgX8armqEH', '82 Mccormick Point', 'Pitai', 'Indonesia', 'http://dummyimage.com/120x100.png/cc0000/ffffff', 294.38,4);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance, registered_branch) values (13, 'Malinda', 'Tabour', 'mtabourc@blinklist.com', '4281820296', 'ar8nUOV', '3157 Park Meadow Road', 'Calvão', 'Portugal', 'http://dummyimage.com/177x100.png/ff4444/ffffff', 337.84,6);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance, registered_branch) values (14, 'Chance', 'Kidney', 'ckidneyd@reference.com', '9724774908', 'tk4vlJl', '5305 Crowley Hill', 'Hucheng', 'China', 'http://dummyimage.com/138x100.png/dddddd/000000', 346.38,3);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance, registered_branch) values (15, 'Karmen', 'Messum', 'kmessume@craigslist.org', '6861300324', 'nLJGcCbtZ7J', '9056 Londonderry Junction', 'Kanie', 'Japan', 'http://dummyimage.com/149x100.png/ff4444/ffffff', 893.11,1);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance, registered_branch) values (16, 'Claudio', 'Carvil', 'ccarvilf@nhs.uk', '5815471246', 'V6acEuPQNvh', '123 Morning Crossing', 'Ar Rumaythah', 'Iraq', 'http://dummyimage.com/196x100.png/ff4444/ffffff', 647.99,7);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance, registered_branch) values (17, 'Chandal', 'Wiltshire', 'cwiltshireg@wikimedia.org', '7314661428', 'Xe7yvIgULu', '08534 Mendota Circle', 'Perniö', 'Finland', 'http://dummyimage.com/183x100.png/dddddd/000000', 699.32,5);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance, registered_branch) values (18, 'Hube', 'Huncoot', 'hhuncooth@nps.gov', '2916540633', 'MD8jF6p', '43246 Nancy Court', 'Shijie', 'China', 'http://dummyimage.com/107x100.png/dddddd/000000', 606.75,1);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance, registered_branch) values (19, 'Gaylord', 'Twatt', 'gtwatti@netvibes.com', '3121243341', '07NJz5zeiqs', '45952 Ramsey Crossing', 'Denton', 'United Kingdom', 'http://dummyimage.com/249x100.png/cc0000/ffffff', 358.0,2);

 -- INSERT DATA INTO 'AUCTION_PRODUCT' TABLE
INSERT INTO auction_product (p_id,p_name,price_min,current_price,closing_time,seller,picture,status) VALUES (1,'Dejesus','99.94','300','2025-09-19 12:11:17',9,'1.png','No');
INSERT INTO auction_product (p_id,p_name,price_min,current_price,closing_time,seller,picture,status) VALUES (2,'Leblanc','10.22','10.22','2024-06-17 22:09:42',2,'2.png','No');
INSERT INTO auction_product (p_id,p_name,price_min,current_price,closing_time,seller,picture,status) VALUES (3,'Santiago','50.04','50.04','2022-06-17 03:46:02',3,'3.png','Yes');
INSERT INTO auction_product (p_id,p_name,price_min,current_price,closing_time,seller,picture,status) VALUES (4,'Bond','423.10','430','2026-02-12 02:02:51',4,'4.png','No');
INSERT INTO auction_product (p_id,p_name,price_min,current_price,closing_time,seller,picture,status) VALUES (5,'Parrish','54.32','55','2027-10-16 12:26:28',5,'5.png','No');
INSERT INTO auction_product (p_id,p_name,price_min,current_price,closing_time,seller,picture,status) VALUES (6,'Bruce','83.89','100','2027-10-13 05:55:27',6,'6.png','No');
INSERT INTO auction_product (p_id,p_name,price_min,current_price,closing_time,seller,picture,status) VALUES (7,'Richards','21.99','21.99','2022-02-16 08:17:18',7,'7.png','No');
INSERT INTO auction_product (p_id,p_name,price_min,current_price,closing_time,seller,picture,status) VALUES (8,'Vaughan','69.36','69.36','2023-06-24 05:32:59',8,'8.png','No');
INSERT INTO auction_product (p_id,p_name,price_min,current_price,closing_time,seller,picture,status) VALUES (9,'Weiss','22.53','23','2033-10-02 12:59:04',9,'9.png','No');
INSERT INTO auction_product (p_id,p_name,price_min,current_price,closing_time,seller,picture,status) VALUES (10,'Gibson','49.83','49.83','2021-07-15 06:53:39',12,'10.png','No');
INSERT INTO auction_product (p_id,p_name,price_min,current_price,closing_time,seller,picture,status) VALUES (11,'Wolf','117.62','118','2021-04-10 22:33:24',13,'11.png','Yes');
INSERT INTO auction_product (p_id,p_name,price_min,current_price,closing_time,seller,picture,status) VALUES (12,'Vang','33.29','34','2021-12-23 23:43:06',14,'12.png','Yes');
INSERT INTO auction_product (p_id,p_name,price_min,current_price,closing_time,seller,picture,status) VALUES (13,'Pickett','27.93','28','2021-12-13 02:57:28',15,'13.png','Yes');
INSERT INTO auction_product (p_id,p_name,price_min,current_price,closing_time,seller,picture,status) VALUES (14,'Gibson','22.63','23','2021-09-16 06:57:40',16,'14.png','Yes');
INSERT INTO auction_product (p_id,p_name,price_min,current_price,closing_time,seller,picture,status) VALUES (15,'Grimes','70.07','71','2022-03-25 07:58:03',17,1,'No');
INSERT INTO auction_product (p_id,p_name,price_min,current_price,closing_time,seller,picture,status) VALUES (16,'Blankenship','14.50','15','2022-07-11 21:58:56',2,'16.png','Yes');
INSERT INTO auction_product (p_id,p_name,price_min,current_price,closing_time,seller,picture,status) VALUES (17,'Knight','22.75','23','2021-12-04 22:26:32',1,'17.png','Yes');
INSERT INTO auction_product (p_id,p_name,price_min,current_price,closing_time,seller,picture,status) VALUES (18,'Avila','90.33','100','2022-03-05 11:18:01',19,'18.png','Yes');
INSERT INTO auction_product (p_id,p_name,price_min,current_price,closing_time,seller,picture,status) VALUES (19,'Davis','77.87','78','2022-05-26 16:15:23',7,'19.png','No');
INSERT INTO auction_product (p_id,p_name,price_min,current_price,closing_time,seller,picture,status) VALUES (20,'Bright','500.87','501','2020-09-25 21:56:58',5,'20.png','No');

-- INSERT DATA INTO 'ADMIN' TABLE
insert into admin (a_email, a_password) values ('jsawnwy0@tuttocitta.it', 'gPKc9Tz');
insert into admin (a_email, a_password) values ('pklais1@vistaprint.com', 'xCdpnDycKcy');
insert into admin (a_email, a_password) values ('fpaulitschke2@opensource.org', 'N0naYnbkp');
insert into admin (a_email, a_password) values ('bswidenbank3@ehow.com', 'J64ZiV');
insert into admin (a_email, a_password) values ('awight4@nsw.gov.au', 'hq44Lz8y2khN');

-- INSERT DATA INTO 'NOTIFICATION' TABLE
INSERT INTO notification (n_id,buyer,note,status) VALUES (1,1,'tortor nibh sit amet orci.','No');
INSERT INTO notification (n_id,buyer,note,status) VALUES (2,11,'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices','Yes');
INSERT INTO notification (n_id,buyer,note,status) VALUES (3,17,'dignissim  aucs. Aliquam rutrum lorem ac risus.','Yes');
INSERT INTO notification (n_id,buyer,note,status) VALUES (4,18,'est. Nunc ullamcorper, velit in','Yes');
INSERT INTO notification (n_id,buyer,note,status) VALUES (5,3,'Donec nibh. Quisque nonummy ipsum non arcu. Vivamus sit amet','No');
INSERT INTO notification (n_id,buyer,note,status) VALUES (6,4,'vitae','No');
INSERT INTO notification (n_id,buyer,note,status) VALUES (7,5,'porttitor scelerisque neque. Nullam nisl. Maecenas','Yes');
INSERT INTO notification (n_id,buyer,note,status) VALUES (8,5,'tincidunt, neque vitae semper egestas, urna justo faucibus','Yes');
INSERT INTO notification (n_id,buyer,note,status) VALUES (9,8,'porttitor scelerisque neque. Nullam nisl. Maecenas malesuada fringilla est. Mauris','Yes');
INSERT INTO notification (n_id,buyer,note,status) VALUES (10,19,'vulputate,  aucs. Cras interdum. Nunc sollicitudin commodo ipsum. Suspendisse non','Yes');


-- INSERT DATA INTO 'BIDS' TABLE
INSERT INTO bids (product_id,seller,bidder,b_id,offer_price,offer_time) VALUES (1,19,4,3,60.22,'2020-11-17 16:55:15');
INSERT INTO bids (product_id,seller,bidder,b_id,offer_price,offer_time) VALUES (2,12,5,7,53.83,'2022-01-06 14:00:19');
INSERT INTO bids (product_id,seller,bidder,b_id,offer_price,offer_time) VALUES (3,13,9,8,54.64,'2021-03-05 19:59:08');
INSERT INTO bids (product_id,seller,bidder,b_id,offer_price,offer_time) VALUES (4,14,11,9,52.40,'2021-07-24 23:54:39');
INSERT INTO bids (product_id,seller,bidder,b_id,offer_price,offer_time) VALUES (5,2,17,2,25.38,'2022-01-26 19:21:50');
INSERT INTO bids (product_id,seller,bidder,b_id,offer_price,offer_time) VALUES (6,9,19,1,58.01,'2022-07-10 08:41:28');
INSERT INTO bids (product_id,seller,bidder,b_id,offer_price,offer_time) VALUES (7,1,13,6,44.75,'2021-10-21 16:53:50');
INSERT INTO bids (product_id,seller,bidder,b_id,offer_price,offer_time) VALUES (8,6,12,4,85.38,'2020-09-26 02:08:38');
INSERT INTO bids (product_id,seller,bidder,b_id,offer_price,offer_time) VALUES (9,4,1,5,98.32,'2022-03-14 02:54:21');
INSERT INTO bids (product_id,seller,bidder,b_id,offer_price,offer_time) VALUES (10,7,8,10,14.42,'2022-09-06 01:48:48');

-- INSERT DATA INTO 'TRANSACTION' TABLE

INSERT INTO `transaction` (`t_id`,`start_time`,`end_time`,`t_amount`,`t_seller`,`pro_id`,`win_bidder`) VALUES (1,'2021-02-03 12:07:46','2021-12-18 23:21:57','100.92','19',1,'4');
INSERT INTO `transaction` (`t_id`,`start_time`,`end_time`,`t_amount`,`t_seller`,`pro_id`,`win_bidder`) VALUES (2,'2021-10-13 23:51:22','2022-02-14 20:53:23','300.15','12',2,'5');
INSERT INTO `transaction` (`t_id`,`start_time`,`end_time`,`t_amount`,`t_seller`,`pro_id`,`win_bidder`) VALUES (3,'2022-02-15 04:49:39','2022-07-27 23:00:05','400.15','13',3,'9');
INSERT INTO `transaction` (`t_id`,`start_time`,`end_time`,`t_amount`,`t_seller`,`pro_id`,`win_bidder`) VALUES (4,'2021-07-17 02:20:09','2022-03-15 10:29:58','400.51','14',4,'11');
INSERT INTO `transaction` (`t_id`,`start_time`,`end_time`,`t_amount`,`t_seller`,`pro_id`,`win_bidder`) VALUES (5,'2021-04-15 01:18:14','2020-10-20 06:58:22','800.32','2',5,'17');
INSERT INTO `transaction` (`t_id`,`start_time`,`end_time`,`t_amount`,`t_seller`,`pro_id`,`win_bidder`) VALUES (6,'2020-09-30 11:13:25','2020-12-13 00:02:36','800.17','9',6,'19');
INSERT INTO `transaction` (`t_id`,`start_time`,`end_time`,`t_amount`,`t_seller`,`pro_id`,`win_bidder`) VALUES (7,'2021-03-06 12:09:45','2021-08-22 11:33:36','900.38','1',7,'13');
INSERT INTO `transaction` (`t_id`,`start_time`,`end_time`,`t_amount`,`t_seller`,`pro_id`,`win_bidder`) VALUES (8,'2021-01-02 19:09:36','2020-10-09 21:24:02','700.62','6',8,'12');
INSERT INTO `transaction` (`t_id`,`start_time`,`end_time`,`t_amount`,`t_seller`,`pro_id`,`win_bidder`) VALUES (9,'2021-12-20 08:20:39','2022-09-03 09:39:06','700.27','4',9,'1');
INSERT INTO `transaction` (`t_id`,`start_time`,`end_time`,`t_amount`,`t_seller`,`pro_id`,`win_bidder`) VALUES (10,'2020-10-15 02:24:14','2020-11-09 17:38:47','200.14','7',10,'8');
