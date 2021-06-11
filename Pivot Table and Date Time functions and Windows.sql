create database windows;
use windows;
drop table sales;
CREATE TABLE sales
(
    year    INT,
    country VARCHAR(20),
    product VARCHAR(32),
    profit  INT
);       

insert into sales values
(2001 , 'USA'     , 'TV'         ,    100),
(2001 , 'USA'     , 'Computer'   ,   1500),
(2001 , 'Finland' , 'Phone'      ,     10),
(2000 , 'India'   , 'Calculator' ,     75),
(2001 , 'USA'     , 'TV'         ,    150),
(2000 , 'India'   , 'Calculator' ,     75),
(2000 , 'USA'     , 'Calculator' ,     75),
(2000 , 'India'   , 'Computer'   ,   1200),
(2001 , 'USA'     , 'Calculator' ,     50),
(2000 , 'Finland' , 'Phone'      ,    100),
(2001 , 'USA'     , 'Computer'   ,   1200),
(2000 , 'USA'     , 'Computer'   ,   1500),
(2000 , 'Finland' , 'Computer'   ,   1500);

select * from sales;
SELECT SUM(profit) AS total_profit FROM sales;
SELECT country, SUM(profit) AS country_profit FROM sales GROUP BY country ORDER BY country;

SELECT year, country, product, profit,
		SUM(profit) OVER() AS total_profit,
		SUM(profit) OVER(PARTITION BY country) AS country_profit
       FROM sales
       ORDER BY country, year, product, profit;


SELECT
         year, country, product, profit,
         ROW_NUMBER() OVER() AS row_num1,
         ROW_NUMBER() OVER (w ORDER BY year, product) AS row_num2
       FROM sales
       window w as (PARTITION BY country);#MODIFICATION TO CLAUSE MENTIONED IN WINDOW SPECIFICATION WILL NOT BE ALLOWED
       


create table numbers (val1 int,t time, subject varchar(15), val2 int);
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
SELECT
         val1,
         ROW_NUMBER()   OVER w AS 'row_number',
         CUME_DIST()    OVER w AS 'cume_dist', #row_number/total_rows
         PERCENT_RANK() OVER w AS 'percent_rank', #(rank-1)/(total_rows-1)
         DENSE_RANK() OVER w AS 'dense_rank',
         RANK() OVER w AS 'rank',
         NTILE(2)     OVER w AS 'ntile2',
         NTILE(4)     OVER w AS 'ntile4'
		FROM numbers
       WINDOW w AS (ORDER BY val1);
       
       
   
       
  SELECT
         t, val2,
         LAG(val2)        OVER w AS 'lag',
         LEAD(val2)       OVER w AS 'lead',
         val2 - LAG(val2)  OVER w AS 'lag diff',
         val2 - LEAD(val2) OVER w AS 'lead diff'
       FROM numbers
       WINDOW w AS (ORDER BY t);
       
       CREATE TABLE basic_pays(
    employee_name VARCHAR(50) NOT NULL,
    department VARCHAR(50) NOT NULL,
    salary INT NOT NULL,
    PRIMARY KEY (employee_name , department)
);
 
INSERT INTO 
 basic_pays(employee_name, 
    department, 
    salary)
VALUES
 ('Diane Murphy','Accounting',8435),
 ('Mary Patterson','Accounting',9998),
 ('Jeff Firrelli','Accounting',8992),
 ('William Patterson','Accounting',8870),
 ('Gerard Bondur','Accounting',11472),
 ('Anthony Bow','Accounting',6627),
 ('Leslie Jennings','IT',8113),
 ('Leslie Thompson','IT',5186),
 ('Julie Firrelli','Sales',9181),
 ('Steve Patterson','Sales',9441),
 ('Foon Yue Tseng','Sales',6660),
 ('George Vanauf','Sales',10563),
 ('Loui Bondur','SCM',10449),
 ('Gerard Hernandez','SCM',6949),
 ('Pamela Castillo','SCM',11303),
 ('Larry Bott','SCM',11798),
 ('Barry Jones','SCM',10586);
 
 SELECT
    employee_name,
    salary,
    NTH_VALUE(employee_name, 2) OVER  (
        ORDER BY salary DESC
    ) second_highest_salary
FROM
    basic_pays;
    
    
    SELECT
 employee_name,
 department,
 salary,
 NTH_VALUE(employee_name, 2) OVER  (
 PARTITION BY department
 ORDER BY salary DESC
 ) second_highest_salary
