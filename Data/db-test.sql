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
create database test;
use test;
drop table branch;
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
	profile_pic BLOB,
	balance DECIMAL(8,2)  not null,
    primary key (i_num),
    unique (email, phone, i_num),
    foreign key (city) references branch(b_name)
);

CREATE TABLE auction_product (
  `p_id` mediumint(8) unsigned NOT NULL auto_increment,
  `p_name` varchar(255) NOT NULL,
  `price_min` varchar(100) NOT NULL,
  `closing_time` varchar(255),
  `seller` varchar(255),
  `buyer` varchar(255),
  picture BLOB,
  `status` boolean,
  PRIMARY KEY (`p_id`),
  foreign key (seller) references customer_account(first_name)
) AUTO_INCREMENT=1;
-- no 'picture' in the table

create table admin(
    a_email varchar(255),
    a_password varchar(255)
);

create table notification(
    n_id int(8) AUTO_INCREMENT,
    buyer varchar(255),
    note varchar(255),
    status varchar(255),
    primary key(n_id),
    foreign key (buyer) references auction_product(buyer)
);

create table bids(
    b_id int(8) auto_increment,
    bidder varchar(255),
    p_id mediumint(8),
    offer_price varchar(100),
    offer_time datetime,
    primary key (b_id),
    foreign key (bidder) references auction_product(buyer),
    foreign key (p_id) references auction_product(p_id)
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
-- write the queries refers to [b_name -> customer_account (city)]


insert into admin (a_email, a_password) values ('jsawnwy0@tuttocitta.it', 'gPKc9Tz');
insert into admin (a_email, a_password) values ('pklais1@vistaprint.com', 'xCdpnDycKcy');
insert into admin (a_email, a_password) values ('fpaulitschke2@opensource.org', 'N0naYnbkp');
insert into admin (a_email, a_password) values ('bswidenbank3@ehow.com', 'J64ZiV');
insert into admin (a_email, a_password) values ('awight4@nsw.gov.au', 'hq44Lz8y2khN');


INSERT INTO `notification` (`n_id`,`buyer`,`note`,`status`) VALUES (1,'Inez','tortor nibh sit amet orci.','No');
INSERT INTO `notification` (`n_id`,`buyer`,`note`,`status`) VALUES (2,'Cheyenne','Vestibulum ante ipsum primis in faucibus orci luctus et ultrices','Yes');
INSERT INTO `notification` (`n_id`,`buyer`,`note`,`status`) VALUES (3,'Sarah','dignissim lacus. Aliquam rutrum lorem ac risus.','Yes');
INSERT INTO `notification` (`n_id`,`buyer`,`note`,`status`) VALUES (4,'Leila','est. Nunc ullamcorper, velit in','Yes');
INSERT INTO `notification` (`n_id`,`buyer`,`note`,`status`) VALUES (5,'Alvin','Donec nibh. Quisque nonummy ipsum non arcu. Vivamus sit amet','No');
INSERT INTO `notification` (`n_id`,`buyer`,`note`,`status`) VALUES (6,'Dora','vitae','No');
INSERT INTO `notification` (`n_id`,`buyer`,`note`,`status`) VALUES (7,'Gisela','porttitor scelerisque neque. Nullam nisl. Maecenas','Yes');
INSERT INTO `notification` (`n_id`,`buyer`,`note`,`status`) VALUES (8,'Zeph','tincidunt, neque vitae semper egestas, urna justo faucibus','Yes');
INSERT INTO `notification` (`n_id`,`buyer`,`note`,`status`) VALUES (9,'Felix','porttitor scelerisque neque. Nullam nisl. Maecenas malesuada fringilla est. Mauris','Yes');
INSERT INTO `notification` (`n_id`,`buyer`,`note`,`status`) VALUES (10,'Ina','vulputate, lacus. Cras interdum. Nunc sollicitudin commodo ipsum. Suspendisse non','Yes');
INSERT INTO `notification` (`n_id`,`buyer`,`note`,`status`) VALUES (11,'Kadeem','at augue id ante','Yes');
INSERT INTO `notification` (`n_id`,`buyer`,`note`,`status`) VALUES (12,'Hayfa','in felis. Nulla tempor','Yes');
INSERT INTO `notification` (`n_id`,`buyer`,`note`,`status`) VALUES (13,'John','dolor. Fusce feugiat.','No');
INSERT INTO `notification` (`n_id`,`buyer`,`note`,`status`) VALUES (14,'Candice','nisi sem semper erat, in consectetuer ipsum nunc id enim.','Yes');
INSERT INTO `notification` (`n_id`,`buyer`,`note`,`status`) VALUES (15,'Donna','rhoncus. Nullam velit dui, semper et,','No');
INSERT INTO `notification` (`n_id`,`buyer`,`note`,`status`) VALUES (16,'Maryam','placerat.','No');
INSERT INTO `notification` (`n_id`,`buyer`,`note`,`status`) VALUES (17,'Jocelyn','Integer id magna et','No');
INSERT INTO `notification` (`n_id`,`buyer`,`note`,`status`) VALUES (18,'Hedwig','pede blandit congue. In scelerisque scelerisque dui. Suspendisse ac','No');
INSERT INTO `notification` (`n_id`,`buyer`,`note`,`status`) VALUES (19,'Conan','molestie tortor nibh sit amet orci.','No');
INSERT INTO `notification` (`n_id`,`buyer`,`note`,`status`) VALUES (20,'Shannon','sit amet, risus. Donec nibh enim, gravida sit amet,','No');
INSERT INTO `notification` (`n_id`,`buyer`,`note`,`status`) VALUES (21,'Leigh','malesuada vel, convallis in,','No');
INSERT INTO `notification` (`n_id`,`buyer`,`note`,`status`) VALUES (22,'Yvonne','sagittis augue, eu','No');
INSERT INTO `notification` (`n_id`,`buyer`,`note`,`status`) VALUES (23,'Craig','Praesent interdum ligula eu enim. Etiam imperdiet dictum magna.','Yes');
INSERT INTO `notification` (`n_id`,`buyer`,`note`,`status`) VALUES (24,'Wang','auctor, nunc nulla vulputate dui, nec','Yes');
INSERT INTO `notification` (`n_id`,`buyer`,`note`,`status`) VALUES (25,'Bianca','a tortor. Nunc commodo auctor velit. Aliquam nisl.','Yes');
INSERT INTO `notification` (`n_id`,`buyer`,`note`,`status`) VALUES (26,'Jayme','dictum cursus. Nunc mauris elit, dictum eu,','No');
INSERT INTO `notification` (`n_id`,`buyer`,`note`,`status`) VALUES (27,'Larissa','fringilla mi lacinia mattis. Integer eu lacus. Quisque imperdiet,','No');
INSERT INTO `notification` (`n_id`,`buyer`,`note`,`status`) VALUES (28,'Laurel','vel pede blandit congue. In scelerisque scelerisque dui. Suspendisse ac','Yes');
INSERT INTO `notification` (`n_id`,`buyer`,`note`,`status`) VALUES (29,'Hoyt','Suspendisse eleifend.','Yes');
INSERT INTO `notification` (`n_id`,`buyer`,`note`,`status`) VALUES (30,'Irene','purus mauris a nunc.','Yes');
INSERT INTO `notification` (`n_id`,`buyer`,`note`,`status`) VALUES (31,'Brendan','purus gravida sagittis. Duis gravida. Praesent eu','Yes');
INSERT INTO `notification` (`n_id`,`buyer`,`note`,`status`) VALUES (32,'Astra','consequat nec, mollis vitae, posuere at, velit. Cras lorem lorem,','Yes');
INSERT INTO `notification` (`n_id`,`buyer`,`note`,`status`) VALUES (33,'Basil','Nam porttitor scelerisque neque. Nullam nisl. Maecenas malesuada fringilla','No');
INSERT INTO `notification` (`n_id`,`buyer`,`note`,`status`) VALUES (34,'Indigo','congue. In scelerisque','No');
INSERT INTO `notification` (`n_id`,`buyer`,`note`,`status`) VALUES (35,'Ocean','malesuada vel, venenatis vel, faucibus id, libero. Donec consectetuer','Yes');
INSERT INTO `notification` (`n_id`,`buyer`,`note`,`status`) VALUES (36,'Irma','sed, facilisis vitae, orci.','No');
INSERT INTO `notification` (`n_id`,`buyer`,`note`,`status`) VALUES (37,'Quinn','eleifend.','Yes');
INSERT INTO `notification` (`n_id`,`buyer`,`note`,`status`) VALUES (38,'Casey','Proin sed turpis nec mauris blandit','Yes');
INSERT INTO `notification` (`n_id`,`buyer`,`note`,`status`) VALUES (39,'Caleb','magna sed dui. Fusce aliquam, enim nec tempus','Yes');
INSERT INTO `notification` (`n_id`,`buyer`,`note`,`status`) VALUES (40,'Bradley','magna.','No');
INSERT INTO `notification` (`n_id`,`buyer`,`note`,`status`) VALUES (41,'Megan','pellentesque a, facilisis non, bibendum sed, est. Nunc laoreet','Yes');
INSERT INTO `notification` (`n_id`,`buyer`,`note`,`status`) VALUES (42,'Teagan','elementum, lorem ut aliquam iaculis, lacus pede','No');
INSERT INTO `notification` (`n_id`,`buyer`,`note`,`status`) VALUES (43,'Emerson','egestas rhoncus. Proin nisl sem,','No');
INSERT INTO `notification` (`n_id`,`buyer`,`note`,`status`) VALUES (44,'Kaye','sit amet, risus. Donec nibh enim, gravida sit amet, dapibus','No');
INSERT INTO `notification` (`n_id`,`buyer`,`note`,`status`) VALUES (45,'Aladdin','ipsum dolor sit amet,','No');
INSERT INTO `notification` (`n_id`,`buyer`,`note`,`status`) VALUES (46,'Willow','vel, convallis in,','Yes');
INSERT INTO `notification` (`n_id`,`buyer`,`note`,`status`) VALUES (47,'Blair','velit egestas lacinia.','No');
INSERT INTO `notification` (`n_id`,`buyer`,`note`,`status`) VALUES (48,'Kalia','tellus. Aenean egestas hendrerit','No');
INSERT INTO `notification` (`n_id`,`buyer`,`note`,`status`) VALUES (49,'Sawyer','ac mattis ornare, lectus','Yes');
INSERT INTO `notification` (`n_id`,`buyer`,`note`,`status`) VALUES (50,'Damon','facilisis facilisis, magna tellus','Yes');
INSERT INTO `notification` (`n_id`,`buyer`,`note`,`status`) VALUES (51,'Cain','arcu. Vestibulum ut eros non enim commodo hendrerit. Donec porttitor','No');
INSERT INTO `notification` (`n_id`,`buyer`,`note`,`status`) VALUES (52,'Uta','cursus purus. Nullam scelerisque neque sed sem egestas blandit.','No');
INSERT INTO `notification` (`n_id`,`buyer`,`note`,`status`) VALUES (53,'Quincy','eros. Proin ultrices. Duis volutpat nunc','No');
INSERT INTO `notification` (`n_id`,`buyer`,`note`,`status`) VALUES (54,'Amity','risus. Donec','No');
INSERT INTO `notification` (`n_id`,`buyer`,`note`,`status`) VALUES (55,'Philip','nec metus','Yes');
INSERT INTO `notification` (`n_id`,`buyer`,`note`,`status`) VALUES (56,'Ray','fringilla ornare placerat, orci lacus vestibulum lorem, sit','No');
INSERT INTO `notification` (`n_id`,`buyer`,`note`,`status`) VALUES (57,'Lila','nonummy','No');
INSERT INTO `notification` (`n_id`,`buyer`,`note`,`status`) VALUES (58,'Axel','mauris, aliquam eu, accumsan sed, facilisis vitae,','Yes');
INSERT INTO `notification` (`n_id`,`buyer`,`note`,`status`) VALUES (59,'Aurora','vitae','Yes');
INSERT INTO `notification` (`n_id`,`buyer`,`note`,`status`) VALUES (60,'India','Integer urna. Vivamus molestie dapibus ligula. Aliquam erat','Yes');
INSERT INTO `notification` (`n_id`,`buyer`,`note`,`status`) VALUES (61,'Aaron','cursus purus. Nullam','Yes');
INSERT INTO `notification` (`n_id`,`buyer`,`note`,`status`) VALUES (62,'Amos','lacinia vitae, sodales at, velit.','Yes');
INSERT INTO `notification` (`n_id`,`buyer`,`note`,`status`) VALUES (63,'Lane','purus ac tellus. Suspendisse sed dolor.','No');
INSERT INTO `notification` (`n_id`,`buyer`,`note`,`status`) VALUES (64,'Galena','convallis convallis dolor. Quisque tincidunt pede ac urna.','No');
INSERT INTO `notification` (`n_id`,`buyer`,`note`,`status`) VALUES (65,'Serena','interdum. Curabitur dictum. Phasellus in','Yes');
INSERT INTO `notification` (`n_id`,`buyer`,`note`,`status`) VALUES (66,'Aubrey','leo elementum sem, vitae aliquam eros turpis non enim. Mauris','Yes');
INSERT INTO `notification` (`n_id`,`buyer`,`note`,`status`) VALUES (67,'Blake','nonummy','Yes');
INSERT INTO `notification` (`n_id`,`buyer`,`note`,`status`) VALUES (68,'Camille','dui lectus rutrum urna, nec','Yes');
INSERT INTO `notification` (`n_id`,`buyer`,`note`,`status`) VALUES (69,'Demetrius','est.','Yes');
INSERT INTO `notification` (`n_id`,`buyer`,`note`,`status`) VALUES (70,'Mara','ullamcorper, nisl arcu iaculis enim, sit','No');
INSERT INTO `notification` (`n_id`,`buyer`,`note`,`status`) VALUES (71,'Orson','nonummy ipsum non arcu. Vivamus sit amet risus.','Yes');
INSERT INTO `notification` (`n_id`,`buyer`,`note`,`status`) VALUES (72,'Cassidy','dui, nec','No');
INSERT INTO `notification` (`n_id`,`buyer`,`note`,`status`) VALUES (73,'Sybill','elit. Nulla facilisi. Sed neque. Sed','Yes');
INSERT INTO `notification` (`n_id`,`buyer`,`note`,`status`) VALUES (74,'Sean','Vestibulum ante ipsum','No');
INSERT INTO `notification` (`n_id`,`buyer`,`note`,`status`) VALUES (75,'Kasper','adipiscing lobortis risus. In','Yes');
INSERT INTO `notification` (`n_id`,`buyer`,`note`,`status`) VALUES (76,'Jana','porttitor tellus non magna. Nam ligula','Yes');
INSERT INTO `notification` (`n_id`,`buyer`,`note`,`status`) VALUES (77,'Honorato','cursus purus. Nullam scelerisque neque sed sem egestas','Yes');
INSERT INTO `notification` (`n_id`,`buyer`,`note`,`status`) VALUES (78,'Aiko','luctus, ipsum leo elementum','No');
INSERT INTO `notification` (`n_id`,`buyer`,`note`,`status`) VALUES (79,'Alea','tincidunt','Yes');
INSERT INTO `notification` (`n_id`,`buyer`,`note`,`status`) VALUES (80,'Demetrius','nec tempus','No');
INSERT INTO `notification` (`n_id`,`buyer`,`note`,`status`) VALUES (81,'Maxwell','molestie tortor','No');
INSERT INTO `notification` (`n_id`,`buyer`,`note`,`status`) VALUES (82,'Quinlan','tempus mauris erat eget ipsum. Suspendisse','No');
INSERT INTO `notification` (`n_id`,`buyer`,`note`,`status`) VALUES (83,'Salvador','vel nisl. Quisque fringilla euismod enim.','Yes');
INSERT INTO `notification` (`n_id`,`buyer`,`note`,`status`) VALUES (84,'Lev','sed dolor. Fusce mi lorem,','Yes');
INSERT INTO `notification` (`n_id`,`buyer`,`note`,`status`) VALUES (85,'Juliet','nec','No');
INSERT INTO `notification` (`n_id`,`buyer`,`note`,`status`) VALUES (86,'Beck','aliquet','Yes');
INSERT INTO `notification` (`n_id`,`buyer`,`note`,`status`) VALUES (87,'Tobias','in lobortis tellus justo sit amet nulla. Donec','No');
INSERT INTO `notification` (`n_id`,`buyer`,`note`,`status`) VALUES (88,'Armand','Vivamus nibh dolor, nonummy ac,','No');
INSERT INTO `notification` (`n_id`,`buyer`,`note`,`status`) VALUES (89,'Steel','sit amet risus. Donec egestas. Aliquam nec','No');
INSERT INTO `notification` (`n_id`,`buyer`,`note`,`status`) VALUES (90,'Malachi','magna. Suspendisse tristique neque venenatis lacus.','No');
INSERT INTO `notification` (`n_id`,`buyer`,`note`,`status`) VALUES (91,'Caldwell','turpis. Nulla aliquet. Proin velit. Sed malesuada augue ut lacus.','Yes');
INSERT INTO `notification` (`n_id`,`buyer`,`note`,`status`) VALUES (92,'Seth','libero est,','No');
INSERT INTO `notification` (`n_id`,`buyer`,`note`,`status`) VALUES (93,'Amir','dapibus ligula. Aliquam erat volutpat.','No');
INSERT INTO `notification` (`n_id`,`buyer`,`note`,`status`) VALUES (94,'September','pede. Nunc sed orci','No');
INSERT INTO `notification` (`n_id`,`buyer`,`note`,`status`) VALUES (95,'Wendy','Duis risus odio, auctor vitae, aliquet nec, imperdiet nec,','No');
INSERT INTO `notification` (`n_id`,`buyer`,`note`,`status`) VALUES (96,'Sydney','Etiam gravida molestie arcu. Sed','No');
INSERT INTO `notification` (`n_id`,`buyer`,`note`,`status`) VALUES (97,'Thomas','sed, hendrerit a,','Yes');
INSERT INTO `notification` (`n_id`,`buyer`,`note`,`status`) VALUES (98,'Claudia','ipsum. Suspendisse non leo. Vivamus nibh','No');
INSERT INTO `notification` (`n_id`,`buyer`,`note`,`status`) VALUES (99,'Octavia','cubilia Curae; Phasellus ornare. Fusce mollis. Duis sit amet diam','No');
INSERT INTO `notification` (`n_id`,`buyer`,`note`,`status`) VALUES (100,'Cameron','aliquet. Phasellus fermentum convallis ligula. Donec luctus','Yes');

insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (1, 'Demetria', 'Orniz', 'dorniz0@forbes.com', '7788169754', '2MTnEm5IJ', '8121 Arrowood Place', 'Orlando', 'Russia', 'http://dummyimage.com/237x100.png/ff4444/ffffff', 91.8);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (2, 'Blaire', 'Peirazzi', 'bpeirazzi1@pinterest.com', '4803845551', 'gaUjLyl3BLU', '4 Memorial Lane', 'Lukou', 'China', 'http://dummyimage.com/179x100.png/5fa2dd/ffffff', 804.14);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (3, 'Marquita', 'Skinner', 'mskinner2@t.co', '4076594684', 'a44i1GOM', '48404 Atwood Street', 'Orlando', 'United States', 'http://dummyimage.com/137x100.png/5fa2dd/ffffff', 887.42);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (4, 'Berke', 'Gable', 'bgable3@freewebs.com', '7899825450', '0T6nBEQM', '63613 Moose Terrace', 'Méru', 'Greece', 'http://dummyimage.com/159x100.png/dddddd/000000', 860.61);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (5, 'Roberto', 'Kovalski', 'rkovalski4@google.com.au', '6951852041', 'baBP9omQQ6', '69760 Hansons Hill', 'Méru', 'Colombia', 'http://dummyimage.com/135x100.png/dddddd/000000', 871.27);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (6, 'Shawnee', 'Masurel', 'smasurel5@wired.com', '6886452552', 'SvqSSw', '270 Sunfield Hill', 'putrajaya', 'China', 'http://dummyimage.com/150x100.png/ff4444/ffffff', 725.72);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (7, 'Guss', 'Bartlet', 'gbartlet6@addthis.com', '9805219964', '8LC6GVarhZq', '19862 Springview Crossing', 'Budapest', 'China', 'http://dummyimage.com/213x100.png/5fa2dd/ffffff', 453.96);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (8, 'Rolando', 'Dacca', 'rdacca7@census.gov', '4816331206', '6HpCYOf', '36399 Autumn Leaf Pass', 'Cusco', 'China', 'http://dummyimage.com/207x100.png/ff4444/ffffff', 585.19);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (9, 'Issi', 'Exposito', 'iexposito8@geocities.com', '8424541241', 'GAzlJVRMUB', '14 Calypso Hill', 'Hwaseong-si', 'South Korea', 'http://dummyimage.com/127x100.png/5fa2dd/ffffff', 964.5);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (10, 'Denny', 'MacCorley', 'dmaccorley9@jiathis.com', '4802078830', 'GNHlc32gZjF', '247 Lake View Lane', 'Budapest', 'United States', 'http://dummyimage.com/219x100.png/dddddd/000000', 283.44);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (11, 'Laurent', 'Tilzey', 'ltilzeya@github.com', '5071839114', 'yYSlGd', '6077 Vahlen Hill', 'Karlstad', 'Sweden', 'http://dummyimage.com/106x100.png/cc0000/ffffff', 250.29);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (12, 'Chaddy', 'Keasy', 'ckeasyb@uol.com.br', '1733761136', 'ABgX8armqEH', '82 Mccormick Point', 'Lukou', 'Indonesia', 'http://dummyimage.com/120x100.png/cc0000/ffffff', 294.38);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (13, 'Malinda', 'Tabour', 'mtabourc@blinklist.com', '4281820296', 'ar8nUOV', '3157 Park Meadow Road', 'Orlando', 'Portugal', 'http://dummyimage.com/177x100.png/ff4444/ffffff', 337.84);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (14, 'Chance', 'Kidney', 'ckidneyd@reference.com', '9724774908', 'tk4vlJl', '5305 Crowley Hill', 'Kokubunji', 'China', 'http://dummyimage.com/138x100.png/dddddd/000000', 346.38);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (15, 'Karmen', 'Messum', 'kmessume@craigslist.org', '6861300324', 'nLJGcCbtZ7J', '9056 Londonderry Junction', 'Kokubunji', 'Japan', 'http://dummyimage.com/149x100.png/ff4444/ffffff', 893.11);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (16, 'Claudio', 'Carvil', 'ccarvilf@nhs.uk', '5815471246', 'V6acEuPQNvh', '123 Morning Crossing', 'Orlando', 'Iraq', 'http://dummyimage.com/196x100.png/ff4444/ffffff', 647.99);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (17, 'Chandal', 'Wiltshire', 'cwiltshireg@wikimedia.org', '7314661428', 'Xe7yvIgULu', '08534 Mendota Circle', 'Hwaseong-si', 'Finland', 'http://dummyimage.com/183x100.png/dddddd/000000', 699.32);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (18, 'Hube', 'Huncoot', 'hhuncooth@nps.gov', '2916540633', 'MD8jF6p', '43246 Nancy Court', 'Karlstad', 'China', 'http://dummyimage.com/107x100.png/dddddd/000000', 606.75);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (19, 'Gaylord', 'Twatt', 'gtwatti@netvibes.com', '3121243341', '07NJz5zeiqs', '45952 Ramsey Crossing', 'Kokubunji', 'United Kingdom', 'http://dummyimage.com/249x100.png/cc0000/ffffff', 358.0);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (20, 'Lottie', 'Fallon', 'lfallonj@thetimes.co.uk', '5655279583', '0erWD32r8hd', '25 Erie Pass', 'Cusco', 'China', 'http://dummyimage.com/224x100.png/dddddd/000000', 815.84);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (21, 'Pavia', 'Cron', 'pcronk@weibo.com', '7945585943', '5Equil', '07993 Lunder Trail', 'Budapest', 'Russia', 'http://dummyimage.com/112x100.png/5fa2dd/ffffff', 468.03);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (22, 'Jayme', 'Shropshire', 'jshropshirel@scribd.com', '4256614118', 'pIvSR205eC', '296 Eliot Crossing', 'putrajaya', 'United States', 'http://dummyimage.com/218x100.png/ff4444/ffffff', 757.62);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (23, 'Carola', 'Bleesing', 'cbleesingm@miitbeian.gov.cn', '1023380312', 'qsI3JZC2ug3i', '2217 Schiller Drive', 'Galapa', 'Ukraine', 'http://dummyimage.com/183x100.png/5fa2dd/ffffff', 934.47);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (24, 'Jonathan', 'Ray', 'jrayn@barnesandnoble.com', '1108679113', 'K14ZX7g9yV', '95 Laurel Park', 'Méru', 'Sweden', 'http://dummyimage.com/129x100.png/5fa2dd/ffffff', 257.93);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (25, 'Anthe', 'Verduin', 'averduino@arstechnica.com', '6192721495', 'kz0YP66pcsv', '7838 Fulton Trail', 'Orlando', 'Chile', 'http://dummyimage.com/213x100.png/dddddd/000000', 400.07);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (26, 'Kaile', 'Houlaghan', 'khoulaghanp@cargocollective.com', '9275289880', 'w5sof6oUN40', '995 Gateway Lane', 'Lukou', 'China', 'http://dummyimage.com/235x100.png/5fa2dd/ffffff', 778.57);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (27, 'Josefina', 'Lorans', 'jloransq@chron.com', '4937916768', 'dlQslctu8k4T', '40926 Graceland Road', 'putrajaya', 'Indonesia', 'http://dummyimage.com/195x100.png/dddddd/000000', 203.03);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (28, 'Morna', 'Handsheart', 'mhandsheartr@phoca.cz', '2054400053', 'BNAU0MjU5', '0946 Carberry Park', 'Galapa', 'United States', 'http://dummyimage.com/118x100.png/5fa2dd/ffffff', 777.82);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (29, 'Eugenia', 'Southerden', 'esoutherdens@tumblr.com', '3774947118', 'C3yfAQ8g', '959 Starling Court', 'Lukou', 'China', 'http://dummyimage.com/136x100.png/ff4444/ffffff', 147.42);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (30, 'Rickie', 'Bernardotte', 'rbernardottet@washingtonpost.com', '8315513340', 'QLXTojF', '14 Emmet Center', 'Méru', 'Greece', 'http://dummyimage.com/201x100.png/5fa2dd/ffffff', 311.81);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (31, 'Meredith', 'Spensly', 'mspenslyu@geocities.jp', '5482299746', 'EN0A9gRH', '6195 Anhalt Place', 'Mezhevoy', 'Russia', 'http://dummyimage.com/221x100.png/ff4444/ffffff', 611.4);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (32, 'Lowrance', 'Furney', 'lfurneyv@feedburner.com', '7133961064', 'YGPSwINO0Edy', '653 Vidon Hill', 'Luohuang', 'China', 'http://dummyimage.com/191x100.png/cc0000/ffffff', 975.36);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (33, 'Babs', 'Cammock', 'bcammockw@ameblo.jp', '1547221450', 'fBzY99XnXQt', '839 Anderson Pass', 'Mikhaylov', 'Russia', 'http://dummyimage.com/118x100.png/dddddd/000000', 94.7);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (34, 'Man', 'Moorey', 'mmooreyx@yale.edu', '9129082647', 'qUXYCwUWx', '060 Manufacturers Trail', 'Sangzhen', 'China', 'http://dummyimage.com/211x100.png/dddddd/000000', 272.8);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (35, 'Tarrance', 'Krojn', 'tkrojny@disqus.com', '4609144227', 'TEktJ4YnlR6C', '167 Glacier Hill Park', 'Manique', 'Portugal', 'http://dummyimage.com/151x100.png/5fa2dd/ffffff', 602.31);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (36, 'Marina', 'Bruhke', 'mbruhkez@shinystat.com', '5297518549', 'LMkhUKQZi', '424 Manufacturers Point', 'Caseros', 'Argentina', 'http://dummyimage.com/238x100.png/ff4444/ffffff', 137.18);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (37, 'Berthe', 'Scarborough', 'bscarborough10@ed.gov', '1331544814', 'WrhroRh5uuA', '9 2nd Street', 'Challas', 'Peru', 'http://dummyimage.com/183x100.png/ff4444/ffffff', 560.4);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (38, 'Orly', 'De Gowe', 'odegowe11@weebly.com', '7247788726', 'GiTYr9d5Lfl', '7258 Blackbird Hill', 'Évry', 'France', 'http://dummyimage.com/118x100.png/5fa2dd/ffffff', 751.76);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (39, 'Alphonse', 'Skaif', 'askaif12@uiuc.edu', '8732036234', 'XVk70JqE0', '5 Larry Junction', 'Yuxarı Aran', 'Azerbaijan', 'http://dummyimage.com/219x100.png/cc0000/ffffff', 309.21);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (40, 'Lennard', 'Paddingdon', 'lpaddingdon13@amazonaws.com', '3529559533', 'CdHEkGh', '797 Susan Crossing', 'Pevek', 'Russia', 'http://dummyimage.com/127x100.png/5fa2dd/ffffff', 63.32);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (41, 'Reinhold', 'Valance', 'rvalance14@cyberchimps.com', '2105979579', 'lexDnujY', '14 Bay Terrace', 'Sande Vila Nova', 'Portugal', 'http://dummyimage.com/125x100.png/ff4444/ffffff', 992.88);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (42, 'Carilyn', 'Milroy', 'cmilroy15@ifeng.com', '5631325986', 'oay7Ysa', '4 Anthes Point', 'Punaauia', 'French Polynesia', 'http://dummyimage.com/122x100.png/dddddd/000000', 591.49);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (43, 'Page', 'Knowling', 'pknowling16@businesswire.com', '1566038506', 'hHzNgTZpV', '861 Lukken Parkway', 'Kawerau', 'New Zealand', 'http://dummyimage.com/179x100.png/cc0000/ffffff', 374.99);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (44, 'Adolf', 'Morlon', 'amorlon17@newsvine.com', '4947508446', 'vBpUI008xLX', '9815 Pierstorff Center', 'Longqiao', 'China', 'http://dummyimage.com/203x100.png/5fa2dd/ffffff', 489.66);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (45, 'Philis', 'Skipperbottom', 'pskipperbottom18@stumbleupon.com', '3156105029', '9Nm5on4hwe', '753 Duke Center', 'Sandaohezi', 'China', 'http://dummyimage.com/145x100.png/5fa2dd/ffffff', 539.49);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (46, 'Max', 'Hands', 'mhands19@blogspot.com', '3109974767', '3g3fZSeJQx', '49 Vidon Crossing', 'Kibuku', 'Uganda', 'http://dummyimage.com/137x100.png/cc0000/ffffff', 551.05);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (47, 'Linzy', 'Tavner', 'ltavner1a@privacy.gov.au', '7792561496', 'vpYijL1hOM', '97416 Burrows Crossing', 'Panevėžys', 'Lithuania', 'http://dummyimage.com/131x100.png/5fa2dd/ffffff', 593.77);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (48, 'Lorine', 'O''Leagham', 'loleagham1b@flavors.me', '8675044088', 'w7hgVSu', '61 Tomscot Lane', 'Batken', 'Kyrgyzstan', 'http://dummyimage.com/111x100.png/5fa2dd/ffffff', 184.94);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (49, 'Barnebas', 'Groomebridge', 'bgroomebridge1c@hud.gov', '1398474382', 'IyTibAf', '1395 John Wall Point', 'Pouzauges', 'France', 'http://dummyimage.com/101x100.png/dddddd/000000', 791.03);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (50, 'Gerhardine', 'Corinton', 'gcorinton1d@free.fr', '6394099867', '7p5FDYdiX3', '8383 Wayridge Circle', 'Botshabelo', 'South Africa', 'http://dummyimage.com/245x100.png/dddddd/000000', 516.38);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (51, 'Aluin', 'Fermor', 'afermor1e@admin.ch', '1583218464', 'lIEsFJXG', '791 Macpherson Road', 'Saratak', 'Armenia', 'http://dummyimage.com/168x100.png/dddddd/000000', 626.69);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (52, 'Vachel', 'Tewkesbury', 'vtewkesbury1f@reverbnation.com', '4746511920', 'hno8kli7hiae', '44 Mcguire Alley', 'Suizhou', 'China', 'http://dummyimage.com/223x100.png/ff4444/ffffff', 743.6);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (53, 'Hobart', 'Briscow', 'hbriscow1g@macromedia.com', '7221922083', '5Ng7xbcd', '2 Tomscot Park', 'La Escondida', 'Mexico', 'http://dummyimage.com/191x100.png/dddddd/000000', 156.62);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (54, 'Borg', 'Daltrey', 'bdaltrey1h@tuttocitta.it', '7107150065', 'sFGTU5h4qR', '4580 Brentwood Lane', 'Laholm', 'Sweden', 'http://dummyimage.com/193x100.png/cc0000/ffffff', 238.32);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (55, 'Tine', 'Dumbrall', 'tdumbrall1i@bbb.org', '4808654777', 'c5WUy5c', '2 1st Point', 'Gampola', 'Sri Lanka', 'http://dummyimage.com/179x100.png/ff4444/ffffff', 297.55);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (56, 'Claude', 'Vecard', 'cvecard1j@de.vu', '7466635722', 'fsrnQ3L', '17667 Northport Lane', 'Kumanovo', 'Macedonia', 'http://dummyimage.com/205x100.png/ff4444/ffffff', 726.87);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (57, 'Lee', 'Madge', 'lmadge1k@exblog.jp', '9787054635', 'q6erTbvQP', '3 Fremont Point', 'La Guacamaya', 'Honduras', 'http://dummyimage.com/194x100.png/ff4444/ffffff', 438.16);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (58, 'Markus', 'Rolph', 'mrolph1l@ca.gov', '3796090904', 'TIy0Ztb1', '1 Menomonie Crossing', 'Sarbīsheh', 'Iran', 'http://dummyimage.com/110x100.png/5fa2dd/ffffff', 28.84);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (59, 'Dunc', 'Cullen', 'dcullen1m@cargocollective.com', '5514872685', 'U57PijazE', '17 Stuart Place', 'Dongshan', 'China', 'http://dummyimage.com/156x100.png/dddddd/000000', 223.19);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (60, 'Ginger', 'Tydeman', 'gtydeman1n@wufoo.com', '4678598679', 'Ok8KZWNhj', '0348 Logan Pass', 'Pakel', 'Indonesia', 'http://dummyimage.com/189x100.png/5fa2dd/ffffff', 291.13);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (61, 'Eleonore', 'Malby', 'emalby1o@nasa.gov', '9684658300', 'bctGql2', '77 Brentwood Avenue', 'Kokologo', 'Burkina Faso', 'http://dummyimage.com/132x100.png/cc0000/ffffff', 906.29);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (62, 'Clemmie', 'Winsbury', 'cwinsbury1p@pagesperso-orange.fr', '2511249254', 'O6phOKaWJg', '91 Messerschmidt Road', 'Capelinha', 'Brazil', 'http://dummyimage.com/147x100.png/ff4444/ffffff', 311.77);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (63, 'Sharai', 'Lind', 'slind1q@zdnet.com', '8594758464', '2eLRbxs', '6039 Hanover Point', 'Gashua', 'Nigeria', 'http://dummyimage.com/113x100.png/5fa2dd/ffffff', 130.57);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (64, 'Laurel', 'Auguste', 'lauguste1r@cdbaby.com', '1775122257', '1gVGkEj', '83 Lindbergh Point', 'Lyubim', 'Russia', 'http://dummyimage.com/117x100.png/5fa2dd/ffffff', 650.95);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (65, 'Saraann', 'Atterley', 'satterley1s@ask.com', '2114864057', 'ecAuDzPvf', '54 Waywood Plaza', 'La Colorada', 'Panama', 'http://dummyimage.com/112x100.png/cc0000/ffffff', 494.76);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (66, 'Maje', 'Potier', 'mpotier1t@privacy.gov.au', '1466072767', 'vHjbitoO', '49141 Division Road', 'Xiacaoqiao', 'China', 'http://dummyimage.com/176x100.png/ff4444/ffffff', 903.33);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (67, 'Augustus', 'Gethin', 'agethin1u@webnode.com', '9421657064', '23qVqoxNFCFx', '10 Village Plaza', 'Governor’s Harbour', 'Bahamas', 'http://dummyimage.com/143x100.png/cc0000/ffffff', 115.44);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (68, 'Kile', 'Gensavage', 'kgensavage1v@google.pl', '9072367356', 'W8zCPR5', '21597 Mosinee Road', 'Ellinikó', 'Greece', 'http://dummyimage.com/124x100.png/dddddd/000000', 260.43);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (69, 'Serena', 'Blackbourn', 'sblackbourn1w@goo.ne.jp', '2849560659', 'n9AY7ZSRwH', '50358 High Crossing Drive', 'Duyên Hải', 'Vietnam', 'http://dummyimage.com/135x100.png/ff4444/ffffff', 879.37);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (70, 'Andrea', 'Dollman', 'adollman1x@cloudflare.com', '5514513352', 'X3HEqDV9SnY', '586 Arapahoe Center', 'Santa Cruz das Flores', 'Portugal', 'http://dummyimage.com/217x100.png/dddddd/000000', 487.73);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (71, 'Errol', 'O''Kennavain', 'eokennavain1y@nymag.com', '6957148927', 'jMLG1ffTJHSX', '35985 Burning Wood Trail', 'Mindupok', 'Philippines', 'http://dummyimage.com/152x100.png/5fa2dd/ffffff', 894.43);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (72, 'Chlo', 'Newbury', 'cnewbury1z@webs.com', '7586687950', '5nhibby0yaS', '735 Coleman Terrace', 'Hirakata', 'Japan', 'http://dummyimage.com/221x100.png/dddddd/000000', 735.66);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (73, 'Cesya', 'Gannon', 'cgannon20@foxnews.com', '6076943198', 'Gnw2EcU4Fbaf', '72882 Sloan Crossing', 'Kotlyarevskaya', 'Russia', 'http://dummyimage.com/202x100.png/cc0000/ffffff', 59.58);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (74, 'Shaylah', 'Milburne', 'smilburne21@flickr.com', '1633058923', 'LeLKbhjcGS5W', '67919 Mccormick Point', 'Rasskazovo', 'Russia', 'http://dummyimage.com/145x100.png/5fa2dd/ffffff', 294.76);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (75, 'Faina', 'Pasek', 'fpasek22@skype.com', '3326508662', 'IdLLdlFG93', '69278 South Pass', 'Soubré', 'Ivory Coast', 'http://dummyimage.com/238x100.png/dddddd/000000', 159.56);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (76, 'Amelia', 'Jeaneau', 'ajeaneau23@amazon.de', '4871646227', 'uW0SIuXZeR', '12 Parkside Avenue', 'Dangcalan', 'Philippines', 'http://dummyimage.com/190x100.png/5fa2dd/ffffff', 217.76);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (77, 'Reggis', 'Mattingley', 'rmattingley24@ustream.tv', '2789022919', 'dY6kVS', '9648 Aberg Point', 'Diriomo', 'Nicaragua', 'http://dummyimage.com/109x100.png/dddddd/000000', 690.34);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (78, 'Willamina', 'Longhirst', 'wlonghirst25@usnews.com', '6129089961', 'K4GLUVFJV3', '234 Haas Parkway', 'Wamba', 'Nigeria', 'http://dummyimage.com/224x100.png/cc0000/ffffff', 622.79);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (79, 'Elvera', 'Aggio', 'eaggio26@symantec.com', '1005632330', 'Es8KOtyoJSAs', '98269 Reinke Place', 'Nizhniy Novgorod', 'Russia', 'http://dummyimage.com/167x100.png/5fa2dd/ffffff', 928.59);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (80, 'Hilly', 'Stapleton', 'hstapleton27@nyu.edu', '8538310852', 'Afbp8nd', '4 Lien Parkway', 'Angoulême', 'France', 'http://dummyimage.com/164x100.png/dddddd/000000', 604.56);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (81, 'Liz', 'Axston', 'laxston28@baidu.com', '4962303456', 'GqugrgzKEPD', '5 Kenwood Avenue', 'Kamieniec', 'Poland', 'http://dummyimage.com/231x100.png/5fa2dd/ffffff', 510.77);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (82, 'Jinny', 'Yirrell', 'jyirrell29@yelp.com', '7076804346', 'VYgETp', '3 Talmadge Park', 'Sasovo', 'Russia', 'http://dummyimage.com/180x100.png/cc0000/ffffff', 584.47);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (83, 'Amalle', 'Leatt', 'aleatt2a@blogger.com', '6297046843', 'tRfN0QrX', '5 Maywood Lane', 'Xinchenglu', 'China', 'http://dummyimage.com/204x100.png/dddddd/000000', 890.72);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (84, 'Enrika', 'Cannavan', 'ecannavan2b@macromedia.com', '6353318005', 'MWq5CWJ', '4277 Independence Point', 'Versailles', 'France', 'http://dummyimage.com/210x100.png/cc0000/ffffff', 490.16);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (85, 'Merill', 'Minelli', 'mminelli2c@aboutads.info', '1195230885', '1yuWmjj3ifW', '05 Hermina Alley', 'Vendas de Galizes', 'Portugal', 'http://dummyimage.com/204x100.png/ff4444/ffffff', 717.64);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (86, 'Ariel', 'Swatland', 'aswatland2d@un.org', '5398855412', 'YRlaLysct4PT', '1963 Forest Pass', 'Miguel Hidalgo', 'Mexico', 'http://dummyimage.com/173x100.png/dddddd/000000', 376.1);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (87, 'Lynda', 'Brosio', 'lbrosio2e@upenn.edu', '5063082240', 'u7ibn2wmBPC', '4 Summit Court', 'Krasni Okny', 'Ukraine', 'http://dummyimage.com/232x100.png/5fa2dd/ffffff', 309.4);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (88, 'Merry', 'Housby', 'mhousby2f@epa.gov', '7825346899', 'HauYm6oMH', '47083 Gerald Junction', 'Phu Khiao', 'Thailand', 'http://dummyimage.com/247x100.png/5fa2dd/ffffff', 463.02);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (89, 'Al', 'Drewe', 'adrewe2g@slashdot.org', '7014864207', 'rbC8feZEK4', '0183 Clyde Gallagher Trail', 'Dangmu', 'China', 'http://dummyimage.com/181x100.png/cc0000/ffffff', 646.55);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (90, 'Tallou', 'McEniry', 'tmceniry2h@msu.edu', '9417567910', 'Ka5vS0oYNh1', '31 Atwood Way', 'Landskrona', 'Sweden', 'http://dummyimage.com/164x100.png/5fa2dd/ffffff', 943.98);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (91, 'Bette', 'Brear', 'bbrear2i@google.de', '6365736194', '5hHS1Lh3', '8 Portage Place', 'Huangwei', 'China', 'http://dummyimage.com/240x100.png/dddddd/000000', 608.01);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (92, 'Kathy', 'Grinnov', 'kgrinnov2j@ehow.com', '6504518709', 'qEo4gxItT', '14182 Nevada Point', 'Ayapel', 'Colombia', 'http://dummyimage.com/201x100.png/5fa2dd/ffffff', 705.35);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (93, 'Keene', 'Trunby', 'ktrunby2k@slashdot.org', '8849529645', 'V24JIWrvB8', '884 Rutledge Park', 'Yangon', 'Myanmar', 'http://dummyimage.com/109x100.png/dddddd/000000', 559.99);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (94, 'Konstanze', 'Girardin', 'kgirardin2l@addthis.com', '3155874540', 'IQpQuC', '4185 Vermont Drive', 'Tarqūmyā', 'Palestinian Territory', 'http://dummyimage.com/122x100.png/ff4444/ffffff', 521.76);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (95, 'Ricca', 'Keady', 'rkeady2m@elpais.com', '1322342342', 'L1gkTlrr', '4 Loftsgordon Drive', 'Francisco I Madero', 'Mexico', 'http://dummyimage.com/179x100.png/5fa2dd/ffffff', 875.96);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (96, 'Giusto', 'Perritt', 'gperritt2n@woothemes.com', '8931192864', 'TcZmD2bc6EY', '1821 Fieldstone Center', 'Altkirch', 'France', 'http://dummyimage.com/181x100.png/5fa2dd/ffffff', 364.74);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (97, 'Virgie', 'Asee', 'vasee2o@epa.gov', '5385857922', 'mh8tPxVq', '6 Fordem Center', 'Tarfaya', 'Morocco', 'http://dummyimage.com/121x100.png/5fa2dd/ffffff', 894.69);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (98, 'Ronald', 'Ivan', 'rivan2p@msu.edu', '7961701137', 'e9CXgBal0Ef', '0424 Corscot Plaza', 'Rancho Viejo', 'Mexico', 'http://dummyimage.com/174x100.png/dddddd/000000', 94.26);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (99, 'Cathe', 'Colston', 'ccolston2q@sfgate.com', '4503750624', 'Sq5lpScvWhxy', '458 Shoshone Lane', 'Hongmiao', 'China', 'http://dummyimage.com/148x100.png/ff4444/ffffff', 168.95);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (100, 'Woodrow', 'Moffet', 'wmoffet2r@scientificamerican.com', '7828675504', '0sI8YvIog', '567 Nancy Avenue', 'Negombo', 'Sri Lanka', 'http://dummyimage.com/240x100.png/5fa2dd/ffffff', 537.57);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (101, 'Dareen', 'Persehouse', 'dpersehouse2s@ezinearticles.com', '9586556718', '1Mu3Eryhs', '46683 Summer Ridge Road', 'San Antonio', 'Honduras', 'http://dummyimage.com/197x100.png/ff4444/ffffff', 890.13);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (102, 'Shell', 'Cantillon', 'scantillon2t@ning.com', '4723694767', 'mQdNIFY', '97 Springs Circle', 'Bayt ‘Anān', 'Palestinian Territory', 'http://dummyimage.com/146x100.png/ff4444/ffffff', 71.3);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (103, 'Evie', 'Fransinelli', 'efransinelli2u@google.co.uk', '6771608038', 'eDyYNf', '3 Pepper Wood Junction', 'Saint Croix', 'U.S. Virgin Islands', 'http://dummyimage.com/232x100.png/dddddd/000000', 678.65);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (104, 'Gard', 'Dorkens', 'gdorkens2v@instagram.com', '5344703071', 'RvVxBv4rriK', '4 Becker Way', 'North Shore', 'New Zealand', 'http://dummyimage.com/209x100.png/5fa2dd/ffffff', 23.9);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (105, 'Darwin', 'O''Riordan', 'doriordan2w@stumbleupon.com', '9603858169', 'HDx15o', '6348 Blue Bill Park Circle', 'Saramech', 'Armenia', 'http://dummyimage.com/179x100.png/dddddd/000000', 572.27);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (106, 'Carlita', 'Awty', 'cawty2x@go.com', '7992134877', '9WCiLzQ', '354 Dexter Crossing', 'North Side', 'Cayman Islands', 'http://dummyimage.com/176x100.png/ff4444/ffffff', 124.46);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (107, 'Bink', 'MacGregor', 'bmacgregor2y@bloglovin.com', '6011076869', '45UUxp17', '49416 Delladonna Street', 'Daxbet', 'Uzbekistan', 'http://dummyimage.com/128x100.png/5fa2dd/ffffff', 439.05);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (108, 'Chev', 'Botler', 'cbotler2z@miitbeian.gov.cn', '5694094387', 'hUGgOFgJcWJ', '46112 Chive Avenue', 'Nauchnyy Gorodok', 'Russia', 'http://dummyimage.com/177x100.png/cc0000/ffffff', 978.91);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (109, 'Joellen', 'Beushaw', 'jbeushaw30@posterous.com', '2528797237', 'tcCDoSoDBL79', '85431 Independence Circle', 'Goz Beïda', 'Chad', 'http://dummyimage.com/114x100.png/5fa2dd/ffffff', 477.19);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (110, 'Caye', 'Neaverson', 'cneaverson31@instagram.com', '3382539603', 'BKWmwBu6mz', '3 Barby Place', 'Waimangura', 'Indonesia', 'http://dummyimage.com/143x100.png/cc0000/ffffff', 475.39);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (111, 'Nanete', 'Cowle', 'ncowle32@nationalgeographic.com', '1226286531', 'NsmdUoOp', '7748 Novick Road', 'Cochrane', 'Canada', 'http://dummyimage.com/167x100.png/5fa2dd/ffffff', 532.03);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (112, 'Kiele', 'Wilfling', 'kwilfling33@harvard.edu', '9324358737', '6uWznQo4VH', '0797 Mitchell Hill', 'Pomacocha', 'Peru', 'http://dummyimage.com/120x100.png/cc0000/ffffff', 891.74);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (113, 'Dorotea', 'Lehon', 'dlehon34@dagondesign.com', '8444927967', '9J5Wza', '986 Ridge Oak Alley', 'Lima', 'Peru', 'http://dummyimage.com/250x100.png/ff4444/ffffff', 108.15);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (114, 'Cly', 'Jeannequin', 'cjeannequin35@go.com', '3918886945', 'ZwaBLG3W', '7902 Gale Lane', 'Soutocico', 'Portugal', 'http://dummyimage.com/210x100.png/5fa2dd/ffffff', 612.44);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (115, 'Doralin', 'Busby', 'dbusby36@dropbox.com', '9982508448', 'T0NFT0LFKyC', '3092 Mifflin Court', 'Tân Trụ', 'Vietnam', 'http://dummyimage.com/230x100.png/ff4444/ffffff', 551.56);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (116, 'Edmon', 'Colbourn', 'ecolbourn37@newsvine.com', '5528330021', 'P3SxFQPCMbT7', '47 Crowley Center', 'Guinoaliuan', 'Philippines', 'http://dummyimage.com/216x100.png/cc0000/ffffff', 724.76);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (117, 'Gerome', 'Ragot', 'gragot38@wix.com', '9195587754', 'uMq70feg', '210 Towne Junction', 'Praia da Vitória', 'Portugal', 'http://dummyimage.com/226x100.png/5fa2dd/ffffff', 333.83);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (118, 'Regan', 'Kristufek', 'rkristufek39@last.fm', '9015431966', '4zddtoQ2bOz', '52 Westerfield Circle', 'Matão', 'Brazil', 'http://dummyimage.com/125x100.png/dddddd/000000', 112.81);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (119, 'Lilas', 'Kacheler', 'lkacheler3a@nymag.com', '4127950171', 'C3m0NW', '2535 Maryland Alley', 'Julun', 'China', 'http://dummyimage.com/112x100.png/5fa2dd/ffffff', 234.48);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (120, 'Siffre', 'Clayden', 'sclayden3b@imgur.com', '8366814426', 'OOUF6ej507', '0258 Sherman Road', 'Néa Filadélfeia', 'Greece', 'http://dummyimage.com/139x100.png/ff4444/ffffff', 146.77);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (121, 'Danice', 'Stife', 'dstife3c@studiopress.com', '1638916919', 'MKQgREmz', '1224 Oneill Plaza', 'Subusub', 'Philippines', 'http://dummyimage.com/192x100.png/ff4444/ffffff', 945.19);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (122, 'Blair', 'Hasling', 'bhasling3d@biblegateway.com', '4025438274', 'TZcTqs2V', '10350 Lawn Center', 'Omaha', 'United States', 'http://dummyimage.com/232x100.png/dddddd/000000', 749.45);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (123, 'Brena', 'Marczyk', 'bmarczyk3e@simplemachines.org', '9443070826', 'MoDOxsu', '67894 Larry Center', 'Mingfeng', 'China', 'http://dummyimage.com/115x100.png/cc0000/ffffff', 537.77);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (124, 'Christa', 'Stenson', 'cstenson3f@bbb.org', '1489811640', 'Dvpf29q', '82363 Macpherson Alley', 'Wentugaole', 'China', 'http://dummyimage.com/147x100.png/cc0000/ffffff', 787.54);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (125, 'Alaric', 'Gates', 'agates3g@dmoz.org', '1166795790', 'tCLPAZHd6z', '0 Sullivan Point', 'Kwatarkwashi', 'Nigeria', 'http://dummyimage.com/176x100.png/dddddd/000000', 868.95);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (126, 'Velvet', 'Meakes', 'vmeakes3h@google.es', '9142447184', 'WaFAwakEB', '8 Menomonie Center', 'Gjoa Haven', 'Canada', 'http://dummyimage.com/132x100.png/cc0000/ffffff', 93.33);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (127, 'Tatiania', 'Ridsdale', 'tridsdale3i@acquirethisname.com', '7111510137', 'UGCuPR', '023 Mallory Place', 'Otavalo', 'Ecuador', 'http://dummyimage.com/106x100.png/ff4444/ffffff', 584.56);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (128, 'Hercules', 'Kier', 'hkier3j@disqus.com', '4166244106', 'oXGDn3EuaPN', '51 Canary Way', 'Karlstad', 'Sweden', 'http://dummyimage.com/162x100.png/5fa2dd/ffffff', 180.26);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (129, 'Tomasine', 'Cinnamond', 'tcinnamond3k@cocolog-nifty.com', '9288956527', 'euBakZZ2Z', '2 Novick Center', 'Manevychi', 'Ukraine', 'http://dummyimage.com/178x100.png/cc0000/ffffff', 903.18);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (130, 'Francklyn', 'Leyre', 'fleyre3l@salon.com', '1642289532', 'uZQN2P', '2 Onsgard Hill', 'Penisihan', 'Indonesia', 'http://dummyimage.com/219x100.png/dddddd/000000', 342.29);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (131, 'Winfield', 'Furphy', 'wfurphy3m@opera.com', '5481660147', 'KuUQqWpEy', '605 Delaware Trail', 'Quezalguaque', 'Nicaragua', 'http://dummyimage.com/102x100.png/ff4444/ffffff', 913.13);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (132, 'Turner', 'Hamner', 'thamner3n@blogger.com', '2514109320', 'LMQFFJAzE', '27276 Portage Hill', 'Kokubunji', 'Japan', 'http://dummyimage.com/238x100.png/5fa2dd/ffffff', 805.74);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (133, 'Annmarie', 'Vaughn', 'avaughn3o@cyberchimps.com', '1493100358', 'urx9qHt', '1 Ramsey Pass', 'Konyshevka', 'Russia', 'http://dummyimage.com/169x100.png/5fa2dd/ffffff', 987.5);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (134, 'Antoni', 'Cyples', 'acyples3p@netscape.com', '6799982661', 'ptUzlD', '991 Wayridge Alley', 'Lyubim', 'Russia', 'http://dummyimage.com/192x100.png/dddddd/000000', 362.51);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (135, 'Cori', 'Glynne', 'cglynne3q@printfriendly.com', '9741558922', 'VkgARmbFsYV', '23 Drewry Street', 'Jianxin', 'China', 'http://dummyimage.com/203x100.png/ff4444/ffffff', 230.94);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (136, 'Claudelle', 'Dongate', 'cdongate3r@fc2.com', '6727054540', 'YsIs7NOL1', '2 Sunfield Center', 'Sampir', 'Indonesia', 'http://dummyimage.com/178x100.png/ff4444/ffffff', 787.98);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (137, 'Joletta', 'Humfrey', 'jhumfrey3s@guardian.co.uk', '8298023359', 'O3eev5', '6 Buhler Terrace', 'Yaring', 'Thailand', 'http://dummyimage.com/152x100.png/dddddd/000000', 150.01);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (138, 'Jillana', 'Fasset', 'jfasset3t@abc.net.au', '7122403582', 'fu3jZvwUy7', '89508 Onsgard Road', 'Dobřany', 'Czech Republic', 'http://dummyimage.com/126x100.png/ff4444/ffffff', 915.86);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (139, 'Holly', 'Burburough', 'hburburough3u@earthlink.net', '5851488420', 'n396K5i0wCm', '7784 Reindahl Trail', 'Luzhuangzi', 'China', 'http://dummyimage.com/113x100.png/5fa2dd/ffffff', 117.86);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (140, 'Ula', 'Idell', 'uidell3v@jugem.jp', '8934754350', 'PSgFHQyHb1C', '0593 Esker Plaza', 'Waterloo', 'Canada', 'http://dummyimage.com/175x100.png/cc0000/ffffff', 274.2);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (141, 'Ebenezer', 'Trask', 'etrask3w@youtube.com', '1972313990', 'Uu8XJMM0zFK', '84991 Lien Terrace', 'Weishanzhuang', 'China', 'http://dummyimage.com/169x100.png/ff4444/ffffff', 518.66);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (142, 'Eadmund', 'MacSporran', 'emacsporran3x@army.mil', '6655290701', 'zV5sdK', '41258 Grasskamp Crossing', 'Dębno', 'Poland', 'http://dummyimage.com/154x100.png/dddddd/000000', 231.15);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (143, 'Dotty', 'Blaymires', 'dblaymires3y@discovery.com', '3106991971', 'QGnpMd', '9 Loeprich Park', 'Borås', 'Sweden', 'http://dummyimage.com/122x100.png/5fa2dd/ffffff', 441.46);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (144, 'Ellis', 'Cumming', 'ecumming3z@devhub.com', '8433323929', '1A5fzCEDdv9', '16 Caliangt Circle', 'Kota Kinabalu', 'Malaysia', 'http://dummyimage.com/134x100.png/5fa2dd/ffffff', 612.67);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (145, 'Nissy', 'Smylie', 'nsmylie40@smugmug.com', '4061479159', 'fpc6cMv', '2 Monterey Park', 'Huangmao', 'China', 'http://dummyimage.com/224x100.png/5fa2dd/ffffff', 425.07);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (146, 'Jolee', 'Bygrave', 'jbygrave41@who.int', '9602824545', '2nk2UoU', '70 Clyde Gallagher Terrace', 'Bystryanka', 'Russia', 'http://dummyimage.com/195x100.png/ff4444/ffffff', 858.82);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (147, 'Louie', 'Batman', 'lbatman42@cloudflare.com', '2323034092', 'jmZ7tY', '845 Stone Corner Road', 'Dokuchayevs’k', 'Ukraine', 'http://dummyimage.com/218x100.png/5fa2dd/ffffff', 459.77);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (148, 'Brod', 'McDavitt', 'bmcdavitt43@youku.com', '8946599694', 'vBeqDoVgLyLW', '92361 Anthes Alley', 'Jixin', 'China', 'http://dummyimage.com/100x100.png/dddddd/000000', 829.84);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (149, 'Adeline', 'Salvadore', 'asalvadore44@china.com.cn', '3042056692', 'oF3kwo0oq', '4 Daystar Junction', 'Qingfa', 'China', 'http://dummyimage.com/158x100.png/dddddd/000000', 44.18);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (150, 'Diahann', 'Amy', 'damy45@hp.com', '1889751477', '1ufn0ggXo7Yd', '42 Monument Circle', 'Kamuli', 'Uganda', 'http://dummyimage.com/131x100.png/5fa2dd/ffffff', 272.68);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (151, 'Elna', 'Sherbrooke', 'esherbrooke46@opera.com', '4396119732', 'HREyHvpM4D', '0 Hoffman Plaza', 'Veliki Preslav', 'Bulgaria', 'http://dummyimage.com/155x100.png/dddddd/000000', 833.49);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (152, 'Kellia', 'Moneypenny', 'kmoneypenny47@mapquest.com', '7124878763', 'RFSfaSnIWMsk', '0255 Helena Way', 'Espinal', 'Colombia', 'http://dummyimage.com/135x100.png/cc0000/ffffff', 588.95);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (153, 'Piotr', 'Di Francesco', 'pdifrancesco48@prlog.org', '1054806042', 'Zzovi0BBS', '59805 Pine View Junction', 'Garajati', 'Indonesia', 'http://dummyimage.com/108x100.png/cc0000/ffffff', 977.37);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (154, 'Jacquetta', 'Shatliff', 'jshatliff49@cam.ac.uk', '9903192469', 'h61mxnWCw', '6 Maple Wood Place', 'Örebro', 'Sweden', 'http://dummyimage.com/119x100.png/dddddd/000000', 678.26);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (155, 'Avrit', 'Khrishtafovich', 'akhrishtafovich4a@ucsd.edu', '8537876291', 'tVvmIKJ7', '30535 Arizona Alley', 'Takahata', 'Japan', 'http://dummyimage.com/154x100.png/ff4444/ffffff', 442.89);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (156, 'Silas', 'Gabbett', 'sgabbett4b@paypal.com', '9032171342', 'R9WMq0TE', '7 Corscot Pass', 'Yantai', 'China', 'http://dummyimage.com/160x100.png/5fa2dd/ffffff', 824.54);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (157, 'Renate', 'Lorenzo', 'rlorenzo4c@fema.gov', '9232510179', 'MLzCLc5042', '4787 Ridgeway Place', 'Debrecen', 'Hungary', 'http://dummyimage.com/222x100.png/ff4444/ffffff', 279.06);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (158, 'Ingelbert', 'Jorez', 'ijorez4d@abc.net.au', '4785531396', 'ZjeY85Exg4n', '5770 Warner Avenue', 'Kimil’tey', 'Russia', 'http://dummyimage.com/127x100.png/ff4444/ffffff', 291.8);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (159, 'Desiri', 'Laughtisse', 'dlaughtisse4e@e-recht24.de', '4412780144', 'jgUIqUix8FH', '874 Manitowish Avenue', 'Ying’ebu', 'China', 'http://dummyimage.com/105x100.png/cc0000/ffffff', 893.77);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (160, 'Drusie', 'Alvar', 'dalvar4f@newsvine.com', '2574000713', 'IVLpyFXH', '90557 Corscot Plaza', 'Kłoczew', 'Poland', 'http://dummyimage.com/156x100.png/5fa2dd/ffffff', 439.08);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (161, 'Jennine', 'Cliff', 'jcliff4g@networkadvertising.org', '7454462185', 'eH7ZQXH', '3936 Sycamore Alley', 'Boyu', 'China', 'http://dummyimage.com/189x100.png/5fa2dd/ffffff', 581.72);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (162, 'Cecilia', 'Behling', 'cbehling4h@opensource.org', '4113790768', 'gkSe13KIuIY9', '3693 Riverside Parkway', 'Nagorsk', 'Russia', 'http://dummyimage.com/201x100.png/dddddd/000000', 279.57);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (163, 'Lester', 'Piscopello', 'lpiscopello4i@discovery.com', '4119792124', 'hIuTevCPahN', '35462 Buena Vista Way', 'Tbilisskaya', 'Russia', 'http://dummyimage.com/187x100.png/5fa2dd/ffffff', 174.14);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (164, 'Koral', 'Allison', 'kallison4j@hatena.ne.jp', '2892264170', 'G0oLDst', '68 Stone Corner Lane', 'Lapinjärvi', 'Finland', 'http://dummyimage.com/208x100.png/5fa2dd/ffffff', 246.0);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (165, 'Cindra', 'Jorczyk', 'cjorczyk4k@nhs.uk', '5142597141', 'TIdYnDti5NG', '3658 Sachs Alley', 'Monte', 'Portugal', 'http://dummyimage.com/142x100.png/dddddd/000000', 57.58);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (166, 'Lavina', 'Stallybrass', 'lstallybrass4l@geocities.com', '5724946908', 'XmOPzBq5mH', '4223 7th Hill', 'Hendījān', 'Iran', 'http://dummyimage.com/117x100.png/cc0000/ffffff', 216.37);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (167, 'Gothart', 'GiacobbiniJacob', 'ggiacobbinijacob4m@nymag.com', '5717015525', '3XAUwJD0ZCws', '29050 Tony Place', 'Lom Kao', 'Thailand', 'http://dummyimage.com/202x100.png/cc0000/ffffff', 291.79);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (168, 'Caressa', 'Babalola', 'cbabalola4n@whitehouse.gov', '4585109292', 'HSCX4emlCOHA', '0 Mcbride Court', 'Le Havre', 'France', 'http://dummyimage.com/151x100.png/ff4444/ffffff', 350.98);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (169, 'Dulcia', 'Pochin', 'dpochin4o@myspace.com', '6442022358', 'blmgSq00Kj', '5756 4th Hill', 'Mabilog', 'Philippines', 'http://dummyimage.com/221x100.png/ff4444/ffffff', 507.24);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (170, 'Dugald', 'Noddle', 'dnoddle4p@ning.com', '6312561429', 'f7NuPK3', '6944 Lyons Crossing', 'Muldersdriseloop', 'South Africa', 'http://dummyimage.com/152x100.png/5fa2dd/ffffff', 626.95);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (171, 'Anderea', 'Petz', 'apetz4q@elegantthemes.com', '6255024841', 'sMvEGiqc', '75 Schiller Court', 'Sadang Kulon', 'Indonesia', 'http://dummyimage.com/167x100.png/ff4444/ffffff', 51.43);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (172, 'Conroy', 'Verrill', 'cverrill4r@wikispaces.com', '2763727206', 'ACIzXKArEe', '1 Bonner Junction', 'Krajan Winong', 'Indonesia', 'http://dummyimage.com/241x100.png/cc0000/ffffff', 706.06);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (173, 'Elsinore', 'Skerme', 'eskerme4s@epa.gov', '8821507131', 'b6HsBqzBQ', '21 Cherokee Point', 'Cusco', 'Peru', 'http://dummyimage.com/112x100.png/ff4444/ffffff', 341.22);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (174, 'Orren', 'Salkeld', 'osalkeld4t@squarespace.com', '6684792711', 'kPl9YN1L', '08 Summer Ridge Junction', 'Pasarkuok', 'Indonesia', 'http://dummyimage.com/249x100.png/dddddd/000000', 736.2);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (175, 'Kort', 'Harfoot', 'kharfoot4u@aol.com', '1935632796', '33xE5sf1hGrM', '9 Dahle Crossing', 'Sucre', 'Colombia', 'http://dummyimage.com/198x100.png/ff4444/ffffff', 19.28);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (176, 'Thurstan', 'Durnin', 'tdurnin4v@meetup.com', '1544028588', 'oJNVquhuI', '62 Talisman Plaza', 'Rokietnica', 'Poland', 'http://dummyimage.com/182x100.png/dddddd/000000', 268.09);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (177, 'Cosmo', 'Sodor', 'csodor4w@bizjournals.com', '7083432794', 'DIFz2WVMUg', '34493 Sunbrook Place', 'Pouzauges', 'France', 'http://dummyimage.com/152x100.png/dddddd/000000', 266.03);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (178, 'Roxana', 'Jouaneton', 'rjouaneton4x@barnesandnoble.com', '4935022553', 'OYHRZ8lBwXTC', '66 Arapahoe Avenue', 'Ramenki', 'Russia', 'http://dummyimage.com/194x100.png/cc0000/ffffff', 558.69);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (179, 'Nathalie', 'Longcaster', 'nlongcaster4y@dell.com', '9505066109', '4QBWVp', '0014 American Ash Crossing', 'Langres', 'France', 'http://dummyimage.com/199x100.png/ff4444/ffffff', 853.62);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (180, 'Clementina', 'De la Zenne', 'cdelazenne4z@forbes.com', '5675155941', 'ZkErre7', '65 Cherokee Avenue', 'Budapest', 'Hungary', 'http://dummyimage.com/240x100.png/5fa2dd/ffffff', 526.15);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (181, 'Clarabelle', 'Torbett', 'ctorbett50@elpais.com', '9262155165', 'NOXzx5', '97 Meadow Vale Junction', 'Mlawat', 'Indonesia', 'http://dummyimage.com/234x100.png/ff4444/ffffff', 780.56);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (182, 'Donella', 'Durbann', 'ddurbann51@shop-pro.jp', '3592074409', 'RFx9PlJo', '841 Sundown Parkway', 'Al Khirāb', 'Yemen', 'http://dummyimage.com/192x100.png/dddddd/000000', 10.74);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (183, 'Olivie', 'Perrycost', 'operrycost52@google.ca', '5761377744', '7gHwm0H1nDVO', '74280 Kipling Court', 'Kuzovatovo', 'Russia', 'http://dummyimage.com/249x100.png/ff4444/ffffff', 426.25);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (184, 'Konrad', 'Cant', 'kcant53@github.io', '4606376204', 'YbE7lhErt', '45 Calypso Court', 'Valdemārpils', 'Latvia', 'http://dummyimage.com/114x100.png/5fa2dd/ffffff', 395.14);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (185, 'Gib', 'Yerill', 'gyerill54@yellowbook.com', '6313680331', 'qPGbjEF', '960 Annamark Court', 'Jagodnjak', 'Croatia', 'http://dummyimage.com/221x100.png/dddddd/000000', 448.4);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (186, 'Felice', 'Luckey', 'fluckey55@networksolutions.com', '9615944928', 'scl5n3cXkV', '3 Shasta Hill', 'Putrajaya', 'Malaysia', 'http://dummyimage.com/176x100.png/5fa2dd/ffffff', 2.02);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (187, 'Wat', 'Pipet', 'wpipet56@fotki.com', '6219148680', 'NNh60ng', '915 Calypso Junction', 'No Kunda', 'Gambia', 'http://dummyimage.com/178x100.png/dddddd/000000', 297.76);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (188, 'Reilly', 'Binding', 'rbinding57@ucoz.com', '3047797950', 'jJbl2dQoTvV', '5047 Victoria Way', 'Huntington', 'United States', 'http://dummyimage.com/248x100.png/cc0000/ffffff', 878.93);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (189, 'Elora', 'McFayden', 'emcfayden58@example.com', '3961899755', 'LsnmHimS', '38 Arizona Center', 'San Julian', 'Philippines', 'http://dummyimage.com/236x100.png/cc0000/ffffff', 439.63);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (190, 'Kiah', 'Trimming', 'ktrimming59@hugedomains.com', '3449219293', 'ZZFGSQX1', '684 Rockefeller Point', 'Caen', 'France', 'http://dummyimage.com/156x100.png/5fa2dd/ffffff', 500.96);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (191, 'Willetta', 'Wroe', 'wwroe5a@ovh.net', '2283293173', 'rYBuskf', '9 Arizona Junction', 'Santo Domingo Oeste', 'Dominican Republic', 'http://dummyimage.com/236x100.png/5fa2dd/ffffff', 930.13);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (192, 'Johnathan', 'Cicconettii', 'jcicconettii5b@geocities.com', '1951096900', 'IMWF7D7cE1mv', '8513 Paget Way', 'Okrika', 'Nigeria', 'http://dummyimage.com/128x100.png/cc0000/ffffff', 786.22);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (193, 'Alvie', 'Gabriel', 'agabriel5c@dagondesign.com', '6613820293', 'sDd8gr3', '20 Drewry Crossing', 'Nanyang', 'China', 'http://dummyimage.com/203x100.png/ff4444/ffffff', 853.26);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (194, 'Florinda', 'Plumridege', 'fplumridege5d@comsenz.com', '9814740625', 'QP1hfibW2d', '01 Del Sol Road', 'Gardēz', 'Afghanistan', 'http://dummyimage.com/138x100.png/cc0000/ffffff', 425.02);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (195, 'Clement', 'Flay', 'cflay5e@netvibes.com', '3198824609', 'B1TkJiM', '1343 Leroy Court', 'Zaliznychne', 'Ukraine', 'http://dummyimage.com/215x100.png/ff4444/ffffff', 979.91);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (196, 'Jonathan', 'Rickersey', 'jrickersey5f@noaa.gov', '9657595259', 'jCLWr03sT', '8 Milwaukee Terrace', 'Xingou', 'China', 'http://dummyimage.com/102x100.png/5fa2dd/ffffff', 271.25);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (197, 'Tandy', 'Liepina', 'tliepina5g@flickr.com', '5326854921', 'w3sHB53X', '49112 Bartillon Plaza', 'Galapa', 'Colombia', 'http://dummyimage.com/163x100.png/dddddd/000000', 584.67);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (198, 'Irma', 'Lindermann', 'ilindermann5h@hibu.com', '5274116493', 'c4iIRv1YMsu', '4540 Sommers Alley', 'Lagoaça', 'Portugal', 'http://dummyimage.com/117x100.png/5fa2dd/ffffff', 449.39);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (199, 'Keenan', 'Alastair', 'kalastair5i@g.co', '3638814434', 'VaK3eI', '0 Shelley Place', 'Matungao', 'Philippines', 'http://dummyimage.com/159x100.png/5fa2dd/ffffff', 32.92);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (200, 'Francklin', 'O'' Dornan', 'fodornan5j@oakley.com', '1352383090', 'Msmjc895', '3 Old Shore Pass', 'Méru', 'France', 'http://dummyimage.com/120x100.png/ff4444/ffffff', 697.49);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (201, 'Felice', 'Matzl', 'fmatzl5k@com.com', '6196660004', '0R0ZDz', '62537 Northport Place', 'Breda', 'Netherlands', 'http://dummyimage.com/217x100.png/5fa2dd/ffffff', 593.06);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (202, 'Thom', 'Dyerson', 'tdyerson5l@sun.com', '4182713103', 'McxlinG', '08 Stuart Drive', 'Concepción', 'Paraguay', 'http://dummyimage.com/206x100.png/dddddd/000000', 531.18);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (203, 'Jamie', 'Trye', 'jtrye5m@icio.us', '9265492413', 'JUWOvmeP', '95219 Canary Plaza', 'Ujar', 'Azerbaijan', 'http://dummyimage.com/152x100.png/5fa2dd/ffffff', 783.21);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (204, 'Corrie', 'Rodrigo', 'crodrigo5n@seattletimes.com', '8008310056', 'rxbEG1', '3 Boyd Plaza', 'Mora', 'Sweden', 'http://dummyimage.com/127x100.png/ff4444/ffffff', 80.91);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (205, 'Russell', 'Whiff', 'rwhiff5o@hao123.com', '5995106159', 'vEddllcV8A', '2 Barnett Hill', 'Igbeti', 'Nigeria', 'http://dummyimage.com/108x100.png/dddddd/000000', 183.33);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (206, 'Domenic', 'Albro', 'dalbro5p@google.com.br', '9149378958', 'VBJgLQxRXJ', '435 7th Place', 'La Paz', 'Philippines', 'http://dummyimage.com/122x100.png/ff4444/ffffff', 812.71);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (207, 'Rabi', 'Oakeby', 'roakeby5q@yahoo.co.jp', '3188954984', 'xssobyvTpk', '2 Donald Road', 'Palkovice', 'Czech Republic', 'http://dummyimage.com/167x100.png/5fa2dd/ffffff', 227.18);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (208, 'Fianna', 'Paumier', 'fpaumier5r@woothemes.com', '5861413469', 'pCSgzdA4Y', '636 Anhalt Parkway', 'Shibushi', 'Japan', 'http://dummyimage.com/150x100.png/dddddd/000000', 424.94);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (209, 'Natala', 'Durnford', 'ndurnford5s@sciencedaily.com', '7255695562', 'SmZiBRtJskem', '8155 Golf Course Center', 'Marianowo', 'Poland', 'http://dummyimage.com/136x100.png/cc0000/ffffff', 888.08);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (210, 'Carly', 'Bonnier', 'cbonnier5t@ovh.net', '2733564467', 'hWMBtiNSvJua', '55 Vidon Drive', 'Valuyki', 'Russia', 'http://dummyimage.com/155x100.png/ff4444/ffffff', 868.55);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (211, 'Anica', 'Yapp', 'ayapp5u@dion.ne.jp', '7642107745', 'TqzzOqK', '65600 Jackson Court', 'Las Matas de Santa Cruz', 'Dominican Republic', 'http://dummyimage.com/168x100.png/5fa2dd/ffffff', 303.44);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (212, 'Lynnette', 'McPhaden', 'lmcphaden5v@thetimes.co.uk', '5035994005', '1Q3b4f05dZx', '21 Vera Circle', 'Sandaohezi', 'China', 'http://dummyimage.com/242x100.png/cc0000/ffffff', 674.37);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (213, 'Flossi', 'Gotliffe', 'fgotliffe5w@businessinsider.com', '3144081978', 'j6xzI5', '34 Orin Lane', 'Xiaozhen', 'China', 'http://dummyimage.com/184x100.png/ff4444/ffffff', 538.24);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (214, 'Chiquita', 'Hrishanok', 'chrishanok5x@reference.com', '5611425955', 'g9XG1O4ys', '374 Pearson Lane', 'Santa Catalina Norte', 'Philippines', 'http://dummyimage.com/148x100.png/cc0000/ffffff', 744.38);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (215, 'Sonnnie', 'Dykas', 'sdykas5y@arizona.edu', '2463903964', '8ZppgO0Y08', '00975 Katie Avenue', 'Bongued', 'Philippines', 'http://dummyimage.com/129x100.png/dddddd/000000', 36.89);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (216, 'Clarice', 'Siegertsz', 'csiegertsz5z@examiner.com', '8586103116', 'xuzheHc94A02', '1 Grasskamp Crossing', 'Velká nad Veličkou', 'Czech Republic', 'http://dummyimage.com/158x100.png/dddddd/000000', 566.48);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (217, 'Etienne', 'Monkman', 'emonkman60@4shared.com', '2767671527', 'vMkDVyFA', '9649 Muir Lane', 'Karpokhórion', 'Greece', 'http://dummyimage.com/225x100.png/5fa2dd/ffffff', 492.04);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (218, 'Malchy', 'Leinster', 'mleinster61@flavors.me', '5413930324', '9LQtJ0', '963 International Plaza', 'Kamienna Góra', 'Poland', 'http://dummyimage.com/102x100.png/5fa2dd/ffffff', 681.3);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (219, 'Carey', 'Herrero', 'cherrero62@wsj.com', '6657885719', 'Oui5B9', '92752 Valley Edge Point', 'Araras', 'Brazil', 'http://dummyimage.com/210x100.png/cc0000/ffffff', 351.19);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (220, 'Ingelbert', 'Vido', 'ivido63@gnu.org', '6348680568', 'L1xf1LCJD', '9 Sloan Road', 'Police nad Metují', 'Czech Republic', 'http://dummyimage.com/209x100.png/5fa2dd/ffffff', 972.93);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (221, 'Rolph', 'Ruggieri', 'rruggieri64@cisco.com', '9654637441', 'B1BtzulQr', '8731 Eastwood Avenue', 'Ithari', 'Nepal', 'http://dummyimage.com/230x100.png/cc0000/ffffff', 164.13);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (222, 'Aleta', 'Croshaw', 'acroshaw65@mediafire.com', '2348127073', 'depuJQgfRk', '03445 Raven Drive', 'Miskolc', 'Hungary', 'http://dummyimage.com/178x100.png/cc0000/ffffff', 574.29);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (223, 'Harriott', 'Worsalls', 'hworsalls66@wired.com', '7702315571', 'eQ4LtMzH', '4282 Hoard Center', 'Iwonicz-Zdrój', 'Poland', 'http://dummyimage.com/158x100.png/cc0000/ffffff', 766.33);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (224, 'Ad', 'Andren', 'aandren67@netlog.com', '6169692270', '82qZXzDUSz7', '745 Moose Park', 'Grand Rapids', 'United States', 'http://dummyimage.com/101x100.png/ff4444/ffffff', 329.44);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (225, 'Whitby', 'Salzen', 'wsalzen68@dion.ne.jp', '2572641656', 'i3OLPWy', '39799 Quincy Drive', 'Kasli', 'Russia', 'http://dummyimage.com/234x100.png/dddddd/000000', 405.15);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (226, 'Padriac', 'Tartt', 'ptartt69@reuters.com', '2363502970', 'egiZBZ', '1650 Brickson Park Road', 'Xiushan', 'China', 'http://dummyimage.com/146x100.png/cc0000/ffffff', 66.7);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (227, 'Idalina', 'Pender', 'ipender6a@upenn.edu', '4927973888', 'guYxUD7NUV', '5746 Northview Way', 'Ciawitali', 'Indonesia', 'http://dummyimage.com/199x100.png/5fa2dd/ffffff', 444.1);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (228, 'Hedda', 'Ephson', 'hephson6b@oracle.com', '2941410290', 'KwgqZF', '60551 Old Shore Parkway', 'Hinlayagan Ilaud', 'Philippines', 'http://dummyimage.com/135x100.png/cc0000/ffffff', 731.73);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (229, 'Prudy', 'Bygreaves', 'pbygreaves6c@sciencedirect.com', '5902078384', 'Eo5i6LIWe', '02 Cordelia Lane', 'Amashca', 'Peru', 'http://dummyimage.com/113x100.png/5fa2dd/ffffff', 855.87);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (230, 'Camila', 'Brooke', 'cbrooke6d@dagondesign.com', '8979917677', 'K5cdyHEWnkfR', '53818 Judy Trail', 'Gaomi', 'China', 'http://dummyimage.com/135x100.png/ff4444/ffffff', 541.5);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (231, 'Sophi', 'Poulsom', 'spoulsom6e@cyberchimps.com', '9826106355', 'vZulCXzfZh', '5100 Becker Alley', 'Yaodu', 'China', 'http://dummyimage.com/115x100.png/5fa2dd/ffffff', 339.55);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (232, 'Baron', 'O''Lynn', 'bolynn6f@wiley.com', '8651298124', '8klzNiPgR', '58 Carioca Junction', 'Santo António das Areias', 'Portugal', 'http://dummyimage.com/133x100.png/5fa2dd/ffffff', 85.62);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (233, 'Jonell', 'Faber', 'jfaber6g@goo.ne.jp', '8936769476', '9t4JLlqUN18m', '44 Waywood Trail', 'Joutseno', 'Finland', 'http://dummyimage.com/228x100.png/5fa2dd/ffffff', 491.64);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (234, 'Melamie', 'Greenman', 'mgreenman6h@creativecommons.org', '7141422585', 'xrpv9G', '0532 Fremont Parkway', 'Az Zintān', 'Libya', 'http://dummyimage.com/143x100.png/5fa2dd/ffffff', 475.49);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (235, 'Euphemia', 'Stammer', 'estammer6i@technorati.com', '8556976611', 'C9GfVmmxmX9', '493 Portage Drive', 'Saratak', 'Armenia', 'http://dummyimage.com/191x100.png/5fa2dd/ffffff', 179.69);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (236, 'Alonso', 'Python', 'apython6j@1und1.de', '1738518464', 'zzRVOKy2E9', '826 Heath Point', 'Frankfort', 'South Africa', 'http://dummyimage.com/117x100.png/ff4444/ffffff', 300.8);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (237, 'Elfrida', 'Levinge', 'elevinge6k@narod.ru', '4456032486', 'XbSKXR', '1 Lindbergh Center', 'Michałowo', 'Poland', 'http://dummyimage.com/244x100.png/ff4444/ffffff', 872.74);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (238, 'Angelita', 'Purnell', 'apurnell6l@epa.gov', '5619757483', 'GnKkLnU8NUOW', '631 Granby Terrace', 'Al Quşayr', 'Egypt', 'http://dummyimage.com/119x100.png/ff4444/ffffff', 744.46);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (239, 'Mohandas', 'Wells', 'mwells6m@diigo.com', '8382334165', 'OuCQs0Cz', '52 Haas Pass', 'Borisovka', 'Russia', 'http://dummyimage.com/151x100.png/5fa2dd/ffffff', 688.97);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (240, 'Yanaton', 'Arboine', 'yarboine6n@businesswire.com', '2333756437', 'wIrKjlVF', '482 Summer Ridge Way', 'Puzi', 'China', 'http://dummyimage.com/180x100.png/cc0000/ffffff', 462.14);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (241, 'Myrvyn', 'Tortoise', 'mtortoise6o@webmd.com', '9669111224', 'yIH0SS2', '4490 Oak Center', 'Mariano Moreno', 'Argentina', 'http://dummyimage.com/125x100.png/5fa2dd/ffffff', 993.08);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (242, 'Hildagard', 'Scandwright', 'hscandwright6p@berkeley.edu', '2888210537', 'keEtPl08sKz', '24 Boyd Trail', 'Sobral', 'Brazil', 'http://dummyimage.com/104x100.png/ff4444/ffffff', 539.01);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (243, 'Nil', 'McVee', 'nmcvee6q@microsoft.com', '5815293945', '1OTpX4L4i', '8 Mitchell Parkway', 'Zhishan', 'China', 'http://dummyimage.com/214x100.png/dddddd/000000', 333.53);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (244, 'Katharyn', 'Vanichkin', 'kvanichkin6r@ebay.co.uk', '3762762670', 'Mu6HO8shEGXU', '11 Hauk Road', 'Pandakan', 'Philippines', 'http://dummyimage.com/227x100.png/5fa2dd/ffffff', 698.93);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (245, 'Almeria', 'Kelly', 'akelly6s@xing.com', '8581366303', 'KDpE9zBC3n', '73 Marquette Junction', 'Anahuac', 'Mexico', 'http://dummyimage.com/209x100.png/cc0000/ffffff', 584.43);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (246, 'Elenore', 'Senescall', 'esenescall6t@bbb.org', '5038265444', '5BjVUQPVQ', '69 East Junction', 'Shicheng', 'China', 'http://dummyimage.com/123x100.png/dddddd/000000', 725.24);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (247, 'Hermann', 'Pinner', 'hpinner6u@webs.com', '5136687544', 'z6AB8Ej', '326 Vera Road', 'Peña', 'Philippines', 'http://dummyimage.com/141x100.png/ff4444/ffffff', 957.24);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (248, 'Chaunce', 'Revely', 'crevely6v@businesswire.com', '2388736248', 'vvWvPpgXA2rA', '05936 Transport Pass', 'Novyy Starodub', 'Ukraine', 'http://dummyimage.com/233x100.png/ff4444/ffffff', 554.09);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (249, 'Pauly', 'Cochern', 'pcochern6w@cam.ac.uk', '8856738093', 'DKHsZCebRZIm', '56 Waywood Lane', 'Mushu', 'China', 'http://dummyimage.com/167x100.png/dddddd/000000', 397.92);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (250, 'Saunderson', 'Dumbare', 'sdumbare6x@moonfruit.com', '2934424810', '0rJVZy4', '58807 Dovetail Crossing', 'Guarabira', 'Brazil', 'http://dummyimage.com/196x100.png/ff4444/ffffff', 421.46);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (251, 'Ediva', 'Blincoe', 'eblincoe6y@berkeley.edu', '1017078460', 'FIO2TigUji', '09 Hovde Pass', 'Kilindoni', 'Tanzania', 'http://dummyimage.com/178x100.png/ff4444/ffffff', 457.25);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (252, 'Katharina', 'Whittleton', 'kwhittleton6z@narod.ru', '1924937246', 'KbbjY1TszQ', '256 Garrison Park', 'Dazaifu', 'Japan', 'http://dummyimage.com/191x100.png/dddddd/000000', 223.79);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (253, 'Carissa', 'Juppe', 'cjuppe70@arstechnica.com', '9569087936', 'srUgVDjIB', '0371 Raven Street', 'Yangdun', 'China', 'http://dummyimage.com/136x100.png/5fa2dd/ffffff', 282.66);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (254, 'Guglielmo', 'Barrington', 'gbarrington71@vkontakte.ru', '1843448701', '8USdwkDRaf', '06158 Carioca Terrace', 'Ongandjera', 'Namibia', 'http://dummyimage.com/246x100.png/cc0000/ffffff', 261.12);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (255, 'Celinka', 'Addlestone', 'caddlestone72@senate.gov', '5652299813', 'C9RzToq', '4711 Green Pass', 'Shangyi', 'China', 'http://dummyimage.com/249x100.png/5fa2dd/ffffff', 652.07);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (256, 'Titos', 'Billiard', 'tbilliard73@ox.ac.uk', '6195667596', 'dnfqQIo', '12454 South Road', 'Älvsbyn', 'Sweden', 'http://dummyimage.com/243x100.png/5fa2dd/ffffff', 55.52);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (257, 'Thorsten', 'Bigly', 'tbigly74@uiuc.edu', '8698959377', 'IuO5fs', '7300 Stephen Plaza', 'Xibër-Murrizë', 'Albania', 'http://dummyimage.com/218x100.png/5fa2dd/ffffff', 72.53);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (258, 'Karyn', 'Ambrosio', 'kambrosio75@cafepress.com', '1007126159', 'FhNRQ0ye', '28 Cody Trail', 'Chýnov', 'Czech Republic', 'http://dummyimage.com/189x100.png/ff4444/ffffff', 72.2);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (259, 'Frederigo', 'Meharry', 'fmeharry76@studiopress.com', '9755509284', '46IJCplu', '48983 Crescent Oaks Parkway', 'Banaba', 'Philippines', 'http://dummyimage.com/127x100.png/ff4444/ffffff', 567.37);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (260, 'Francisco', 'Dearl', 'fdearl77@sakura.ne.jp', '9427875519', 'lniXTcpVxj', '9503 Bunting Lane', 'Gununglarang', 'Indonesia', 'http://dummyimage.com/178x100.png/5fa2dd/ffffff', 522.0);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (261, 'Gearalt', 'Luton', 'gluton78@webmd.com', '9632885138', 'o1GQY8ZYvt1', '88 Bobwhite Court', 'Venëv', 'Russia', 'http://dummyimage.com/172x100.png/cc0000/ffffff', 528.09);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (262, 'Gaynor', 'Jillings', 'gjillings79@phpbb.com', '8017765007', 'SkupJl5E1Q', '7 Porter Crossing', 'Salt Lake City', 'United States', 'http://dummyimage.com/213x100.png/dddddd/000000', 357.42);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (263, 'Josh', 'Colliss', 'jcolliss7a@google.co.uk', '4876532652', 'GtADPM', '31 Thierer Parkway', 'Myshkin', 'Russia', 'http://dummyimage.com/201x100.png/dddddd/000000', 927.5);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (264, 'Euell', 'Schottli', 'eschottli7b@msn.com', '8094217329', 'MpTT9mtW', '32 Coleman Park', 'Bački Breg', 'Serbia', 'http://dummyimage.com/107x100.png/ff4444/ffffff', 784.3);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (265, 'Lia', 'Lemary', 'llemary7c@tripod.com', '6874514052', '7QyjbMf', '32 Claremont Parkway', 'Gravataí', 'Brazil', 'http://dummyimage.com/196x100.png/dddddd/000000', 214.87);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (266, 'Juliana', 'Slorance', 'jslorance7d@github.io', '1015904413', '7SDOiGw0', '999 Prairieview Plaza', 'Burgeo', 'Canada', 'http://dummyimage.com/126x100.png/cc0000/ffffff', 581.07);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (267, 'Zane', 'Bradie', 'zbradie7e@bbb.org', '2492647440', 'vKMTKBFW', '2 Pennsylvania Plaza', 'Kasungu', 'Malawi', 'http://dummyimage.com/145x100.png/ff4444/ffffff', 615.93);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (268, 'Daisie', 'De la Feld', 'ddelafeld7f@behance.net', '3603310706', 'TkGmxnpaQpB', '280 Pleasure Center', 'Örebro', 'Sweden', 'http://dummyimage.com/191x100.png/cc0000/ffffff', 409.54);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (269, 'Reggis', 'Eddicott', 'reddicott7g@myspace.com', '7031974751', 'HOkBIfN', '690 Tomscot Point', 'Blawi', 'Indonesia', 'http://dummyimage.com/247x100.png/ff4444/ffffff', 779.14);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (270, 'Daphna', 'Ghidelli', 'dghidelli7h@state.gov', '6094089464', 'JLgDizFySQ', '540 Hudson Point', 'Ron Phibun', 'Thailand', 'http://dummyimage.com/148x100.png/ff4444/ffffff', 94.66);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (271, 'Leigh', 'Eul', 'leul7i@studiopress.com', '4522231590', 'C3bwhvHjhT', '05152 Hoffman Junction', 'Sydney', 'Australia', 'http://dummyimage.com/200x100.png/5fa2dd/ffffff', 535.33);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (272, 'Dore', 'Sciusscietto', 'dsciusscietto7j@studiopress.com', '9101767801', '0zxHMSeqc9', '3 Tomscot Crossing', 'Brańsk', 'Poland', 'http://dummyimage.com/249x100.png/dddddd/000000', 652.15);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (273, 'Angela', 'Ference', 'aference7k@mac.com', '2074354918', '6pG02hs0', '5 Pleasure Crossing', 'Borzechów', 'Poland', 'http://dummyimage.com/136x100.png/ff4444/ffffff', 59.11);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (274, 'Waldemar', 'Hayen', 'whayen7l@loc.gov', '1692795577', 'GRFRwTtl', '24 Debs Junction', 'San Luis', 'Argentina', 'http://dummyimage.com/192x100.png/cc0000/ffffff', 218.94);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (275, 'Corissa', 'Wimlett', 'cwimlett7m@google.cn', '6162161362', 'mWa0Hfx42Het', '5799 Macpherson Hill', 'Samothráki', 'Greece', 'http://dummyimage.com/215x100.png/cc0000/ffffff', 437.86);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (276, 'Maud', 'Serchwell', 'mserchwell7n@4shared.com', '8465160434', '3B51iP', '27 Barnett Circle', 'Pardesiyya', 'Israel', 'http://dummyimage.com/210x100.png/cc0000/ffffff', 975.37);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (277, 'Page', 'Cough', 'pcough7o@microsoft.com', '4836915878', '5Bp8GmWF', '8 Gale Lane', 'Kazanlŭk', 'Bulgaria', 'http://dummyimage.com/110x100.png/5fa2dd/ffffff', 48.67);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (278, 'Gallard', 'Verheijden', 'gverheijden7p@clickbank.net', '6629974542', 'Q5ZxoZwlD', '8174 Clyde Gallagher Way', 'La Esperanza', 'Mexico', 'http://dummyimage.com/162x100.png/dddddd/000000', 432.28);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (279, 'Marquita', 'Martinuzzi', 'mmartinuzzi7q@so-net.ne.jp', '8922263532', 'XtLzB6QqUQ', '9010 Kedzie Place', 'Baojia', 'China', 'http://dummyimage.com/122x100.png/dddddd/000000', 168.16);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (280, 'Felicity', 'Lowater', 'flowater7r@who.int', '1586576206', 'G99QNA', '8 Mariners Cove Center', 'Jinggongqiao', 'China', 'http://dummyimage.com/183x100.png/ff4444/ffffff', 66.04);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (281, 'Linnet', 'Olpin', 'lolpin7s@ameblo.jp', '8457501401', 'jOInx6W', '38457 Prentice Center', 'Caleufú', 'Argentina', 'http://dummyimage.com/100x100.png/5fa2dd/ffffff', 710.81);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (282, 'Ford', 'Hellis', 'fhellis7t@wufoo.com', '9551943667', 'TzmCVAJ', '50870 Washington Terrace', 'Al Hoceïma', 'Morocco', 'http://dummyimage.com/131x100.png/5fa2dd/ffffff', 430.52);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (283, 'Rebe', 'Laise', 'rlaise7u@cnbc.com', '6026605592', '0jWz3a8OSK', '15 Harper Court', 'Felege Neway', 'Ethiopia', 'http://dummyimage.com/111x100.png/5fa2dd/ffffff', 864.58);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (284, 'Starla', 'Alexsandrov', 'salexsandrov7v@alibaba.com', '2175378306', 'RgnB7tdjz9r', '49881 Schiller Street', 'Bzenec', 'Czech Republic', 'http://dummyimage.com/124x100.png/cc0000/ffffff', 80.54);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (285, 'Fiorenze', 'Magor', 'fmagor7w@instagram.com', '8612049211', 'SHpLtCK', '1084 Graceland Hill', 'San Rafael', 'Peru', 'http://dummyimage.com/135x100.png/cc0000/ffffff', 420.8);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (286, 'Catarina', 'Pottes', 'cpottes7x@utexas.edu', '6114408602', '7MLEJ82MGw', '88 Corben Way', 'Aripuanã', 'Brazil', 'http://dummyimage.com/121x100.png/ff4444/ffffff', 412.44);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (287, 'Ernest', 'Polsin', 'epolsin7y@blinklist.com', '4662026054', 'Ioq9Xv7Mxm', '6 Hansons Pass', 'Puqi', 'China', 'http://dummyimage.com/112x100.png/dddddd/000000', 689.38);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (288, 'Cris', 'Salzberger', 'csalzberger7z@hexun.com', '6708320171', 's8DSdsF97C', '55 Debs Parkway', 'Esparza', 'Costa Rica', 'http://dummyimage.com/157x100.png/ff4444/ffffff', 877.09);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (289, 'Rosemarie', 'Grayling', 'rgrayling80@examiner.com', '9161874989', 'c1goQR9G', '2 Northport Point', 'Sacramento', 'United States', 'http://dummyimage.com/234x100.png/ff4444/ffffff', 56.6);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (290, 'Ilyse', 'Coundley', 'icoundley81@google.ca', '5602331288', 'pR1zF1paV', '43290 Anthes Drive', 'Vejprnice', 'Czech Republic', 'http://dummyimage.com/211x100.png/cc0000/ffffff', 171.62);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (291, 'Cristy', 'Southerell', 'csoutherell82@hatena.ne.jp', '4677293134', 'G5sA1TB2j1x0', '041 7th Circle', 'Madang', 'Papua New Guinea', 'http://dummyimage.com/137x100.png/5fa2dd/ffffff', 216.14);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (292, 'Jemmie', 'Blackaby', 'jblackaby83@time.com', '8233602518', 'f1Qti50', '8 Dottie Hill', 'Grootfontein', 'Namibia', 'http://dummyimage.com/187x100.png/ff4444/ffffff', 361.08);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (293, 'Sarge', 'Clemendot', 'sclemendot84@alexa.com', '8112220342', 'pEAlwEDOCyHR', '07 Rockefeller Junction', 'Shiwan', 'China', 'http://dummyimage.com/134x100.png/ff4444/ffffff', 168.73);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (294, 'Egon', 'Cahillane', 'ecahillane85@alibaba.com', '5648439700', 'oVNDF1CAtni', '29 Westport Drive', 'Kaliro', 'Uganda', 'http://dummyimage.com/113x100.png/ff4444/ffffff', 136.37);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (295, 'Mose', 'Fairburne', 'mfairburne86@mail.ru', '4492153367', 'LATgjyl', '44512 Loomis Terrace', 'Trondheim', 'Norway', 'http://dummyimage.com/117x100.png/ff4444/ffffff', 464.88);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (296, 'Christi', 'Dragon', 'cdragon87@smugmug.com', '3751839397', 'FYKfjvpIwDh', '8 Shopko Crossing', 'Reshetnikovo', 'Russia', 'http://dummyimage.com/130x100.png/dddddd/000000', 474.86);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (297, 'Marget', 'Bernucci', 'mbernucci88@usnews.com', '9074754184', 'wBluOZG2VBa8', '77852 Westerfield Alley', 'Orsk', 'Russia', 'http://dummyimage.com/246x100.png/ff4444/ffffff', 775.97);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (298, 'Wang', 'Hefford', 'whefford89@time.com', '6192510231', 'JWvItc0aYb', '454 Browning Place', 'Qiaoyi', 'China', 'http://dummyimage.com/227x100.png/5fa2dd/ffffff', 919.32);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (299, 'Siobhan', 'Aizikovich', 'saizikovich8a@youku.com', '8334386830', 'qS2Iepfos', '2 Milwaukee Point', 'Xujiaqiao', 'China', 'http://dummyimage.com/110x100.png/ff4444/ffffff', 585.47);
insert into customer_account (i_num, first_name, last_name, email, phone, password, address, city, country, profile_pic, balance) values (300, 'Cyrus', 'Latour', 'clatour8b@163.com', '4972348132', 'Ls0vna', '09 Spenser Center', 'Kokubunji', 'Japan', 'http://dummyimage.com/224x100.png/dddddd/000000', 166.89);

-- INSERT DATA INTO 'AUCTION_PRODUCT' TABLE
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (1,'Dejesus','9.94','2025-09-19 12:11:17','Harlan','Geoffrey','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (2,'Leblanc','0.22','2024-06-17 22:09:42','Barry','Chloe','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (3,'Santiago','5.04','2022-06-17 03:46:02','Bruno','Haviva','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (4,'Bond','4.10','2026-02-12 02:02:51','Barrett','Ariel','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (5,'Parrish','5.32','2027-10-16 12:26:28','Giacomo','Florence','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (6,'Bruce','8.89','2027-10-13 05:55:27','Lucy','Cally','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (7,'Richards','1.99','2022-02-16 08:17:18','Velma','Lance','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (8,'Vaughan','6.36','2023-06-24 05:32:59','Christen','Ulla','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (9,'Weiss','9.53','2033-10-02 12:59:04','Avye','Quinlan','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (10,'Gibson','9.83','2021-07-15 06:53:39','Danielle','Brandon','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (11,'Warren','1.05','2033-05-16 08:48:15','Jescie','Orlando','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (12,'Alexander','4.80','2023-07-15 05:50:27','Carlos','Griffith','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (13,'Delaney','9.12','2023-06-06 01:03:17','Bruce','Kato','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (14,'Cooper','3.30','2022-01-25 04:06:07','Unity','Griffin','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (15,'Finley','8.85','2033-09-19 16:21:15','Meghan','Destiny','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (16,'Sharp','3.88','2028-04-13 09:43:58','Wendy','Jack','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (17,'Owen','4.40','2024-03-16 06:29:18','Florence','Deacon','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (18,'Flowers','7.27','2029-01-24 07:31:44','Emily','Teagan','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (19,'Hooper','2.84','2022-02-28 18:28:38','Lane','Dahlia','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (20,'Salinas','9.45','2028-04-27 02:50:55','Xerxes','James','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (21,'Reynolds','1.23','2029-11-03 15:34:44','Regina','Fulton','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (22,'Kent','3.35','2036-01-05 05:33:01','Josephine','Colby','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (23,'Wiggins','8.37','2028-06-19 00:17:27','Mollie','Calista','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (24,'Mcmillan','0.91','2026-12-17 05:46:17','Theodore','Adrian','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (25,'Key','4.15','2028-10-24 04:07:41','Xander','Alice','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (26,'Kemp','6.22','2023-03-27 20:14:19','Fletcher','Audrey','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (27,'Booth','1.78','2033-02-03 23:58:19','James','Hoyt','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (28,'Hoover','5.15','2033-02-11 04:08:10','Fuller','Wanda','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (29,'Leon','9.12','2020-10-12 11:41:11','Lester','Moses','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (30,'Sanchez','2.01','2023-01-31 12:47:58','Rowan','Vernon','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (31,'Becker','2.11','2021-05-30 05:15:30','Ivory','Grady','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (32,'Morris','3.59','2029-12-05 06:50:23','Stewart','Quentin','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (33,'Woodward','9.69','2031-06-25 07:28:55','Erasmus','David','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (34,'Hancock','5.54','2028-05-19 20:26:28','Clare','Wayne','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (35,'Boyer','9.84','2029-02-15 10:04:49','Ann','Wylie','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (36,'Dorsey','6.42','2030-08-31 09:20:23','Marshall','Hermione','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (37,'Williamson','1.95','2026-12-06 05:42:05','Eugenia','Halla','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (38,'Malone','0.09','2031-05-20 06:31:14','Tanisha','Duncan','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (39,'Brown','1.25','2031-05-25 07:18:03','Clementine','Maryam','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (40,'Chen','0.65','2023-06-20 19:12:20','Giselle','Armando','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (41,'Schroeder','9.06','2035-07-16 12:35:30','Lila','Aspen','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (42,'Gibbs','5.87','2028-11-20 13:52:31','Peter','Tamara','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (43,'Schmidt','3.51','2027-07-25 08:15:27','Graham','Kiona','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (44,'Alvarado','2.21','2025-08-12 09:46:05','Dalton','Mercedes','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (45,'Mills','7.83','2029-02-23 09:01:12','Cathleen','Sarah','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (46,'Peterson','0.33','2033-03-23 00:56:19','Macon','Denton','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (47,'Rivers','5.52','2029-12-15 09:23:54','Kasimir','Carolyn','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (48,'French','7.12','2021-02-06 00:26:58','August','Cole','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (49,'Solomon','8.96','2032-07-19 16:31:08','Jamal','Andrew','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (50,'Kane','4.16','2020-12-18 17:22:50','Keefe','Micah','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (51,'Richmond','8.87','2021-11-25 22:25:56','Lenore','Ahmed','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (52,'Greene','6.74','2024-06-23 04:48:44','Serina','Erica','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (53,'Mcmillan','9.76','2021-07-26 06:14:02','Scarlett','Jocelyn','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (54,'Rodgers','5.86','2031-09-07 04:47:50','Morgan','Ulric','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (55,'Wiggins','8.89','2025-03-28 12:40:19','Ivory','Cynthia','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (56,'Robinson','4.23','2035-06-11 07:52:25','Moses','Edan','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (57,'Sharp','7.27','2035-11-12 08:26:12','Odysseus','Octavius','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (58,'Ayala','8.04','2023-08-04 21:26:40','Darrel','Thane','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (59,'Collier','4.49','2032-02-04 09:21:21','Meghan','Emmanuel','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (60,'Santana','5.34','2024-05-20 22:47:43','Isabella','Acton','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (61,'Lott','6.41','2024-08-13 09:12:50','Jaquelyn','Francis','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (62,'Leach','0.66','2036-04-27 22:17:42','Honorato','Bell','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (63,'Mcdowell','4.22','2024-10-14 07:49:48','Wilma','Simon','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (64,'Sherman','1.62','2029-06-10 23:06:34','Venus','Bert','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (65,'Roth','0.14','2036-06-11 15:52:10','Bruno','Medge','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (66,'Stephenson','2.80','2025-10-18 05:13:38','Reese','Dominique','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (67,'Mcdonald','1.41','2022-10-22 05:20:34','Axel','Isaiah','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (68,'Vazquez','3.43','2028-01-12 05:46:54','Philip','Kamal','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (69,'Delacruz','1.27','2031-03-20 09:24:48','Wade','Zoe','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (70,'Cooke','2.07','2034-01-05 03:21:39','Abel','Jael','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (71,'Cote','4.15','2029-09-21 02:55:27','Susan','Amir','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (72,'Navarro','8.83','2025-01-18 16:02:19','Keegan','Nina','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (73,'Day','6.07','2026-09-10 20:45:31','Paloma','Quemby','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (74,'Aguirre','7.57','2030-06-21 15:26:01','Kadeem','Idona','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (75,'Anthony','5.15','2033-03-23 21:05:40','Lars','Malik','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (76,'Sykes','2.45','2031-07-20 23:03:47','Alexander','Orlando','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (77,'Simpson','1.67','2024-08-15 00:01:02','Victor','Clayton','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (78,'Dunlap','4.66','2031-02-01 15:03:22','Jarrod','Gretchen','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (79,'Conway','8.80','2036-01-31 02:49:04','Dalton','Emmanuel','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (80,'Mcclure','8.13','2033-10-19 12:34:00','Steven','Vera','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (81,'Holloway','6.40','2024-12-12 01:08:51','Venus','Shaeleigh','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (82,'Andrews','8.03','2021-08-04 13:15:42','Jael','Eaton','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (83,'Rowland','1.73','2033-08-25 12:30:17','Lucy','Roary','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (84,'Frank','1.88','2021-11-12 19:51:51','Rhonda','Vanna','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (85,'Bond','4.13','2025-08-31 08:02:46','Anjolie','Ria','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (86,'Dyer','4.93','2025-10-11 22:21:53','Brendan','Grace','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (87,'Ware','0.15','2026-05-12 08:33:24','Joel','Ila','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (88,'Summers','5.30','2024-12-16 14:26:50','Branden','Timothy','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (89,'Ortiz','0.11','2023-09-19 03:26:30','Grady','Kane','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (90,'Gonzalez','6.17','2026-08-21 01:47:59','Derek','Warren','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (91,'Bailey','7.92','2028-10-11 21:40:18','Macey','Stuart','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (92,'Carney','8.35','2035-01-04 15:05:43','Jin','Aileen','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (93,'Workman','0.01','2035-03-29 12:57:19','Josephine','Kerry','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (94,'Ochoa','9.09','2030-06-19 02:00:47','Ali','Hillary','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (95,'Harrison','1.72','2034-04-09 07:31:29','Hoyt','Hall','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (96,'Potts','4.12','2022-05-30 08:30:18','Karina','Macaulay','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (97,'Hayes','4.01','2028-07-04 01:09:40','Eleanor','Rigel','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (98,'Osborne','2.40','2032-12-14 00:50:30','Lucy','Thor','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (99,'Randolph','4.12','2022-10-12 01:52:32','Samuel','Ina','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (100,'Reynolds','0.21','2030-07-23 09:12:37','James','Myra','No');

INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (101,'Hampton','9.30','2030-09-30 05:06:41','Sybill','Moses','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (102,'Sellers','4.19','2021-04-28 03:07:54','Dana','Eric','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (103,'Dillon','0.03','2021-10-17 02:02:39','Alexis','Ira','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (104,'Parks','8.26','2030-05-14 20:04:16','Chelsea','Kenneth','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (105,'Hernandez','6.21','2046-10-16 23:14:08','Beverly','Mason','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (106,'Hood','9.41','2023-10-10 03:52:09','Kyra','Timothy','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (107,'Hubbard','6.85','2045-01-10 12:30:24','Kim','Gil','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (108,'Witt','0.55','2035-05-03 03:40:41','Serina','Hammett','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (109,'Hurley','2.51','2037-09-20 10:48:18','Amanda','Deacon','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (110,'Young','9.82','2025-06-13 08:47:44','Jescie','Randall','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (111,'Mcdonald','5.59','2035-05-27 22:04:53','Melinda','Jared','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (112,'Noble','1.75','2031-03-17 17:53:24','Chelsea','Sylvester','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (113,'Mcfadden','9.54','2033-01-07 03:49:26','Amy','Ezekiel','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (114,'Suarez','8.68','2044-09-23 20:23:53','Mariko','Len','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (115,'Moss','7.99','2040-04-18 22:19:12','Sloane','Bruce','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (116,'Scott','9.42','2034-12-09 21:18:08','Idona','James','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (117,'Love','6.58','2031-07-12 04:33:14','Ursa','Benjamin','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (118,'Walton','1.78','2025-09-27 20:26:40','Xerxes','Hoyt','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (119,'Delaney','2.46','2026-06-07 04:46:16','Nyssa','Colton','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (120,'Thomas','9.12','2028-12-07 11:45:33','Desiree','Alec','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (121,'Sheppard','5.42','2033-11-10 04:36:06','Kerry','Tucker','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (122,'Cross','3.41','2021-09-25 15:05:33','Nerea','Damian','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (123,'Mueller','2.21','2034-01-01 22:35:37','Bianca','Kamal','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (124,'Kline','8.79','2032-12-17 05:01:04','Nina','Talon','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (125,'House','2.06','2028-07-08 05:43:36','Shellie','Tad','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (126,'Decker','0.25','2045-12-23 11:47:59','Denise','Wang','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (127,'Atkins','4.12','2047-04-19 12:09:59','Eleanor','Seth','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (128,'Reed','5.01','2042-01-27 08:28:24','Velma','Orlando','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (129,'Coffey','9.92','2028-08-25 16:21:30','Amanda','Quinn','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (130,'Baldwin','4.87','2043-11-30 03:50:46','Lesley','Plato','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (131,'Mays','2.96','2024-03-18 03:15:34','Noel','Jesse','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (132,'William','1.62','2044-01-12 01:45:57','Fleur','Beau','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (133,'Valenzuela','0.90','2027-08-12 02:28:36','Selma','Ferris','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (134,'Mclean','6.10','2045-01-04 03:11:56','Aline','Cyrus','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (135,'Oconnor','1.62','2024-06-23 11:48:35','Martha','Nehru','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (136,'Puckett','5.10','2046-04-10 04:29:37','Shannon','Chadwick','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (137,'Booker','2.53','2027-07-09 04:33:29','Orli','Axel','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (138,'Delgado','4.00','2032-02-18 14:06:05','Fay','Norman','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (139,'Dickerson','0.68','2040-01-20 01:19:01','Echo','Rahim','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (140,'Romero','9.63','2028-11-29 09:11:08','Colette','Zahir','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (141,'Rutledge','9.36','2047-06-10 12:07:31','Nevada','Chaim','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (142,'Cole','4.18','2044-02-11 21:20:30','Hayley','Cyrus','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (143,'Parks','5.60','2037-01-11 11:54:19','Autumn','Uriel','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (144,'Franco','8.47','2026-11-14 01:42:04','Shoshana','Oscar','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (145,'Nicholson','7.18','2041-06-14 09:57:43','Calista','Davis','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (146,'Hendrix','4.02','2042-10-08 10:12:04','Candice','Kuame','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (147,'Mcmahon','3.14','2027-12-28 01:33:26','Destiny','Macon','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (148,'Moore','4.82','2048-12-27 18:21:26','Alfreda','Joseph','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (149,'Camacho','7.97','2023-01-25 00:12:56','Cherokee','Ali','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (150,'Rodgers','3.82','2029-09-05 14:17:09','Adrienne','Amal','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (151,'Rivers','3.23','2028-08-02 01:13:59','Erin','Addison','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (152,'Austin','9.18','2041-11-11 12:25:13','Uma','Richard','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (153,'Stein','5.22','2029-08-22 21:50:54','Aubrey','John','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (154,'Atkinson','6.47','2030-02-23 23:03:23','Audra','Driscoll','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (155,'Barry','6.50','2047-02-14 03:03:39','Denise','Lucas','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (156,'David','2.18','2043-02-24 09:25:48','Mechelle','Arthur','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (157,'Hardy','3.46','2027-05-13 19:43:37','Jessica','Adrian','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (158,'Reynolds','0.64','2040-08-04 12:12:28','Phoebe','Coby','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (159,'Lindsay','2.06','2036-02-06 20:20:28','Gail','Jameson','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (160,'Blevins','9.77','2046-12-07 00:17:37','Tara','Xavier','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (161,'Schwartz','7.54','2042-10-03 07:26:01','Carla','Flynn','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (162,'Valencia','7.50','2034-06-20 22:55:09','Naomi','Ivan','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (163,'Lynn','8.08','2031-10-12 17:46:48','Charlotte','Derek','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (164,'Williamson','0.80','2047-01-02 00:30:19','Daria','Noble','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (165,'Griffin','3.44','2025-12-26 04:00:41','Sonya','Leroy','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (166,'Langley','5.76','2023-09-05 10:30:29','Leigh','Kevin','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (167,'Jennings','0.24','2046-09-04 10:26:20','Cally','Len','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (168,'Perez','8.84','2040-11-24 09:00:25','Odette','Uriel','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (169,'Peters','3.11','2035-09-09 10:29:56','Camille','Dexter','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (170,'Francis','2.35','2029-01-09 22:50:51','Kirestin','Basil','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (171,'Roman','6.42','2042-02-06 16:45:22','Adria','Allistair','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (172,'Moon','2.13','2044-06-04 10:19:59','Phyllis','Emerson','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (173,'Dale','4.86','2022-07-19 00:00:05','Teagan','Peter','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (174,'Jacobs','9.96','2035-02-03 16:44:52','Eugenia','Felix','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (175,'Carroll','1.03','2030-10-30 14:03:15','Eugenia','Jordan','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (176,'Pittman','4.14','2041-05-12 22:41:16','Hope','Gage','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (177,'Moss','9.55','2030-02-20 13:15:40','Wynter','Yoshio','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (178,'Ware','0.84','2022-03-28 18:49:26','Kelsie','Caldwell','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (179,'Manning','0.95','2030-07-07 09:18:18','Adara','Joseph','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (180,'Beach','9.06','2026-04-27 03:29:58','Meredith','Damian','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (181,'Combs','9.71','2026-12-05 18:34:17','Maia','Amal','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (182,'Vega','2.99','2043-06-14 20:06:50','Dorothy','Alan','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (183,'Haynes','4.19','2025-04-15 20:15:55','Vera','Murphy','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (184,'Sears','2.71','2044-05-31 22:58:10','Guinevere','Dillon','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (185,'Boone','3.18','2045-05-10 11:21:50','Yen','Hayes','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (186,'Meadows','3.43','2025-06-05 21:24:24','Donna','Aquila','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (187,'Lee','7.67','2043-08-16 21:20:58','Justine','Castor','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (188,'Pierce','1.77','2041-07-07 16:01:51','Whoopi','Lawrence','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (189,'Woodward','2.66','2029-02-08 03:50:18','Savannah','Charles','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (190,'Avila','8.61','2044-09-07 11:23:34','Anne','Nathaniel','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (191,'Reed','6.02','2029-03-04 19:46:11','Dai','Quentin','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (192,'Russo','3.31','2022-11-28 06:59:58','Xandra','August','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (193,'Wade','3.72','2044-08-18 19:47:59','Kylan','Kane','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (194,'Fitzpatrick','3.13','2044-02-14 15:59:45','Quon','Luke','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (195,'Ware','0.92','2041-10-26 22:45:35','Christine','Seth','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (196,'Jarvis','3.04','2040-08-25 15:44:18','Naida','Honorato','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (197,'Parrish','2.74','2023-07-17 06:14:39','Kay','Todd','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (198,'Stewart','8.41','2039-09-06 11:38:45','Buffy','Oren','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (199,'Shannon','2.17','2038-10-26 00:14:39','Scarlett','Wade','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (200,'Lucas','1.48','2027-12-25 06:34:30','Quynn','Lewis','Yes');

INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (201,'Woods','5.50','2023-02-19 01:02:16','Jerome','Cecilia','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (202,'Burton','7.22','2032-05-27 17:37:49','Ryder','Clementine','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (203,'Pruitt','6.73','2025-02-06 18:01:09','Abel','Hope','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (204,'Robles','5.18','2047-10-30 14:15:20','Porter','Buffy','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (205,'Rojas','2.65','2043-08-16 13:46:02','Jesse','Evelyn','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (206,'Becker','3.01','2036-04-14 05:20:24','Finn','Whilemina','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (207,'Jennings','7.33','2035-11-06 07:54:46','Vladimir','Maile','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (208,'Dalton','8.10','2038-09-02 19:23:13','Ezekiel','Alana','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (209,'Potter','5.87','2022-04-18 14:05:36','Rogan','Kitra','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (210,'Harvey','7.94','2036-02-08 05:01:01','Baxter','Shana','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (211,'Welch','6.19','2043-01-31 05:53:24','Grant','Sacha','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (212,'Potter','4.11','2043-09-07 17:10:36','Phelan','Lillian','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (213,'Green','3.62','2025-10-18 22:36:20','Carl','Heidi','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (214,'Roman','7.83','2049-09-09 20:03:27','Keegan','Fallon','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (215,'Witt','3.23','2026-04-06 20:35:45','Erich','Amanda','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (216,'Mueller','3.24','2040-08-21 01:42:50','Orson','April','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (217,'Mcgowan','5.06','2023-01-05 13:30:25','Wesley','Vanna','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (218,'Walters','1.62','2042-05-15 20:53:58','Macon','Dakota','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (219,'Navarro','6.64','2033-08-06 12:12:29','Basil','Sasha','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (220,'Pratt','1.88','2045-11-13 19:03:34','Jonah','Lacey','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (221,'Barrett','9.63','2038-07-27 11:43:29','Lev','Macy','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (222,'Robles','3.51','2022-10-28 14:50:30','Logan','Heather','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (223,'Swanson','8.03','2048-04-13 14:48:55','Perry','Debra','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (224,'Solomon','2.79','2044-04-17 06:29:00','Thane','Kay','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (225,'Kirk','4.33','2040-08-16 12:26:30','Avram','Alika','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (226,'Molina','9.18','2030-04-25 14:14:47','Orlando','Meghan','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (227,'Simon','0.90','2027-07-01 09:24:32','Hayes','Madeson','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (228,'Noel','9.49','2023-10-07 20:27:10','Barry','Alyssa','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (229,'Carson','7.47','2033-02-10 05:25:06','Jermaine','Jael','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (230,'Lester','7.36','2035-05-27 23:24:48','Asher','Kalia','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (231,'Underwood','9.98','2032-10-05 22:47:13','Flynn','Cheryl','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (232,'Gordon','0.58','2023-03-22 15:43:26','Walker','Kyla','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (233,'Bartlett','5.38','2025-12-05 05:10:48','Byron','Lydia','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (234,'Ross','7.93','2048-08-28 22:35:11','Wang','Constance','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (235,'Whitfield','3.19','2037-06-04 08:53:26','Cain','Ingrid','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (236,'Cohen','2.09','2032-07-25 09:33:47','Felix','Stephanie','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (237,'Nichols','8.64','2030-10-29 02:40:22','Demetrius','Idona','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (238,'Keith','2.59','2045-09-11 01:33:16','Hilel','Victoria','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (239,'Reilly','0.11','2029-04-23 20:06:41','Nasim','Keiko','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (240,'Daniels','2.71','2021-05-25 00:25:04','Lucius','Vielka','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (241,'England','8.65','2025-05-24 15:02:29','Blaze','Audra','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (242,'Marks','8.78','2035-07-25 19:05:52','Cain','Alexis','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (243,'Burnett','3.23','2043-07-11 21:50:06','Colby','Ciara','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (244,'Torres','2.30','2026-04-10 16:10:24','Ali','Karen','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (245,'Blackburn','5.44','2048-03-02 15:17:02','Hyatt','Dacey','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (246,'Riley','7.66','2020-09-08 15:32:13','Lyle','Quon','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (247,'Stevenson','3.13','2042-04-09 06:17:06','Daniel','Noelle','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (248,'Sheppard','2.60','2036-03-19 19:26:58','Honorato','Olympia','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (249,'Noel','6.81','2047-12-08 14:06:20','Gray','Chloe','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (250,'Rivera','5.53','2037-06-11 04:53:33','Amery','Vera','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (251,'Jefferson','3.73','2040-12-30 03:32:34','Fritz','Nora','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (252,'Saunders','8.42','2021-04-21 15:57:05','Nehru','Alika','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (253,'Washington','6.46','2024-08-24 16:13:03','John','Beatrice','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (254,'Gibbs','7.12','2048-04-13 11:34:37','Rooney','Gisela','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (255,'Lang','8.41','2040-09-30 10:37:52','Quentin','Gail','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (256,'Harper','0.15','2029-11-14 13:41:57','Troy','Eugenia','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (257,'Cannon','7.42','2024-01-07 08:27:27','Slade','Kirsten','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (258,'Dale','5.72','2048-05-06 03:15:20','Malik','Sonia','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (259,'Ferrell','6.24','2037-12-18 07:05:42','Cody','Cameran','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (260,'Carpenter','1.36','2040-03-17 22:25:46','Matthew','Jessica','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (261,'Gardner','0.53','2043-03-30 03:59:18','Daniel','Jade','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (262,'Small','5.54','2038-06-17 06:56:24','Alden','Irma','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (263,'Mcneil','6.12','2033-04-11 20:14:35','Grady','Marcia','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (264,'Bray','7.61','2021-04-11 23:48:50','Forrest','Alma','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (265,'Little','4.62','2023-05-19 23:22:41','Igor','Rylee','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (266,'Miranda','1.72','2044-05-13 01:18:36','Acton','Risa','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (267,'Dillon','4.65','2043-08-06 18:27:21','Hayden','Liberty','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (268,'Conrad','6.39','2039-08-28 19:21:25','Rooney','Kiayada','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (269,'Hampton','0.14','2023-12-22 08:42:04','Duncan','Cora','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (270,'Williams','8.62','2033-11-28 08:42:58','Galvin','Pearl','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (271,'Rodriguez','1.97','2025-12-04 21:26:33','Zeus','Eleanor','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (272,'Cochran','3.73','2037-11-03 23:15:34','Kibo','Lynn','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (273,'Velazquez','0.73','2046-09-20 18:34:34','Keith','Wyoming','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (274,'Trujillo','9.89','2036-01-25 11:10:35','Aidan','Maxine','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (275,'Lynn','2.99','2029-12-27 15:01:34','Cole','Halee','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (276,'Valencia','2.18','2026-11-30 22:51:39','Hyatt','Zoe','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (277,'Fischer','1.71','2036-05-24 06:22:27','Byron','Ulla','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (278,'Owen','7.92','2032-07-04 20:15:50','Lev','Cassidy','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (279,'Valentine','7.76','2021-06-04 10:23:19','Neil','Halee','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (280,'Mccarthy','3.33','2032-11-01 12:53:11','Drew','Danielle','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (281,'Colon','7.95','2028-06-29 23:21:06','Lee','Heidi','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (282,'Weber','8.14','2033-04-14 09:20:44','Alvin','Lunea','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (283,'Pate','1.43','2030-09-11 07:00:55','Robert','Yuri','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (284,'Zamora','5.96','2048-03-03 00:13:16','Lane','Lana','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (285,'Barron','3.82','2040-01-05 14:37:34','Alan','Freya','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (286,'Browning','1.09','2023-05-21 13:21:34','Christian','Tara','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (287,'Love','9.02','2025-06-07 16:48:15','Wade','Brynne','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (288,'Maynard','1.35','2024-07-28 09:02:37','Jameson','Shoshana','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (289,'Ortega','0.49','2044-12-22 07:14:56','Joel','Stacey','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (290,'Owens','5.62','2036-07-05 16:06:29','Merrill','Linda','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (291,'Booth','9.71','2035-07-06 02:18:40','Henry','Libby','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (292,'Howe','6.26','2023-09-22 21:25:57','Hector','Yoshi','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (293,'Ramirez','8.03','2044-11-18 03:39:40','Lucian','Colleen','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (294,'Vance','8.89','2047-01-08 23:09:32','Ashton','Alea','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (295,'Le','7.72','2026-11-18 18:01:37','Abel','Sopoline','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (296,'Knapp','2.10','2048-12-07 10:29:53','Grady','Yetta','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (297,'Howard','0.48','2034-07-12 21:17:11','Tyler','Violet','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (298,'Norton','3.84','2022-10-15 17:21:18','Samuel','Dara','Yes');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (299,'Wolfe','0.66','2026-12-07 15:56:09','Alexander','Nadine','No');
INSERT INTO auction_product (`p_id`,`p_name`,`price_min`,`closing_time`,`seller`,`buyer`,`status`) VALUES (300,'Fowler','5.27','2033-11-30 15:42:15','Seth','Kameko','No');


insert into admin (a_email, a_password) values ('jsawnwy0@tuttocitta.it', 'gPKc9Tz');
insert into admin (a_email, a_password) values ('pklais1@vistaprint.com', 'xCdpnDycKcy');
insert into admin (a_email, a_password) values ('fpaulitschke2@opensource.org', 'N0naYnbkp');
insert into admin (a_email, a_password) values ('bswidenbank3@ehow.com', 'J64ZiV');
insert into admin (a_email, a_password) values ('awight4@nsw.gov.au', 'hq44Lz8y2khN');


