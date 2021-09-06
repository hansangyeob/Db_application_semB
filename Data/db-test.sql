# create table branch(
#     b_code int(8) auto_increment,
#     b_name varchar(30),
#     address varchar(100),
#     hotline_num varchar(10),
#     primary key (b_code),
#     unique (b_code, b_name)
# );

# create table customer_account(
#     i_num int(20) not null,
#     f_name varchar(200) not null,
#     l_name varchar(200) not null,
#     email varchar(50) not null,
#     phone varchar(10) not null,
#     password char(48) not null,
#     address varchar(255),
#     city varchar(100),
#     country varchar(100),
#     profile_pic blob,
#     balance int not null,
#     primary key (i_num),
#     Unique (email, phone, i_num)
# );

-- create table auction_product(
--     p_id int(8) AUTO_INCREMENT,
--     p_name varchar(20) not null,
--     price_min decimal not null,
--     closing_time datetime,
--     seller varchar(255),
--     buyer varchar(255),
--     status boolean,
--     picture BLOB,
--     primary key (p_id)
-- );
create database test_no_key;
use test;

CREATE TABLE `branch` (
  `b_code` mediumint(8) unsigned NOT NULL auto_increment,
  `b_name` varchar(50),
  `address` varchar(255) default NULL,
  `hotline_num` varchar(100) default NULL,
  PRIMARY KEY (`b_code`),
  unique (b_code, b_name)
) AUTO_INCREMENT=1;

create table customer_account (
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
    primary key (i_num),
    unique (email, phone, i_num)
);

CREATE TABLE auction_product (
  `p_id` mediumint(8) unsigned NOT NULL auto_increment,
  `p_name` varchar(255) NOT NULL,
  `price_min` decimal NOT NULL,
  `closing_time` datetime,
  `seller` varchar(255),
  `buyer` varchar(255),
  `picture` blob,
  `status` varchar(4),
  PRIMARY KEY (`p_id`)
,foreign key (seller) references customer_account(i_num),
foreign key (buyer) references customer_account(i_num)
) AUTO_INCREMENT=1;


create table admin(
    a_email varchar(255),
    a_password varchar(255)
);

create table notification(
    n_id int(8) AUTO_INCREMENT,
    buyer varchar(255),
    note varchar(255),
    status varchar(255),
    primary key(n_id)
    ,foreign key (buyeR) references customer_account(i_num)
);