FROM
 basic_pays;
 
 
 #First_Value   
    CREATE TABLE overtime (
    employee_name VARCHAR(50) NOT NULL,
    department VARCHAR(50) NOT NULL,
    hours INT NOT NULL,
    PRIMARY KEY (employee_name , department)
);
INSERT INTO overtime(employee_name, department, hours)
VALUES('Diane Murphy','Accounting',37),
('Mary Patterson','Accounting',74),
('Jeff Firrelli','Accounting',40),
('William Patterson','Finance',58),
('Gerard Bondur','Finance',47),
('Anthony Bow','Finance',66),
('Leslie Jennings','IT',90),
('Leslie Thompson','IT',88),
('Julie Firrelli','Sales',81),
('Steve Patterson','Sales',29),
('Foon Yue Tseng','Sales',65),
('George Vanauf','Marketing',89),
('Loui Bondur','Marketing',49),
('Gerard Hernandez','Marketing',66),
('Pamela Castillo','SCM',96),
('Larry Bott','SCM',100),
('Barry Jones','SCM',65);

select * from overtime;

SELECT
    employee_name,
    hours,
    FIRST_VALUE(employee_name) OVER (
        ORDER BY hours
    ) least_over_time
FROM
    overtime;
    
   
   
   SELECT
    employee_name,
    department,
    hours,
    FIRST_VALUE(employee_name) OVER (
        PARTITION BY department
        ORDER BY hours desc
    ) least_over_time
FROM
    overtime;
    
      SELECT
    employee_name,
    department,
    hours,
    FIRST_VALUE(employee_name) OVER (
        PARTITION BY department
        ORDER BY hours 
    ) least_over_time
FROM
    overtime;

       
###################################################DATE and TIME FUNCTIONS#########################################
SELECT DATE_ADD('2008-01-02', INTERVAL 31 DAY);
SELECT ADDDATE('2008-01-02', INTERVAL 1 YEAR);
SELECT ADDTIME('2007-12-31 23:59:59.999999', '1 1:1:1.000002');
SELECT CONVERT_TZ('2004-01-01 12:00:00','+00:00','+10:00');#Named time zones can be used only if the time zone information tables in the mysql database have been created and populated.
SELECT CURDATE();
SELECT DATE('2003-12-31 01:02:03');
SELECT DATE_FORMAT('2009-10-04 22:23:00', '%W %M %Y');
SELECT DATE_FORMAT('2007-10-04 22:23:00', '%H:%i:%s');
SELECT DATE_SUB('2018-05-01',INTERVAL 2 MONTH);#SUBDATE
SELECT DATEDIFF('2007-12-31 23:59:59','2007-12-30');
SELECT DAYNAME('2007-02-03');
SELECT EXTRACT(YEAR FROM '2019-07-02');
SELECT EXTRACT(YEAR_MONTH FROM '2019-07-02 01:02:03');
SELECT EXTRACT(DAY_MINUTE FROM '2019-07-31 01:02:03');
SELECT EXTRACT(MICROSECOND FROM '2003-01-02 10:30:00.000123');
SELECT HOUR('10:05:03');#try microsecond, minute, month, QUARTER, SECOND
select MONTHNAME('2003-01-02 10:30:00.000123');#QUARTER,TIME
SELECT LAST_DAY('2004-02-05');
SELECT MAKEDATE(2011,31), MAKEDATE(2011,32),MAKEDATE(2011,365), MAKEDATE(2014,365);
SELECT MAKETIME(12,15,30);
SELECT NOW(5);#CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP, LOCALTIME(), LOCALTIME, LOCALTIMESTAMP, LOCALTIMESTAMP()
SELECT SEC_TO_TIME(2378);#TIME_TO_SEC
SELECT STR_TO_DATE('May 1, 2013','%M %d,%Y');

#################################################################EXPLAIN##############################################################

explain select * from film where film_id between 0 and 1000;

select * from film where length=(select max(length) from film);
#drop index idx_len on film;
create index idx_len on film(length);

select name,max(length) from film 
	join film_category using(film_id) 
		join category using(category_id)
			group by name;

