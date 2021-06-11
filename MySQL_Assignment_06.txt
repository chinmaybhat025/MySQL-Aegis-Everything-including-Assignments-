create database SQL_Assingment06;

use SQL_Assingment06;

-- 1.	Write a function to print the factorial of a number.
set global log_bin_trust_function_creators = 1 ;

delimiter $$
create function factorial (n integer) 
returns integer
begin 
Declare factorial integer default 1;
declare counter integer;
set counter=n;
factorial_loop:Repeat
set factorial=factorial*counter;
set counter=counter-1;
until counter=1
end repeat;
return factorial;
end $$
delimiter ;

select  factorial(4);


-- 2.	Write a stored procedure that takes a digit as parameter and returns it as a string. 
-- e.g.: if 5 is input, output is 'Five'.
delimiter $$
create procedure digi_name (in num1 int )
begin 
declare result varchar(30) ;
case num1
when 5 then set result = 'five' ;
end case ;
select concat(result , ' is the name of the digit ' , num1) as name ; 
end $$
delimiter ;
##drop procedure digi_name ;
call digi_name(5);


-- 3.	Create a trigger for the Sakila database, that stores in the log the original name, 
-- new name and time of update, when a customer name is updated.
use sakila;


CREATE TABLE info(
  original_name varchar(15),
  new_name varchar(50),
  updated_at TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  created_at TIMESTAMP NOT NULL
);

Drop table info;

INSERT INTO info (original_name, new_name, created_at) VALUES ('ASHISH','INGALE',NOW());
INSERT INTO info (original_name, new_name, created_at) VALUES ('CHINMAY','BHAT',NOW());
set sql_safe_updates=0;
Update info set new_name='SATHYE' where original_name='CHINMAY';

select * from info;
-- In this case, as you can see without giving value to the updated_at column we can see, same timestamp has been recorded.

-- Trigger creation-- 
delimiter $$
CREATE TRIGGER col_update
AFTER UPDATE ON info.new_name
FOR EACH ROW 
BEGIN
     UPDATE updated_at SET new.updated_at=now() where new_name=new.new_name;
END
delimiter ;


-- Q.4) What are the differences between Stored Procedures and Functions?
-- Both functions and stored procedures are sequence of SQL statements stored in the database for future access.

-- Stored Procedures:
-- 1)A procedure can't be called from DML statements.
-- 2)Procedures are parsed and compiled.
-- 3)Procedures are mainly used to process the tasks.
-- 4)Procedure doesn't return value.procedure can return more than one values using OUT parameter
-- 5)They are stored in compiled format in the database where as Functions are compiled and executed run time.
-- 6) A procedure is used to execute business logic.

-- Functions:
-- 1)DML operations performs in functions.
-- 2)functions always return a single value to the caller.
-- 3)Functions are mainly used to compute values.
-- 4)A function is used to compute a value.
-- 5)It returns type could be scalar or table or table values.


