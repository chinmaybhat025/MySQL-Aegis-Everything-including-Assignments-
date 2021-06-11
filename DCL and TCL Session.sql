-- Session 22nd Jan 2020---
-- DDL commands are used in the 'System privileges'.
-- Object privileges includes DML commands and EXECUTE command.
-- Roles can have named collection of privileges.

-- TRANSACTION CONTROL LANGUAGE---
-- Localhost is our machine.

create user super@localhost identified by 'aegis';
# super-name of the user
# aegis-password


show grants for super@localhost;

## creating another user
create user Robin@localhost identified by 'muniversity';

## Sakila is the name of database
## name of the user:-Robin
grant all on sakila.* to Robin@localhost;

## creating another user
create user Abhinav@localhost identified by 'football';

## name of the table.
grant all on sakila.actor to Abhinav@localhost;

## creating the user which is not created on localhost
create user abc identified by 'muni';

grant select,update,delete on sakila.* to abc;

show grants for abc;

## Revoke the grant
revoke update,delete on sakila.* from abc;


show grants for abc;

## revoke all privileges...
revoke all privileges,grant option from abc;


## Roles
Create database crm;
use crm;

create table customer
(
id int primary key auto_increment,
first_name varchar(255) NOT NULL,
last_name varchar(255) NOT NULL,
phone varchar(15) NOT NULL,
email varchar(255)
);

insert
into 
customer(first_name,last_name,phone,email)
values('John','Doe','(408)-987-7654','john.doe@mysqltutorial.org'),
('Lily','Bush','(408)-987-7985','lily.bush@mysqltutorial.org');

select * from customer;

## Create Role
create role crm_dev,crm_read,crm_write;

grant all on crm.* to crm_dev;

grant select on crm.* to crm_read;

grant insert,update,delete on crm.* to crm_write;

## assigning roles to user accounts
## developer user
create user crm_dev@localhost identified by 'Secure$1672';

## read access user
create user crm_read1@localhost identified by 'Secure$1880';

## write access user
create user crm_write1@localhost identified by 'Secure$1662';

## write access user
create user crm_write2@localhost identified by 'Secure$1342';

grant crm_dev to crm_dev@localhost;-- Error

grant crm_read to crm_read1@localhost;

grant crm_read,crm_write to crm_write1@localhost,crm_write2@localhost;-- Error


show grants for crm_Write1@localhost using crm_write;

drop role crm_read;

set autocommit=0;


## new table created.
create table class
(
id int,
name varchar(30)
);

insert 
into
class
values(1,'Ramesh'),(2,'Suresh'),(3,'Ramya'),(4,'Rakesh'),(5,'Rahul');

commit;

##set sql_safe_updates=0;
UPDATE class SET name='Abhijit' where id=5;

START TRANSACTION;

savepoint A;

insert into class values(6,'Chris');

savepoint B;

insert into class values(7,'Bravo');

savepoint C;

select * from class;

rollback to B;

select * from class;

rollback to A;

select * from class;

Delete from class where id=5;
rollback to A;

select * from class;

Truncate table class;
rollback to A;
## Truncate command does not retrive any data.

## Views
## Virtual Relation is also called as 'Views'.

create table StudentDetails
(
S_ID int,
name varchar(20),
address varchar(20)
);

insert 
into
StudentDetails
values(1,'Harsh','Kolkata'),(2,'Ashish','Durgapur'),(3,'Pratik','Delhi'),(4,'Dhanraj','Bihar'),(5,'Ram','Rajasthan');

create table StudentMarks
(
id int,
Name varchar(20),
marks int,
age int
);

insert 
into 
StudentMarks
values(1,'Harsh',90,19),(2,'Suresh',50,20),(3,'Pratik',80,19),(4,'Dhanraj',95,21),(5,'Ram',85,18);

select * from StudentMarks;
select * from StudentDetails;

## Index cannot be performed in Views in case of Mysql.

create view DetailsView as
select name,address
from StudentDetails
where S_ID<5;

select * from DetailsView;

create view StudentNames
as
select S_ID,name
from StudentDetails order by NAME;

select * from StudentNames;

##
create view MarksView
as
select StudentDetails.Name,
StudentDetails.address,
StudentMarks.MARKS
from StudentDetails,StudentMarks
where StudentDetails.Name=StudentMarks.name;

select * from MarksView;

INSERT into DetailsView('NAME','ADDRESS') values("Suresh","Gurgaon");
## After executing above statement, the rows is inserted in the base table but not in view as view has been created with condition<5.
select * from DetailsView;

select * from StudentDetails;

Delete from DetailsView
where name="Suresh";

select * from DetailsView;

select * from StudentDetails;







