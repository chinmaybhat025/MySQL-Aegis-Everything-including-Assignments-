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

       
