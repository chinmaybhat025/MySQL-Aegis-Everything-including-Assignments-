# 1NF example
use normalization;
create table course_content (course varchar(50),content varchar(100));


insert into course_content values ('Programming','Java,C++'),('Web','HTML,PHP,ASP');


SELECT * FROM course_content;



select 1 as n UNION  SELECT 2 UNION  SELECT 3;

select * from course_content t cross join (select 1 as n UNION  SELECT 2 UNION  SELECT 3) n;

SELECT SUBSTRING_INDEX("www.w3schools.com", ".", 1);


create table course_content_1nf (course varchar(50),content varchar(100)) as 
SELECT distinct course ,SUBSTRING_INDEX(SUBSTRING_INDEX(t.content, ',', n.n), ',', -1) content
FROM course_content t CROSS JOIN 
(SELECT 1 as n UNION ALL SELECT 2 UNION ALL SELECT 3) n
order by course;




Drop table course_content_1nf;

select * from course_content_1nf;




# 2NF example


create table purchase (cust_id integer,store_id integer, pur_loc varchar(100));


insert into purchase values
(1,1,'Los Angeles'),
(1,3,'San Francisco'),
(2,1,'Los Angeles'),
(3,2,'New York'),
(4,3,'San Francisco');


select * from Purchase;




create table purchase_2nf_1 (cust_id integer,store_id integer) as 
select cust_id, store_id from purchase;


select * from purchase_2nf_1;



create table purchase_2nf_2 (store_id integer,pur_loc varchar(100)) as 
select distinct store_id, pur_loc from purchase;


select * from purchase_2nf_2; 




# 3NF example



create table books (book_id integer,genre_id integer, genre_type varchar(100), price decimal(5,2));

insert into books values
(1,1,'Gardening',25.99),
(2,2,'Sports',14.99),
(3,1,'Gardening',10.00),
(4,3,'Travel',12.99),
(5,2,'Sports',17.99);


select * from books;




create table books_3nf_1 (book_id integer,genre_id integer , price decimal(5,2)) as 
select book_id ,genre_id, price from books;


select * from books_3nf_1;




create table books_3nf_2 (genre_id integer, genre_type varchar(100)) as 
select distinct genre_id , genre_type from books;


select * from books_3nf_2;

SET GLOBAL local_infile = true;
SHOW GLOBAL VARIABLES LIKE 'local_infile';