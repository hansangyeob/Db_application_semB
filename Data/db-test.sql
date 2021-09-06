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




