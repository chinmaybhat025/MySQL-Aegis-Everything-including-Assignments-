use sakila;

-- Logical operators --
-- Display data as per condition
-- Q.1)
select actor_id,first_name,last_name 
from actor 
where first_name='Zero' and last_name='Cage';


-- Q.2)
select actor_id,first_name,last_name 
from actor 
where first_name='Helen' and last_name='Kilmer';

-- Q.3)
select actor_id,first_name,last_name 
from actor 
where first_name='Helen' or last_name='Kilmer';


-- Q.4)
select actor_id 
from actor 
where actor_id not in(11,22);

-- Q.5)
select actor_id,first_name,last_name
from actor
where (first_name='Helen' or last_name='Kilmer')
and actor_id>36;

-- Q.6)
-- Comparison functions and Operators
select film_id, category_id
from film_category
where category_id between 13 and 16;

-- Q.7)
select city,country_id 
from city
where country_id>44;

-- Q.8)
select city,country_id
from city
where country_id>=44;

-- Q.9)
select city,country_id
from city
where country_id=44;

-- Q.10)
select city,country_id
from city
where country_id<100;

-- Q.11)
select city,country_id
from city
where country_id<=100;

-- Q.12)
select country_id
from city
where country_id in(25,30,41,46,66,70);

-- Q.13)
select country_id
from city
where country_id not in(25,30,41,46,66,70);

-- Q.14)
select film_id,category_id
from film_category
where category_id not between 13 and 16;

-- Q.15)
select address,address2
from address
where address2 is not null;

-- Q.16)
select address, address2
from address
where address2 is null;

-- Q.17)
select * from actor where actor_id!=29;
select * from actor where actor_id<>29;

-- Q.18)
-- SQL Wildcards
select * from actor where first_name like '%is';

-- Q.19)
select * from actor where first_name like 'an%';

-- Q.20)
select * from actor where first_name like '%le%';

-- Q.21)
select * from actor where first_name like 'b%r_';

-- Q.22)
select * from actor where first_name like '_ar%';


-- ORDER BY CLAUSE IS USED FOR SORTING THE DATA BY EITHER ASCENDING OR DESCENDING ORDER.by default data has been sorted by ascending order.
select *
from actor
where actor_id>20
order by first_name asc;

-- Q.23)
select * 
from actor 
where first_name like '%s' 
order by first_name;

-- Q.24)
select * from actor where last_name like 'A%' order by last_name desc;

-- Q.25)
select * from actor where actor_id between 1 and 50 order by last_name desc;

-- Q.26)
select actor_id,first_name,last_name
from actor
order by first_name desc;

-- Alternative way
select actor_id,first_name,last_name
from actor
order by 2 desc;

-- Q.27)
-- Practice Part
select ceil(29.45);
select floor(29.45);
select sqrt(25);
select power(4,3);
select mod(38,6);
select ln(33);
select abs(-133.45);
select round(100.34);
select round(100.67);

-- Practice--
use movies;

create table employee1
(
id int primary key,
name char(20),
salary int,
age int
);

insert into employee1(id,name,salary,age) values(1,'Harsh',2000,19),(2,'Dhanraj',3000,20),(3,'Akash',1500,19),(4,'Harsh',2000,19),(5,'Ashish',1500,19);

select * from employee1;

-- Aggregate Functions--
-- IMPORTANT NOTE:--
-- Before Group by clause if you want to use condition you are using where clause and if you want to use condition after group by clause then you need to give the same in the Having clause.
-- *******--
-- Hierarchy--
-- 1) select 
-- 2) from
-- 3) where
-- 4) group by
-- 5) having 
-- 6) order by
-- 7)limit, offset
-- *******--

select name,sum(salary) as 'Total Salary'
from employee1
group by name;


--
select name,sum(salary) as 'Total Salary'
from employee1
group by name
having sum(salary)>3500;

--
create table student1
(
subject char(20),
year year,
name char(20)
);

select * from student1;

insert
into
student1
values('ENGLISH',1,'Harsh'),('ENGLISH',1,'Pratik'),('ENGLISH',1,'RAMESH'),('ENGLISH',1,'SURESH'),('ENGLISH',1,'Ashish'),('MATHS',2,'SANKET'),('MATHS',2,'CHINMAY');

select * from student1;

--
select subject,year,count(*)
from student1
group by subject ,year;

--
create table employee2
(
id int primary key,
name char(20),
dept_name char(20),
salary int
);

select * from employee2;




insert into employee2 values(1,'RAJ','HR',10000),(2,'ANKIT','MARKETING',20000),(3,'CHINMAY','HR',30000),(4,'RAM','IT',40000),(5,'SANKET','HR',50000),(6,'DHAMRIL','IT',60000),(7,'SARANG','HR',70000);

select * from employee2;

insert into employee2 values(8,'MAXWELL','IT',NULL);

select * from employee2;

select dept_name
from employee2
group by dept_name
having count(*)<2;

-- 
select dept_name,sum(salary) from employee2
group by dept_name;	

-- 						 	
select dept_name,sum(salary)
from employee2
where dept_name='HR';

--
select avg(salary) from employee2;

select min(salary) from employee2;

select max(salary) from employee2;

select count(salary) from employee2;

select count(*) from employee2;-- it does not include null value existing row.

--
select dept_name,min(salary) from employee2 group by dept_name;

--
select distinct(salary) from employee2;



