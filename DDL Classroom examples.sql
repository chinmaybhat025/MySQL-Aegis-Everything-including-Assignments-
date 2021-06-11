#creating the database, using it and Dropping it by using SQL commands.
create database ABC;
use ABC;
Drop database ABC;
## desc ABC;


#creating the schema, using it and Dropping it by using SQL commands.
create schema XYZ;
use XYZ;
Drop schema XYZ;


create database df1909cm;
use df1909cm;

create database movies;
use movies;

# create table of film
create table film
(film_id int primary key,
title varchar(100),
release_year year,
language_id int,
length int,
rating char(5)
);

create table actor
(
actor_id int primary key auto_increment,
first_name varchar(50) not null,
last_name varchar(50)
);

desc actor;

create table language
(
language_id int primary key auto_increment,
name varchar(20)
);

desc language;

create table film_category
(
category_id int primary key,
film_id int,
foreign key(film_id)
references film(film_id)
);

desc film_category;

# Temporary tables will be vanished till the session exist, if you close the session then these temporary tables will be vanished.
create temporary table employee
(
emp_id int unique key,
name varchar(15),
age int,
location varchar(20),
DOB date
);

desc employee;

create table country
(
country_id int,
country varchar(20) default 'INDIA'
);

desc country;


create table staff
(
staff_id int,
name varchar(30),
city enum('Mumbai','Bengaluru','Chennai'),
weight decimal(3,2),
married boolean,
hiredate datetime,
salary decimal(6,2)
);

desc staff;

show tables;  ## to check how many tables are created in a database.

alter table film add constraint 
fk_language_id foreign key(language_id)
references language(language_id);

desc film;

alter table film modify title varchar(100) not null;

alter table actor add city varchar(20);

desc actor;

alter table country add city varchar(20)
after country_id;

desc country;

alter table country drop city;

show columns from country;

show databases;

alter table country rename countries;

rename table film to films;

desc films;

truncate table films;

drop table film_category;

create table customer
(
id int not null auto_increment,
first_name varchar(50) not null,
last_name varchar(50) not null,
primary key(id)
);

desc customer;

create table contact
(
contact_id int,
customer_id int,
info varchar(50) not null,
foreign key(customer_id)
references customer(id)
on delete cascade
on update cascade
);

# On delete cascade and On Update cascade is used when changes on the table on which it is returned has to be happened on other mentioned table which foreign key has been given.


desc contact;




