use joins_and_subqueries;

select * from products1;

create temporary table prods1 as select * from products1;

select * from prods1;

update prods1 set price=price*1.25 where price>(select avg(price) from products1);
set sql_safe_updates=0;

select * from prods1;

select * from products1;


##
delete from prods1 where prodid in
(select prodid from products1 where not exists
(select 1 from orderdetails where
prods1.prodid=orderdetails.prodid));

select * from prods1;

select * from products1;


select * from orderdetails;


create table employee
(
id int primary key,
first_name varchar(15),
last_name varchar(15),
start_date DATE,
end_date DATE,
salary float(8,2),
city varchar(10),
description varchar(15),
dept_id int
);

select * from employee;
insert 
into 
employee(id,first_name,last_name,start_date,end_date,salary,City,Description,dept_id)
values(1,'Jason','Martin','19960725','20060725',1234.56,'Toronto','Programmer',222),
(2,'Alison','Mathews','19760321','19860221',6661.78,'Vancouver','Tester',999),
(3,'James','Smith','19781212','19900315',6544.78,'Vancouver','Tester',999),
(4,'Celia','Rice','19821024','19990421',2344.78,'Vancouver','Manager',456),
(5,'Robert','Black','19840115','19980808',2334.78,'Vancouver','Tester',999),
(6,'Linda','Green','19870730','19960104',4322.78,'New York','Tester',999),
(7,'David','Larry','19901231','19980212',7897.78,'New York','Manager',456),
(8,'James','Cat','19960917','20020415',1232.78,'Vancouver','Tester',999),
(9,'Oliver','Mathew','19780104','19920408',1232.78,'Vancouver','Tester',999);

select * from employee;

##
select first_name,salary from employee where salary=(select min(salary) from employee);

## 
select dept_id,Max(salary)
from employee
group by dept_id
having Max(salary) <(select avg(salary) from employee);


##
SELECT *
FROM Employee 
WHERE Salary 
NOT IN 
(SELECT Max(Salary) FROM Employee);

##
Select id,first_name from employee
where salary=(select max(salary) from employee
where salary<(select max(salary) from employee));




select id,first_name from employee where salary<(select max(salary) from employee) limit 1 offset 1;
## offset number skips the number of rows to be skipped.






#########UNION###########

## The join such as INNER JOIN or LEFT JOIN combines columns from two tables while the UNION combines rows from two queries. In other words, join appends the result sets horizontally while union appends result set vertically.

Create table store_information(
Name varchar(15),
txn_date varchar(30),
sales int);

insert into store_information values
('los angeles','jan 20 1990',1500),('san diego','jan 07 1992',200),
('los angeles','jan 28 1990',1500),('boston','jan 18  1999',500);

create table internet_sales(
txn_date varchar(30),
sales int);

insert into internet_sales values('jan 07 1992',200),
('jan 20  1992',200),('jan 28 1990',200),('jan 18 1999',500);
##
select txn_date from store_information UNION select txn_date from internet_sales;

##
select txn_date from store_information
union all
select txn_date from internet_sales;

use sakila;


## Union All-> without removing duplicates
##########Limit and Offset######
select * from actor
limit 50;


select * from city limit 100 offset 20;



