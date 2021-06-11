-- Normalization-- 
-- First Normal Form
-- Second Normal Form
-- Third Normal Form

-- What is Normalization?

-- Normalization is a database design technique which organizes tables in a manner that reduces redundancy and dependency of data.

-- It divides larger tables to smaller tables and links them using relationships. 

create database Normalization;

use Normalization;


-- 1NF Example
create table course_content
(
course varchar(50),
content varchar(100)
);

insert into course_content values('Programming','Java,C++'),('Web','HTML,PHP,ASP');
insert into course_content values('Scripting','Javascript,Jquery');

##
select * from course_content;

select 1 as n UNION select 2 union select 3;

select * from course_content t cross join(select 1 as n UNION select 2 union select 3) n;

select substring_index("www.w3schools.com",".",1);

select substring_index("www.w3schools.com",".",2);

select substring_index("www.w3schools.com",".",-1);


-- Creating 1NF Form with example--
create table course_content_1nf
(course varchar(50),content varchar(100)) as
select distinct course,substring_index(substring_index(t.content,',',n.n),',',-1) content
from course_content t cross join
(select 1 as n union all select 2 union all select 3) n
order by course;
-- END Here


select * from course_content_1nf;

-- 2NF Example

create table purchase
(
cust_id integer,
store_id integer,
pur_loc varchar(100)
);

insert into purchase values(1,1,'Los Angeles'),(1,3,'San Francisco'),(2,1,'Los Angeles'),(3,2,'New York'),(4,3,'San Francisco');

select * from purchase;


-- 
create  table purchase_2nf_1(cust_id integer,store_id integer) as select cust_id,store_id from purchase;

select * from purchase_2nf_1;

create table purchase_2nf_2(store_id integer,pur_loc varchar(100)) as select distinct store_id,pur_loc from purchase;

select * from purchase_2nf_2;


-- 3NF Example--

create table books(book_id integer,genre_id integer,genre_type varchar(100),price decimal(5,2));

insert into books values
(1,1,'Gardening',25.99),
(2,2,'Sports',14.99),
(3,1,'Gardening',10.00),
(4,3,'Travel',12.99),
(5,2,'Sports',17.99);

select * from books;

create table books_3nf_1(book_id integer,genre_id integer, price decimal(5,2)) as
select book_id,genre_id,price from books;


select * from books_3nf_1;

create table books_3nf_2(genre_id integer, genre_type varchar(100)) as
select distinct genre_id,genre_type from books;


select * from books_3nf_2;