drop table bids;
create table bids(
    b_id int(8) not null auto_increment,
    bidder varchar(255),
    product_id mediumint(8),
    offer_price decimal(8,2),
    offer_time datetime,
  primary key (b_id)
  ,foreign key (bidder) references customer_account(i_num),
    foreign key (product_id) references auction_product(p_id)
);

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
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (1, 'Demetria', 'Orniz', 'dorniz0@forbes.com', '7788169754', '2MTnEm5IJ', '8121 Arrowood Place', 'Izmaylovo', 'Russia', 'http://dummyimage.com/237x100.png/ff4444/ffffff', 91.8);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (2, 'Blaire', 'Peirazzi', 'bpeirazzi1@pinterest.com', '4803845551', 'gaUjLyl3BLU', '4 Memorial Lane', 'Baishan', 'China', 'http://dummyimage.com/179x100.png/5fa2dd/ffffff', 804.14);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (3, 'Marquita', 'Skinner', 'mskinner2@t.co', '4076594684', 'a44i1GOM', '48404 Atwood Street', 'Orlando', 'United States', 'http://dummyimage.com/137x100.png/5fa2dd/ffffff', 887.42);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (4, 'Berke', 'Gable', 'bgable3@freewebs.com', '7899825450', '0T6nBEQM', '63613 Moose Terrace', 'Néa Ionía', 'Greece', 'http://dummyimage.com/159x100.png/dddddd/000000', 860.61);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (5, 'Roberto', 'Kovalski', 'rkovalski4@google.com.au', '6951852041', 'baBP9omQQ6', '69760 Hansons Hill', 'Río de Oro', 'Colombia', 'http://dummyimage.com/135x100.png/dddddd/000000', 871.27);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (6, 'Shawnee', 'Masurel', 'smasurel5@wired.com', '6886452552', 'SvqSSw', '270 Sunfield Hill', 'Lukou', 'China', 'http://dummyimage.com/150x100.png/ff4444/ffffff', 725.72);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (7, 'Guss', 'Bartlet', 'gbartlet6@addthis.com', '9805219964', '8LC6GVarhZq', '19862 Springview Crossing', 'Jingyu', 'China', 'http://dummyimage.com/213x100.png/5fa2dd/ffffff', 453.96);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (8, 'Rolando', 'Dacca', 'rdacca7@census.gov', '4816331206', '6HpCYOf', '36399 Autumn Leaf Pass', 'Fuzhai', 'China', 'http://dummyimage.com/207x100.png/ff4444/ffffff', 585.19);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (9, 'Issi', 'Exposito', 'iexposito8@geocities.com', '8424541241', 'GAzlJVRMUB', '14 Calypso Hill', 'Hwaseong-si', 'South Korea', 'http://dummyimage.com/127x100.png/5fa2dd/ffffff', 964.5);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (10, 'Denny', 'MacCorley', 'dmaccorley9@jiathis.com', '4802078830', 'GNHlc32gZjF', '247 Lake View Lane', 'Mesa', 'United States', 'http://dummyimage.com/219x100.png/dddddd/000000', 283.44);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (10, 'Denny', 'MacCorley', 'dmaccorley9@jiathis.com', '4802078830', 'GNHlc32gZjF', '247 Lake View Lane', 'Mesa', 'United States', 'http://dummyimage.com/219x100.png/dddddd/000000', 283.44);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (11, 'Laurent', 'Tilzey', 'ltilzeya@github.com', '5071839114', 'yYSlGd', '6077 Vahlen Hill', 'Osby', 'Sweden', 'http://dummyimage.com/106x100.png/cc0000/ffffff', 250.29);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (12, 'Chaddy', 'Keasy', 'ckeasyb@uol.com.br', '1733761136', 'ABgX8armqEH', '82 Mccormick Point', 'Pitai', 'Indonesia', 'http://dummyimage.com/120x100.png/cc0000/ffffff', 294.38);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (13, 'Malinda', 'Tabour', 'mtabourc@blinklist.com', '4281820296', 'ar8nUOV', '3157 Park Meadow Road', 'Calvão', 'Portugal', 'http://dummyimage.com/177x100.png/ff4444/ffffff', 337.84);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (14, 'Chance', 'Kidney', 'ckidneyd@reference.com', '9724774908', 'tk4vlJl', '5305 Crowley Hill', 'Hucheng', 'China', 'http://dummyimage.com/138x100.png/dddddd/000000', 346.38);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (15, 'Karmen', 'Messum', 'kmessume@craigslist.org', '6861300324', 'nLJGcCbtZ7J', '9056 Londonderry Junction', 'Kanie', 'Japan', 'http://dummyimage.com/149x100.png/ff4444/ffffff', 893.11);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (16, 'Claudio', 'Carvil', 'ccarvilf@nhs.uk', '5815471246', 'V6acEuPQNvh', '123 Morning Crossing', 'Ar Rumaythah', 'Iraq', 'http://dummyimage.com/196x100.png/ff4444/ffffff', 647.99);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (17, 'Chandal', 'Wiltshire', 'cwiltshireg@wikimedia.org', '7314661428', 'Xe7yvIgULu', '08534 Mendota Circle', 'Perniö', 'Finland', 'http://dummyimage.com/183x100.png/dddddd/000000', 699.32);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (18, 'Hube', 'Huncoot', 'hhuncooth@nps.gov', '2916540633', 'MD8jF6p', '43246 Nancy Court', 'Shijie', 'China', 'http://dummyimage.com/107x100.png/dddddd/000000', 606.75);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (19, 'Gaylord', 'Twatt', 'gtwatti@netvibes.com', '3121243341', '07NJz5zeiqs', '45952 Ramsey Crossing', 'Denton', 'United Kingdom', 'http://dummyimage.com/249x100.png/cc0000/ffffff', 358.0);

