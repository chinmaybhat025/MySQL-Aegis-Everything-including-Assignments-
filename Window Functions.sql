-- 
create database windows;

use windows;

create table sales
(
year int,
country varchar(20),
product varchar(32),
profit int
);


insert into sales values
(2001,'USA','TV',100),
(2001,'USA','Computer',1500),
(2001,'Finland','Phone',10),
(2000,'India','Calculator',75),
(2001,'USA','TV',150),
(2000,'India','Calculator',75),
(2000,'USA','Calculator',75),
(2000,'India','Computer',1200),
(2001,'USA','Calculator',50),
(2000,'Finland','Phone',100),
(2001,'USA','Computer',1200),
(2000,'USA','Computer',1500),
(2000,'Finland','Computer',1500);


-- 
select count(1) from sales;

select sum(profit) as total_profit from sales;

select country,sum(profit) as country_profit from sales group by country order by country;

-- Over() Clause
select year,country,product,profit,
       sum(profit) over() as total_profit,
       sum(profit) over (partition by country) as country_profit
       from sales
       order by country,year,product,profit;
       
-- 
select  
year,country,product,profit,
row_number() over() as row_num1,
row_number() over(w order by year,product) as row_num2
from sales 
window w as (Partition by country);

--
create table numbers
(
val1 int,
t time,
subject varchar (15),
val2 int
);

insert into numbers values
(1,'07:00:00','st113',10),
(1,'07:15:00','st113',9),
(2,'07:30:00','st113',25),
(3,'07:45:00','st113',20),
(3,'07:00:00','xh458',0),
(3,'07:15:00','xh458',10),
(4,'07:30:00','xh458',5),
(4,'07:45:00','xh458',30),
(5,'08:00:00','xh458',25);

    
select * from numbers;

select
    val1,
    row_number() over w as 'row_number',
    cume_dist() over w as 'cume_dist',#row_number/total_rows
    percent_rank() over w as 'percent_rank',#(rank-1)/(total_rows-1)
    dense_rank() over w as 'dense_rank',
    rank() over w as 'rank',
    ntile(2)  over w as 'ntile2',
    ntile(4)  over w as 'ntile4'
    from numbers
    window w as (order by val1);
    
-- Lag and Lead--
select
     t,val2,
     lag(val2) over w as 'lag',
     lead(val2) over w as 'lead',
     val2-lag(val2) over w as 'lag diff',
     val2-lead(val2) over w as 'lead diff'
	from numbers
    window w as (order by t);
    
create table basic_pays
(
employee_name varchar(50) not null,
department varchar(50) not null,
salary int not null,
primary key(employee_name,department)
);

insert into 
basic_pays(employee_name,department,salary) 
values('Diane Murphy','Accounting',8435),
('Mary Patterson','Accounting',9998),

    
    



 
 


