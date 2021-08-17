#branch tabl
create table branch(
    b_code int(8) auto_increment,
    b_name varchar(30),
    adress varchar(100),
    hotline_num varchar(10),
    primary key (b_code),
    unique (b_code, b_name)
);

#customer account table
create table customer_account(
    i_num int(20) not null,
    f_name varchar(200) not null,
    l_name varchar(200) not null,
    email varchar(50) not null,
    phone varchar(10) not null,
    password char(48) not null,
    address varchar(100),
    city varchar(100),
    country varchar(100),
    profile_pic blob,
    balance decimal(15,2) not null,
    primary key (i_num),
    Unique (email,phone,i_num)
);

#auction product table
create table auction_product(
    p_id int(8) AUTO_INCREMENT,
    p_name varchar(20) not null ,
    price_min decimal not null,
    closing_time datetime,
    primary key (p_id)
);

INSERT INTO `branch`(`b_code`, `b_name`, `adress`, `hotline_num`) VALUES (null,'HCMC','PHU THUAN,Q.7,HCMC','0127819228');
INSERT INTO `branch`(`b_code`, `b_name`, `adress`, `hotline_num`) VALUES (null,'Seoul','113, Tongil-ro, Seodaemun-gu, Seoul, Republic of Korea','0139819441');