-- INSERT DATA INTO 'AUCTION_PRODUCT' TABLE
INSERT INTO auction_product (p_id,p_name,price_min,closing_time,seller,buyer,picture,status) VALUES (1,'Dejesus','9.94','2025-09-19 12:11:17',9,1,'1.png','No');
INSERT INTO auction_product (p_id,p_name,price_min,closing_time,seller,buyer,picture,status) VALUES (2,'Leblanc','0.22','2024-06-17 22:09:42',4,20,'2.png','No');
INSERT INTO auction_product (p_id,p_name,price_min,closing_time,seller,buyer,picture,status) VALUES (3,'Santiago','5.04','2022-06-17 03:46:02',5,17,'3.png','Yes');
INSERT INTO auction_product (p_id,p_name,price_min,closing_time,seller,buyer,picture,status) VALUES (4,'Bond','4.10','2026-02-12 02:02:51',2,16,'4.png','No');
INSERT INTO auction_product (p_id,p_name,price_min,closing_time,seller,buyer,picture,status) VALUES (5,'Parrish','5.32','2027-10-16 12:26:28',7,15,'5.png','No');
INSERT INTO auction_product (p_id,p_name,price_min,closing_time,seller,buyer,picture,status) VALUES (6,'Bruce','8.89','2027-10-13 05:55:27',5,13,'6.png','No');
INSERT INTO auction_product (p_id,p_name,price_min,closing_time,seller,buyer,picture,status) VALUES (7,'Richards','1.99','2022-02-16 08:17:18',6,12,'7.png','No');
INSERT INTO auction_product (p_id,p_name,price_min,closing_time,seller,buyer,picture,status) VALUES (8,'Vaughan','6.36','2023-06-24 05:32:59',4,11,'8.png','No');
INSERT INTO auction_product (p_id,p_name,price_min,closing_time,seller,buyer,picture,status) VALUES (9,'Weiss','9.53','2033-10-02 12:59:04',3,4,'9.png','No');
INSERT INTO auction_product (p_id,p_name,price_min,closing_time,seller,buyer,picture,status) VALUES (10,'Gibson','9.83','2021-07-15 06:53:39',2,7,'10.png','No');
INSERT INTO auction_product (p_id,p_name,price_min,closing_time,seller,buyer,picture,status) VALUES (11,'Wolf','7.62','2021-04-10 22:33:24',1,3,'11.png','Yes');
INSERT INTO auction_product (p_id,p_name,price_min,closing_time,seller,buyer,picture,status) VALUES (12,'Vang','3.29','2021-12-23 23:43:06',7,12,'12.png','Yes');
INSERT INTO auction_product (p_id,p_name,price_min,closing_time,seller,buyer,picture,status) VALUES (13,'Pickett','2.93','2021-12-13 02:57:28',3,10,'13.png','Yes');
INSERT INTO auction_product (p_id,p_name,price_min,closing_time,seller,buyer,picture,status) VALUES (14,'Gibson','2.63','2021-09-16 06:57:40',12,19,'14.png','Yes');
INSERT INTO auction_product (p_id,p_name,price_min,closing_time,seller,buyer,picture,status) VALUES (15,'Grimes','7.07','2022-03-25 07:58:03',19,8,'15.png','No');
INSERT INTO auction_product (p_id,p_name,price_min,closing_time,seller,buyer,picture,status) VALUES (16,'Blankenship','4.50','2022-07-11 21:58:56',2,7,'16.png','Yes');
INSERT INTO auction_product (p_id,p_name,price_min,closing_time,seller,buyer,picture,status) VALUES (17,'Knight','7.75','2021-12-04 22:26:32',1,13,'17.png','Yes');
INSERT INTO auction_product (p_id,p_name,price_min,closing_time,seller,buyer,picture,status) VALUES (18,'Avila','9.33','2022-03-05 11:18:01',1,1,'18.png','Yes');
INSERT INTO auction_product (p_id,p_name,price_min,closing_time,seller,buyer,picture,status) VALUES (19,'Davis','7.87','2022-05-26 16:15:23',7,19,'19.png','No');
INSERT INTO auction_product (p_id,p_name,price_min,closing_time,seller,buyer,picture,status) VALUES (20,'Bright','9.87','2020-09-25 21:56:58',17,17,'20.png','No');


-- INSERT DATA INTO 'ADMIN' TABLE
insert into admin (a_email, a_password) values ('jsawnwy0@tuttocitta.it', 'gPKc9Tz');
insert into admin (a_email, a_password) values ('pklais1@vistaprint.com', 'xCdpnDycKcy');
insert into admin (a_email, a_password) values ('fpaulitschke2@opensource.org', 'N0naYnbkp');
insert into admin (a_email, a_password) values ('bswidenbank3@ehow.com', 'J64ZiV');
insert into admin (a_email, a_password) values ('awight4@nsw.gov.au', 'hq44Lz8y2khN');

