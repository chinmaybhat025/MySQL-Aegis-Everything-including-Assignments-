use sakila;

select (ceil(30.30));

select floor(93.30);

select sqrt(25);

select power(4,3);

select mod(38,6);

select ln(33);

select abs(12.43);

select abs(-13.89);

select round(100.546);

select round(100.346);

select round(100.346,1);

select round(100.346,3);

use dp1801;

create table employee
(
eid int primary key,
salary int
);

select * from employee;

insert into employee values(1,1000),(2,2000),(3,3000),(4,4000),(5,5000),(6,6000),(7,7000),(8,8000),(9,9000),(10,10000);

select eid, (salary/2000)%0 as new
from employee;
