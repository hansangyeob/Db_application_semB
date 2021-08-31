-- branch table
create table branch(
    b_code int(8) auto_increment,
    b_name varchar(30),
    adress varchar(100),
    hotline_num varchar(10),
    primary key (b_code),
    unique (b_code, b_name)
);

-- customer account table
create table customer_account(
    i_num int(20) not null,
    f_name varchar(200) not null,
    l_name varchar(200) not null,
    email varchar(50) not null,
    phone varchar(10) not null,
    password char(48) not null,
    address varchar(255),
    city varchar(100),
    country varchar(100),
    profile_pic blob,
    balance int not null,
    primary key (i_num),
    Unique (email,phone,i_num)
);

-- auction product table
create table auction_product(
    p_id int(8) AUTO_INCREMENT,
    p_name varchar(20) not null ,
    price_min decimal not null,
    closing_time datetime,
    seller varchar(255),
    buyer varchar(255),
    status varchar(255),
    primary key (p_id)
);

create table admin(
    a_email varchar(255),
    a_password varcahr(255)
);  

INSERT INTO `branch`(`b_code`, `b_name`, `adress`, `hotline_num`) VALUES (null,'HCMC','PHU THUAN,Q.7,HCMC','0127819228');
INSERT INTO `branch`(`b_code`, `b_name`, `adress`, `hotline_num`) VALUES (null,'Seoul','113, Tongil-ro, Seodaemun-gu, Seoul, Republic of Korea','0139819441');

INSERT INTO `customer_account`(`i_num`, `f_name`, `l_name`, `email`, `phone`, `password`, `address`, `city`, `country`, `profile_pic`, `balance`) VALUES (1111,'l_user1','f_user1','email1@gmail.com','0398276001','1234','sample address 1','HCMC','Vietnam',null,'100');
INSERT INTO `customer_account`(`i_num`, `f_name`, `l_name`, `email`, `phone`, `password`, `address`, `city`, `country`, `profile_pic`, `balance`) VALUES (1112,'l_user2','f_user2','email2@gmail.com','0398276002','4321','sample address 2','Seoul','Korea',null,'200');

-- INSERT INTO `auction_product`(`p_id`, `p_name`, `price_min`, `closing_time`,`seller`,`buyer`,`status`) VALUES (null,'iPhone11',50,now());
-- INSERT INTO `auction_product`(`p_id`, `p_name`, `price_min`, `closing_time`,`seller`,`buyer`,`status`) VALUES (null,'iPhone13',100,now());

INSERT INTO `admin`(`a_email`,`a_password`) VALUES ('admin@admin.com','1234');

