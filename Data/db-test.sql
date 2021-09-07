
CREATE TABLE branch (
  `b_code` mediumint(8) unsigned NOT NULL auto_increment,
  `b_name` varchar(50),
  `address` varchar(255) default NULL,
  `hotline_num` varchar(100) default NULL,
  PRIMARY KEY (`b_code`)
) engine = innoDB;

create table customer_account (
	i_num VARCHAR(255) not null,
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
	registered_branch mediumint(8) unsigned not null auto_increment,
	primary key (i_num),
    foreign key (registered_branch) references branch(b_code)
)    Engine = InnoDB;

CREATE INDEX idx_balance ON customer_account(balance ASC);

CREATE TABLE auction_product (
  `p_id` mediumint(8) unsigned NOT NULL auto_increment,
  `p_name` varchar(255) NOT NULL,
  `price_min` decimal NOT NULL,
  `closing_time` datetime,
  `seller` varchar(255),
  `buyer` varchar(255),
  `picture` blob,
  `status` varchar(4),
  PRIMARY KEY (`p_id`),
  foreign key (seller) references customer_account(i_num),
  foreign key (buyer) references customer_account(i_num)
) AUTO_INCREMENT=1;

CREATE INDEX idx_price_min ON auction_product(price_min ASC);

create table admin(
    a_email varchar(255),
    a_password varchar(255)
);

create table notification(
    n_id int(8) AUTO_INCREMENT,
    buyer varchar(255),
    note varchar(255),
    status varchar(4),
    primary key(n_id)
    ,foreign key (buyer) references customer_account(i_num)
);

