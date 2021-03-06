create database dp1801;

use dp1801;

create table books (
    title varchar(255),
    author_fname varchar(255),
    author_lname varchar(255),
    released_year int,
    stock_quantity int,
    pages int
);



insert into books (title, author_fname, author_lname, released_year, stock_quantity, pages) values ('Half of a Yellow Sun', 'Chimamanda', 'Adichie Ngozi', 2006, 25, 448), 
('Foundation', 'Isaac', 'Asimov', 1951, 10, 200), 
('Foundation and Empire', 'Isaac', 'Asimov', 1952, 15, 224), 
('Second Foundation', 'Isaac', 'Asimov', 1953, 12, 191),
 ('Rendezvous with Rama', 'Arthur C.', 'Clarke', 1973, 20, 252),
 ('Into the Wild', 'Jon', 'Krakauer', 1996, 5, 207), 
('Istanbul: Memories and the City', 'Orhan', 'Pamuk', 2003, 15, 348), 
('The Grapes of Wrath', 'John', 'Steinbeck', 1939, 40, 476), 
('The Importance of Being Earnest', 'Oscar', 'Wilde', 1895, 30, 54),
('Harry Potter and the Philosopher\'s Stone', 'J.K.', 'Rowling', 1997, 100, 223), ('Harry Potter and the Chamber of Secrets', 'J.K.', 'Rowling', 1998, 80, 251), ('Harry Potter and the Prisoner of Azkaban', 'J.K.', 'Rowling', 1999, 125, 317), ('Harry Potter and the Goblet of Fire', 'J.K.', 'Rowling', 2000, 65, 636),
 ('Harry Potter and the Order of the Phoenix', 'J.K.', 'Rowling', 2003, 80, 766), ('Harry Potter and the Half-Blood Prince', 'J.K.', 'Rowling', 2006, 55, 608),
 ('Harry Potter and the Deathly Hallows', 'J.K.', 'Rowling', 2007, 90, 607),
 ('The Conquest of Happiness', 'Bertrand', 'Russell', 1930, 10, 183), 
('Midnight\'s Children', 'Salman', 'Rushdie', 1981, 30, 647), 
('Haroun and the Sea of Stories', 'Salman', 'Rushdie', 1990, 45, 219),
 ('Shalimar the Clown', 'Salman', 'Rushdie', 2005, 20, 649);
 
 
 select * from books;
 
 -- 1.Combine author_fname and author_lname with space in between and name the column as full name from books.
 select concat_ws(author_fname,',' ,author_lname) as full_name from books;
 
-- 2.Combine title, author_fname, author_lname with '-' in between each column and 
-- alias the query with your own choice.
select concat_ws('-',title,author_fname,author_lname) as new_details from books;

-- 3. --String- Hello World
-- Print the following using substring:-
-- 1. World
-- 2. rld
-- 3. Hell
-- 1)
SELECT SUBSTRING('Hello World',6) As output;
-- 2)
SELECT SUBSTRING('Hello World',9) As output1;

SELECT SUBSTRING('Hello World',-3) As output1;
-- 3)
SELECT SUBSTRING('Hello World',1,4) As output2;

-- 4. In string 'Hello World' replace only Hello with '%$@#!'
SELECT REPLACE('Hello World', 'Hello', '%$@#!') as ouput3;	

-- 5) Reverse the column author_fname.
-- select * from books;
SELECT reverse(author_fname) from books;

-- 6)Print the column title from books table in uppercase.
select upper(title) as upper_title_name from books;

-- 7)Print the total number of books in Stock.
-- select * from books;
select count(title) as Number_of_books from books;

-- 8)From books table in title column print the values from 1st to 10th character.
SELECT SUBSTRING(title, 1, 10) as extract_char FROM books;

-- 9)Replace the character 'e' by 3 in title column from books table.
select replace(title, 'e',3) as new_title from books;

-- 10)Reverse author_fname and combine it with author_fname.
select concat(reverse(author_fname),' ',author_fname) as new_copy from books;

-- Q.2
-- 1)Print the length of author_lname as length along with author_lname from books.
select author_lname,length(author_lname) as length from books;

-- 2)From books table, print the title in lowercase and combine it with "My Fav book is the".
-- select * from books;

select concat('My Fav book is the',',',lower(title)) as new_out from books;

