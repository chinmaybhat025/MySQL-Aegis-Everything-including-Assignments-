# Q.4) creating the database wih name Travel
create database Travel; 
use Travel; 

# creating table of Salesman

create table salesman
(
 emp_no int primary key auto_increment,
 emp_name char(30),
 start_year year not null,
 deptno varchar(10)
 );

#desc salesman; # cross checking whether tables have been created with required attributes as given in the Assignment.

# creating the table Trip
create table trip
(
 trip_no int primary key auto_increment,
 from_city char(20) default 'MUMBAI',
 to_city char(20),
 departure_date date,
 return_date date
 );
 
 #desc trip; # cross checking whether tables have been created with required attributes as given in the Assignment.
 
 
 # creating the table department
 create table department
 (
 deptno varchar(10),
 dept_name char(20) unique key not null,
 primary key(deptno)
 );
 
 #desc department; # cross checking whether tables have been created with required attributes as given in the Assignment.
 
 
 # creating the table of expense
 create table expense
 (
  eid int primary key,
  amount decimal(6,2)
  );
  
 #desc expense;  # cross checking whether tables have been created with required attributes as given in the Assignment.
  
 show tables; # cross checking whether all the tables are created as specified in the Assignment.
 
 # Q.5) creating the schema with name warehouse
 
 create schema warehouse;
 use warehouse;
 
 # creating the table name cities
 create table cities
 (
 city char(20) primary key,
 state char(20)
 );
 
 #desc cities; # cross checking whether tables have been created with required attributes as given in the Assignment.
 
 # creating the table of warehouses
 
 create table warehouses
 (
 wid int unique key auto_increment,
 wname char(30),
 location char(20),
 primary key(wid)
 );
 
 #desc warehouses; # cross checking whether tables have been created with required attributes as given in the Assignment.
 
 # creating the table of stores
 create table stores
 (
 sid int primary key,
 store_name char(20),
 location_city char(20)
 );
 
 #desc stores;  # cross checking whether tables have been created with required attributes as given in the Assignment.
 
 # creating the table of items
 
 create table items
 (
 itemno int primary key auto_increment,
 description text,
 weight decimal(5,2),
 cost decimal(5,2)
 );
 
 # desc items; # cross checking whether tables have been created with required attributes as given in the Assignment.
 
 # creating the table of customer
 
 create table customer
 (
 cno int,
 cname char(50),
 addr varchar(50),
 cu_city char(20),
 primary key(cno)
 );
 
 #desc customer; # cross checking whether tables have been created with required attributes as given in the Assignment.
 
 #show tables; # 5 tables with required names and attributes are created as given in the assignment.
 
 
 # Q.6)a) Rename table from items to item
 
 rename table items to item; # Now the table which is previously referred as 'items' is now referred as 'item'.
 
 #desc items; # Table warehouse.items does not exist after executing the above query of rename.
 
 #desc item; # Query executed successfully and shown the structure of the table 'item'.
 
 # Q.6)b)Add customer ph_no attribute between addr and cu_city
 
 alter table customer add ph_no int
 after addr;
 
 # select * from customer; # Cross check whether the column ph_no has been created between addr and cu_city.
 
 
 # Q.6)c)From Stores table, change the width of store_name from 20 to 30.
 
  alter table stores modify store_name char(30);
 
 #desc stores; # Cross checking whether the needful has been done or not.

# Q.6)d) Drop table Expense.

# Note:- As expense table has been created in the travel database, we have to first move access from warehouse schema to travel database.

#use travel;

#select * from expense; # cross checking whether i am able to see the columns of expense table.

#select * from cities; # cross checking whether access has been shifted from warehouse schema to travel database.

Drop table expense;

#select * from expense; # message shown table travel.expense does not exist, so expense table has been successfully dropped.


# Q.6)e) Change datatype of cu_city from char to varchar in customer table.   

# Note:- As customer table has been created in the warehouse schema, we have to first move access from travel database to warehouse schema again.

#use warehouse; # Access moved from travel database to warehouse schema.

#desc customer; # cross checking whether able to access the structure of customer table or not.


#alter table customer modify cu_city varchar(20); # needful has been done.

#desc customer; # cross checking whether above modification has been done or not.
 
 
 

 
 
 
 
 
 
 
 