create table bids(
    b_id int(8) not null,
    bidder varchar(255) NOT NULL,
    b_id mediumint(8) unsigned NOT NULL auto_increment,
    offer_price decimal(8,2),
    offer_time datetime,
    primary key (b_id)
    ,foreign key (bidder) references customer_account(i_num),
    foreign key (b_id) references auction_product(p_id)
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


# -- INSERT DATA INTO 'AUCTION_PRODUCT' TABLE
INSERT INTO auction_product (p_id,p_name,price_min,closing_time,seller,buyer,picture,status) VALUES (1,'Dejesus','9.94','2025-09-19 12:11:17',9,1,'1.png','No');
INSERT INTO auction_product (p_id,p_name,price_min,closing_time,seller,buyer,picture,status) VALUES (2,'Leblanc','0.22','2024-06-17 22:09:42',2,4,'2.png','No');
INSERT INTO auction_product (p_id,p_name,price_min,closing_time,seller,buyer,picture,status) VALUES (3,'Santiago','5.04','2022-06-17 03:46:02',3,5,'3.png','Yes');
INSERT INTO auction_product (p_id,p_name,price_min,closing_time,seller,buyer,picture,status) VALUES (4,'Bond','4.10','2026-02-12 02:02:51',4,6,'4.png','No');
INSERT INTO auction_product (p_id,p_name,price_min,closing_time,seller,buyer,picture,status) VALUES (5,'Parrish','5.32','2027-10-16 12:26:28',5,7,'5.png','No');
INSERT INTO auction_product (p_id,p_name,price_min,closing_time,seller,buyer,picture,status) VALUES (6,'Bruce','8.89','2027-10-13 05:55:27',6,8,'6.png','No');
INSERT INTO auction_product (p_id,p_name,price_min,closing_time,seller,buyer,picture,status) VALUES (7,'Richards','1.99','2022-02-16 08:17:18',7,9,'7.png','No');
INSERT INTO auction_product (p_id,p_name,price_min,closing_time,seller,buyer,picture,status) VALUES (8,'Vaughan','6.36','2023-06-24 05:32:59',8,10,'8.png','No');
INSERT INTO auction_product (p_id,p_name,price_min,closing_time,seller,buyer,picture,status) VALUES (9,'Weiss','9.53','2033-10-02 12:59:04',9,11,'9.png','No');
INSERT INTO auction_product (p_id,p_name,price_min,closing_time,seller,buyer,picture,status) VALUES (10,'Gibson','9.83','2021-07-15 06:53:39',12,14,'10.png','No');
INSERT INTO auction_product (p_id,p_name,price_min,closing_time,seller,buyer,picture,status) VALUES (11,'Wolf','7.62','2021-04-10 22:33:24',13,15,'11.png','Yes');
INSERT INTO auction_product (p_id,p_name,price_min,closing_time,seller,buyer,picture,status) VALUES (12,'Vang','3.29','2021-12-23 23:43:06',14,16,'12.png','Yes');
INSERT INTO auction_product (p_id,p_name,price_min,closing_time,seller,buyer,picture,status) VALUES (13,'Pickett','2.93','2021-12-13 02:57:28',15,17,'13.png','Yes');
INSERT INTO auction_product (p_id,p_name,price_min,closing_time,seller,buyer,picture,status) VALUES (14,'Gibson','2.63','2021-09-16 06:57:40',16,18,'14.png','Yes');
INSERT INTO auction_product (p_id,p_name,price_min,closing_time,seller,buyer,picture,status) VALUES (15,'Grimes','7.07','2022-03-25 07:58:03',17,19,'15.png','No');
INSERT INTO auction_product (p_id,p_name,price_min,closing_time,seller,buyer,picture,status) VALUES (16,'Blankenship','4.50','2022-07-11 21:58:56',2,7,'16.png','Yes');
INSERT INTO auction_product (p_id,p_name,price_min,closing_time,seller,buyer,picture,status) VALUES (17,'Knight','7.75','2021-12-04 22:26:32',1,13,'17.png','Yes');
INSERT INTO auction_product (p_id,p_name,price_min,closing_time,seller,buyer,picture,status) VALUES (18,'Avila','9.33','2022-03-05 11:18:01',19,3,'18.png','Yes');
INSERT INTO auction_product (p_id,p_name,price_min,closing_time,seller,buyer,picture,status) VALUES (19,'Davis','7.87','2022-05-26 16:15:23',7,12,'19.png','No');
INSERT INTO auction_product (p_id,p_name,price_min,closing_time,seller,buyer,picture,status) VALUES (20,'Bright','9.87','2020-09-25 21:56:58',5,17,'20.png','No');

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
INSERT INTO bids (product_id,bidder,b_id,offer_price,offer_time) VALUES (1,4,3,6.22,'2020-11-17 16:55:15');
INSERT INTO bids (product_id,bidder,b_id,offer_price,offer_time) VALUES (2,5,7,5.83,'2022-01-06 14:00:19');
INSERT INTO bids (product_id,bidder,b_id,offer_price,offer_time) VALUES (3,9,8,5.64,'2021-03-05 19:59:08');
INSERT INTO bids (product_id,bidder,b_id,offer_price,offer_time) VALUES (4,11,9,5.40,'2021-07-24 23:54:39');
INSERT INTO bids (product_id,bidder,b_id,offer_price,offer_time) VALUES (5,17,2,2.38,'2022-01-26 19:21:50');
INSERT INTO bids (product_id,bidder,b_id,offer_price,offer_time) VALUES (6,19,1,5.01,'2022-07-10 08:41:28');
INSERT INTO bids (product_id,bidder,b_id,offer_price,offer_time) VALUES (7,3,6,4.75,'2021-10-21 16:53:50');
INSERT INTO bids (product_id,bidder,b_id,offer_price,offer_time) VALUES (8,12,4,8.38,'2020-09-26 02:08:38');
INSERT INTO bids (product_id,bidder,b_id,offer_price,offer_time) VALUES (9,1,5,9.32,'2022-03-14 02:54:21');
INSERT INTO bids (product_id,bidder,b_id,offer_price,offer_time) VALUES (10,8,10,1.42,'2022-09-06 01:48:48');
