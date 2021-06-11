create database online;
use online;

create table Customer
(
 cust_id int primary key Auto_increment not null,
 cust_name varchar(20),
 cust_DOB DATE
); 

desc customer;

create table cart
(
cart_item_id int unique key,
No_of_prod varchar(30)
);

desc customer;

create table category
(
category_type varchar(20) Default 'Electronics',
cat_colour varchar(30)
);

create table segment
(
seg_code int,
seg_type enum("M","W","C")
);

desc segment;

create table payment
(
payment_id int primary key,
payment_amount decimal(5,3)
);

desc payment;

create table cart_item
(
cart_item_id int primary key,
no_of_prod int
);

desc cart_item;

rename table customer to customer2;

select * from customer2;

show tables;

create table products
(
p_id int primary key,
p_name varchar(20)
);

create table brand
(
Brand_name varchar(20),
Brand_id int primary key auto_increment
);

desc brand;

alter table brand add brand_exp_date int after brand_name;


