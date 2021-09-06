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
drop database test;
create database test;
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
	profile_pic BLOB,
	balance DECIMAL(8,2)  not null,
    primary key (i_num),
    unique (email, phone, i_num)
#     ,foreign key (city) references branch(b_name)
);

CREATE TABLE auction_product (
  `p_id` mediumint(8) unsigned NOT NULL auto_increment,
  `p_name` varchar(255) NOT NULL,
  `price_min` varchar(100) NOT NULL,
  `closing_time` varchar(255),
  `seller` int,
  `buyer` varchar(255),
  picture BLOB,
  `status` boolean,
  PRIMARY KEY (`p_id`)
#   ,foreign key (seller) references customer_account(i_num)
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
#     ,foreign key (buyer) references auction_product(buyer)
);

create table bids(
    b_id int(8) auto_increment,
    bidder varchar(255),
    p_id mediumint(8),
    offer_price varchar(100),
    offer_time datetime,
    primary key (b_id)
#     ,foreign key (bidder) references auction_product(buyer),
#     foreign key (b_id) references auction_product(p_id)
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