-- 3) Reverse and uppercase the following sentence:
-- "Why does my cat look at me with such hatred?"
select upper(reverse("Why does my cat look at me with such hatred?")) as upperreverse;

-- 4) Select all titles that contain stories in their value.
-- select * from books;

select title from books where title like '%stories%';

-- 5)In title column replace ' ' with '->' and name it as title from books.
select replace(title,' ','->') as title from books;


-- 6. Combine author_fname and author_lname with space in between and print only unique values from books.
select distinct(concat_ws(' ',author_fname,author_lname)) as diff from books;

-- 7.Sort author_fname in asc order and display title, author_fname, author_lname.
select title,author_fname,author_lname
from books
order by author_fname asc;

-- 8. Name all SQL sub languages along with commands used in each language.
-- There are five types of sublanguages in MySQL
-- 1) DDL(Data Definition Language)
-- i) CREATE ii) Truncate iii) ALTER iv) DROP v) RENAME
-- 2) DML(Data Manipulation Language)
-- i) INSERT ii) UPDATE iii) DELETE
-- 3) DRL(Data Retrieval Language)
-- i) SELECT
-- 4) DCL(Data Control Language)
-- i) GRANT ii) REVOKE
-- 5) TCL(Transaction Control Language)
-- i) COMMIT ii) ROLLBACK iii)SAVEPOINT


-- 9)Are the data types valid?
-- 1. -71475634987: INT
-- 2. 8907.70: INT
-- 3. -765423.4352: DECIMAL(10,3)
-- 4. ???1990-1-21???: DATE

-- creating the one table

create table t1
(
 Data1 int,
 Data2 int,
 Data3 decimal(10,3),
 Data4 Date
 );
 

 
 select * from t1;
 
 insert into t1(Data1) values(-71475634987);-- Out of range values
 
 insert into t1(Data2) values(8907.70);-- Successfully 1 row returned.
 
 insert into t1(Data3) values(-765423.4352);-- Successfully 1 row returned but data got truncated.
  
 insert into t1(Data4) values('1990-1-21');-- Successfully 1 row returned.
 
 
 -- [Using Sakila Database answer these questions]
-- 3. Select a title from nicer_but_slower_film_list
-- where category is horror and rating is pg.
use sakila;

select title from nicer_but_slower_film_list where category='Horror' and rating='PG';

-- 4. Choose 5 of the longest NC-17 rated films!
-- Using actor table. 
select title,length,rating from film where rating='NC-17' order by length desc limit 5 ;

-- 5.select all values from table nicer_but_slower_film_list,
 -- select actors having name joe or jim and having category either
-- comedy or horror.
select 
* from nicer_but_slower_film_list 
where actors like '%Joe%' or actors like '%jim%' 
having category='Comedy' or category='Horror';

-- 6. From table city find the cities starting with i
-- and whose country id is not 50 and print in upper case.
select upper(city),country_id from city where city like 'i%' and country_id not in(50);

-- 7.A)From the table address find the list of district
-- that are repeated.
-- B. From film table , give min and max length of film for
-- each rating.


-- A) 
select district,count(district) from address group by district having count(district)>1;

-- B)
select max(length),min(length) from film group by rating;

-- 8. A. Retreive all attribute of movies from film _list which falls under category documentary or horror and whose length is less than 60.
-- B. Select from film list where rental duration is 6 months and replacement cost in in descending order.

-- A)
select * from film_list where category in('Documentary','Horror') and length < 60;
select * from information_schema.columns where table_schema='sakila';
-- B)
select * from film where rental_duration=6 order by replacement_cost desc;


-- 10.A. Write an SQL statement where order dates are anything but not 2012-08-17, or customer id is not greater than 3005 and purchase amount is not below 1000.
-- Name of the table-> ORDERS
-- Columns-> Order_number, purchase_amt,  order_date, custID,salesman_ID
use sakila;
select * from orders where (order_date <> '2012-08-17' or customer_id < 3005) and purchase_amt>1000 ;

-- B. How to fetch  monthly Salary of Employee if annual salary is given? 
-- Name of the table->Employee
-- Columns-> ID, Name, Salary
select (Salary/12) as monthly_Salary from Employee;


select * from film_list;

select(select title from film_list where title='ACADEMY DINOSAUR' );

 




















 
 

