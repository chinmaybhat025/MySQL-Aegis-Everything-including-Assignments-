create database 5XEngineer;

use 5XEngineer;

create table orders(order_id varchar(20), order_datetime datetime, customer_id varchar(20),item_id varchar(20), amount int, quantity int);

create table customer(customer_id varchar(20), name varchar(20), gender char(10), country varchar(20), age int);

create table items(item_id varchar(20), category varchar(20));

insert into orders values('a01','2020-01-01 7:23:59','b27','c87',20,2);
insert into orders values('a02','2020-01-02 8:13:27','b33','c56',100,3);
insert into orders values('a02','2020-01-02 8:13:27','b33','c57',39,1);
insert into orders values('a03','2020-01-02 13:26:39','b42','c31',587,10);

insert into customer values('b27', 'Sam','m','Singapore',20);
insert into customer values('b28', 'bob','m','Indonesia',27);
insert into customer values('b29', 'julie','f','Korea',43);

insert into items values('c87','sportswear');
insert into items values('c56','skincare');
insert into items values('c57','food');



-- Please send the relevant SQL code to answer the following questions:
-- 1. What’s the total sales amount for each month among customers who are older than 18?
Select Sum(a.amount) as total_sales_amount,month(a.order_datetime),b.age 
from orders a inner join customer b 
on a.customer_id=b.customer_id 
group by month(a.order_datetime)
having b.age>18;
 

-- Q.2)Show the most popular category in terms of sales quantity for each country and each gender in 2020.
Select b.category,a.amount,a.quantity as most_popular_category,c.country,c.gender
from orders a 
inner join items b
on a.item_id=b.item_id
inner join customer c
on a.customer_id=c.customer_id
group by c.gender,c.country
order by a.quantity desc;


-- 3. List the customer_id and their second order_id of customers who placed more than 10 orders in the last 7 days.