select title,concat(first_name, ' ',last_name) from actor join film_actor using(actor_id) join film using(film_id) where film_id=100;
/*id: The SELECT identifier. This is the sequential number of the SELECT within the query. The value can be NULL if the row refers to the 
union result of other rows. In this case, the table column shows a value like <unionM,N> to indicate that the row refers to the union of the 
rows with id values of M and N.


select_type: The type of SELECT, which can be any of those shown in the following table.
select_type Value			Meaning
SIMPLE						Simple SELECT (not using UNION or subqueries)
PRIMARY						Outermost SELECT
UNION						Second or later SELECT statement in a UNION
DEPENDENT UNION				Second or later SELECT statement in a UNION, dependent on outer query
UNION RESULT				Result of a UNION.
SUBQUERY					First SELECT in subquery
DEPENDENT SUBQUERY			First SELECT in subquery, dependent on outer query
DERIVED						Derived table
UNCACHEABLE SUBQUERY		A subquery for which the result cannot be cached and must be re-evaluated for each row of the outer query
UNCACHEABLE UNION			The second or later select in a UNION that belongs to an uncacheable subquery (see UNCACHEABLE SUBQUERY)


table: The name of the table to which the row of output refers. This can also be one of the following values:
<unionM,N>: The row refers to the union of the rows with id values of M and N.
<derivedN>: The row refers to the derived table result for the row with an id value of N.
			A derived table may result, for example, from a subquery in the FROM clause.
            
partitions:The partitions from which records would be matched by the query. This column is displayed only if the PARTITIONS keyword is used. 
The value is NULL for nonpartitioned tables.


type: The join type. 
const: The table has at most one matching row, which is read at the start of the query. Because there is only one row, values from the column in 
		this row can be regarded as constants by the rest of the optimizer. const tables are very fast because they are read only once.
        const is used when you compare all parts of a PRIMARY KEY or UNIQUE index to constant values. 
eq_ref:One row is read from this table for each combination of rows from the previous tables.
ref:All rows with matching index values are read from this table for each combination of rows from the previous tables. 
range:Only rows that are in a given range are retrieved, using an index to select the rows. 
ALL:A full table scan is done for each combination of rows from the previous tables. 


possible_keys: The possible_keys column indicates the indexes from which MySQL can choose to find the rows in this table.

key: The key column indicates the key (index) that MySQL actually decided to use.  

key_len:The key_len column indicates the length of the key that MySQL decided to use. 

ref: The ref column shows which columns or constants are compared to the index named in the key column to select rows from the table.

rows: The rows column indicates the number of rows MySQL believes it must examine to execute the query.

filtered: The filtered column indicates an estimated percentage of table rows that will be filtered by the table condition. The maximum value 
is 100, which means no filtering of rows occurred. Values decreasing from 100 indicate increasing amounts of filtering. rows shows the estimated 
number of rows examined and rows × filtered shows the number of rows that will be joined with the following table. For example, if rows is 1000 and
filtered is 50.00 (50%), the number of rows to be joined with the following table is 1000 × 50% = 500. This column is displayed if you use 
EXPLAIN EXTENDED.

Extra: This column contains additional information about how MySQL resolves the query.
*/

##############################################################PIVOTING TABLES###########################################################
DROP TABLE IF EXISTS tbl;
CREATE TABLE tbl( id INT, colName varchar(10), value CHAR(20) ); 
INSERT INTO tbl VALUES 
  (1,'First Name','Sampo'),(1,'Last Name','Kallinen'),(1,'Title','Office Manager'), 
  (2,'First Name','Jakko'),(2,'Last Name','Salovaara'),(2,'Title','Vice President');
select * from tbl;
select id, group_concat(value) from tbl group by id;
select id, 
group_concat(if(colName='First Name',value,NULL)) as 'First Name',
group_concat(if(colName='Last Name',value,NULL)) as 'Last Name',
group_concat(if(colName='Title',value,NULL)) as 'Title'
from tbl group by id;



drop table jobs; 
create table jobs( emp varchar(8), job varchar(8), qty int ); 
insert into jobs values 
  ('sue','email',5),('bill','email',7), 
  ('sally','print',2),('sue','sms',14),('bill','sms',2); 
select * from jobs;
select  
  emp, 
  sum( if( job='email', qty, 0 ) ) as 'emails', 
  sum( if( job='print', qty, 0 ) ) as 'printings', 
  sum( if( job='sms', qty, 0 ) )   as 'sms msgs' 
from jobs 
group by emp; 

