create database SQL_Assingment07;

use SQL_Assingment07;

-- 1.	From the .csv file given below:
-- a.	Load the data into a table using MySQL for Excel

CREATE TABLE employee (
    Project_code varchar(255),
    Project_Title VARCHAR(255),
    Project_Manger Varchar(50),
    Project_Budget int,
    Employee_No varchar(50),
    Employee varchar(50),
    Department_No varchar(50),
    Department_Name varchar(50),
    Hourly_Rate int,
    Dependents varchar(50)
);

-- Drop table employee;

SELECT @@global.secure_file_priv;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/employee.csv' 
INTO TABLE employee 
fields terminated by ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;


select * from employee;

select * from employee t cross join (select 1 as n UNION  SELECT 2 UNION  SELECT 3) n;

create table employee_1nf (
    Project_Title VARCHAR(255),
    Department_Name varchar(50),
    Dependents varchar(50)) as 
SELECT distinct Project_Title, Department_Name,SUBSTRING_INDEX(SUBSTRING_INDEX(t.Dependents, ',', n.n), ',', -1) Dependents
FROM employee t CROSS JOIN 
(SELECT 1 as n UNION ALL SELECT 2 UNION ALL SELECT 3) n;

Drop table employee_1nf;

select * from employee_1nf;


select * from employee_1nf where department_name='IT';

select * from employee;



create table employee_2nf_1
(Project_Title  VARCHAR(255), Department_Name varchar(50)) as
select Project_Title, Department_Name from employee_1nf;

create table employee_2nf_2
(Department_Name varchar(50), Dependents varchar(50)) as
select distinct Department_Name, Dependents from employee_1nf;


-- Note:-As we are unable to find the transitive dependency in the above two tables i.e.employee_2nf_1 and employee_2nf_2 so we are unable to apply 3NF on this.