-- INSERT DATA INTO 'NOTIFICATION' TABLE
INSERT INTO `notification` (`n_id`,`buyer`,`note`,`status`) VALUES (01,'Inez','tortor nibh sit amet orci.','No');
INSERT INTO `notification` (`n_id`,`buyer`,`note`,`status`) VALUES (02,'Cheyenne','Vestibulum ante ipsum primis in faucibus orci luctus et ultrices','Yes');
INSERT INTO `notification` (`n_id`,`buyer`,`note`,`status`) VALUES (03,'Sarah','dignissim lacus. Aliquam rutrum lorem ac risus.','Yes');
INSERT INTO `notification` (`n_id`,`buyer`,`note`,`status`) VALUES (04,'Leila','est. Nunc ullamcorper, velit in','Yes');
INSERT INTO `notification` (`n_id`,`buyer`,`note`,`status`) VALUES (05,'Alvin','Donec nibh. Quisque nonummy ipsum non arcu. Vivamus sit amet','No');
INSERT INTO `notification` (`n_id`,`buyer`,`note`,`status`) VALUES (06,'Dora','vitae','No');
INSERT INTO `notification` (`n_id`,`buyer`,`note`,`status`) VALUES (07,'Gisela','porttitor scelerisque neque. Nullam nisl. Maecenas','Yes');
INSERT INTO `notification` (`n_id`,`buyer`,`note`,`status`) VALUES (08,'Zeph','tincidunt, neque vitae semper egestas, urna justo faucibus','Yes');
INSERT INTO `notification` (`n_id`,`buyer`,`note`,`status`) VALUES (09,'Felix','porttitor scelerisque neque. Nullam nisl. Maecenas malesuada fringilla est. Mauris','Yes');
INSERT INTO `notification` (`n_id`,`buyer`,`note`,`status`) VALUES (10,'Ina','vulputate, lacus. Cras interdum. Nunc sollicitudin commodo ipsum. Suspendisse non','Yes');


-- INSERT DATA INTO 'BIDS' TABLE
INSERT INTO `bids` (`b_id`,`bidder`,`product_id`,`offer_price`,`offer_time`) VALUES (1,'Demetria',3,6.22,'2020-11-17 16:55:15');
INSERT INTO `bids` (`b_id`,`bidder`,`product_id`,`offer_price`,`offer_time`) VALUES (2,'Blaire',7,5.83,'2022-01-06 14:00:19');
INSERT INTO `bids` (`b_id`,`bidder`,`product_id`,`offer_price`,`offer_time`) VALUES (3,'Roberto',7,5.64,'2021-03-05 19:59:08');
INSERT INTO `bids` (`b_id`,`bidder`,`product_id`,`offer_price`,`offer_time`) VALUES (4,'Rolando',9,5.40,'2021-07-24 23:54:39');
INSERT INTO `bids` (`b_id`,`bidder`,`product_id`,`offer_price`,`offer_time`) VALUES (5,'Issi',2,2.38,'2022-01-26 19:21:50');
INSERT INTO `bids` (`b_id`,`bidder`,`product_id`,`offer_price`,`offer_time`) VALUES (6,'Denny',7,5.01,'2022-07-10 08:41:28');
INSERT INTO `bids` (`b_id`,`bidder`,`product_id`,`offer_price`,`offer_time`) VALUES (7,'Chaddy',6,4.75,'2021-10-21 16:53:50');
INSERT INTO `bids` (`b_id`,`bidder`,`product_id`,`offer_price`,`offer_time`) VALUES (8,'Karmen',3,8.38,'2020-09-26 02:08:38');
INSERT INTO `bids` (`b_id`,`bidder`,`product_id`,`offer_price`,`offer_time`) VALUES (9,'Hube',5,9.32,'2022-03-14 02:54:21');
INSERT INTO `bids` (`b_id`,`bidder`,`product_id`,`offer_price`,`offer_time`) VALUES (10,'Lottie',10,1.42,'2022-09-06 01:48:48');
