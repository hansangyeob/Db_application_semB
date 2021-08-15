#branch table
create table branch(
    Bcode int(8),
    Bname varchar(30),
    Adress varchar(30),
    Hotline_num varchar(10),
    primary key (Bcode),
    unique (Bcode, Bname)
);

#customer account table
create table customer_account(
    Email varchar(50) not null,
    Phone varchar(10) not null,
    Password char(48) not null,
    Fname varchar(200) not null,
    Lname varchar(200),
    Inum int(20) not null,
    Address varchar(30),
    City varchar(100),
    Country varchar(100),
    Profile_pic blob,
    Balance decimal(15,2) not null,
    primary key (Inum),
    Unique (Email,Phone,Inum)
);

#auction product table
create table auction_product(
    name varchar(20) not null ,
    price_min decimal not null,
    closing_time datetime,
    primary key (name)
);