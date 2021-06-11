/*
DURATION : 120 MINUTES
MAX MARKS: 50


All the questions in both the sections are compulsory. 

Few questions are based on the Chinook database (already provided as Chinook.sql) which represents a digital media store, 
including tables for artists, albums, media tracks, invoices, customers, etc. */

#####################################################SECTION A#############################################################
/*1.Display a pivot table for the number of customers from diferent countries handled by each of the sales support agent. 		  [5 marks]
*/ use chinook;

select  
  c.country, 
  sum( if( c.supportrepid=3, 1, 0 ) ) as 'peacock', 
  sum( if( c.supportrepid=4, 1, 0 ) ) as 'park', 
  sum( if(c.supportrepid=5, 1, 0 ) )   as 'johnson' 
from customer c
group by country; 


/*2.Display a pivot table for the sum of sale amount for each year over different quarters.								[5 marks]
*/

create table imp1 as select year(invoicedate) as year,month(invoicedate) as month ,sum(total) over(order by month(invoicedate)) as sum from invoice;
select year,
sum( if( month=1 or month=2 or month=3 , sum, 0 ) ) as 'quarter1',
sum( if( month=4 or month=5 or month=6 , sum, 0 ) ) as 'quarter2',
sum( if( month=7 or month=8 or month=9 , sum, 0 ) ) as 'quarter3',
sum( if( month=10 or month=11 or month=12 , sum, 0 ) ) as 'quarter4'
from imp1 group by year;







/*3.Create 3 users and 2 roles and assign those roles to users. 			[5 marks]
show grants for all 3 users and drop a roleand drop a user*/
CREATE USER suyash@localhost IDENTIFIED BY '12345';
CREATE USER akash@localhost IDENTIFIED BY '12345';
CREATE USER nishant@localhost IDENTIFIED BY '12345';

CREATE ROLE role1, role2;
GRANT ALL ON chinook.* TO role1;
GRANT INSERT, DELETE ON chinnok.* TO role2;

GRANT  role1, role2 TO suyash@localhost, akash@localhost, nishant@localhost;
show grants for suyash@localhost;
show grants for akash@localhost;
show grants for nishant@localhost;
DROP ROLE role1;
drop user suyash@localhost;



/*4. Display the total sale in a month, avg sale in a month, highest sale in a month and highest sale in the year for each month-year value
																												[5 marks]
*/
select total,
avg(total) over w,
max(total) over w,
max(total) over w
from invoice
window w as (group by month(invoicedate));
#window p as (group by year(invoicedate));




/*5. Create a simple procedure that takes in the customerid and returns the total bill incurred by the customer. 					[5 marks]
*/
create procedure bill(in id int)
select sum(total)from invoice where customerid=id ;
call bill(4);

/*6.	From the .csv file given below:
a.	Load the data into a table 		                                               
b.	Then perform normalization on it, up to 3NF. 				                   [15 marks] 
*/
create table exam(Project_Code varchar(30),	Project_Title varchar(30),	Project_Manager varchar(30),	
Project_Budget int,	Employee_No varchar(30),Employee_Name varchar(30),Department_No varchar(30),
Department_Name varchar(30),Hourly_Rate varchar(30),Dependents varchar(30));

load data infile "C://ProgramData//MySQL//MySQL Server 8.0//Uploads//Employee1.csv" into table exam
 fields terminated by','
 optionally enclosed by '"'
 lines terminated by '\r\n'
 ignore 1 lines;
 select * from exam;
 
 #1nf

create table exam_1nf as
select distinct Project_Code,Employee_No,Project_Title,Project_Manager,Project_Budget,
Employee_Name,Department_No,Department_Name,Hourly_Rate,
substring_index(substring_index(t.Dependents,',',n.n),',',-1)depdts
from exam t cross join(select 1 as n union select 2 union select 3)n;
select * from exam_1nf;


#2nf
create table 2nf_1 as select project_code,employee_no,department_no,department_name,hourly_rate,depdts from exam_1nf;

create table 2nf_2 as select distinct project_code, project_title,project_manager,project_budget from exam_1nf;

create table 2nf_3 as select distinct employee_no,employee_name from exam_1nf;


## 3nf
select * from 2nf_1;


/*7. Write a function to print the factorial of a number.                                         [5 marks]
*/
SET GLOBAL log_bin_trust_function_creators = 1;


DELIMITER //
CREATE FUNCTION fact(x int,i int) RETURNS int
BEGIN
DECLARE result int;
set result=1;

set i=1;
WHILE i <= x DO
    SET result = result * i;
    SET i = i + 1;
  END WHILE;
RETURN result;
END//
delimiter ;

select fact(3,5);
 



/*8. Create a trigger for the Sakila database, that stores in the log the original name,           [5 marks]
new name and time of update, when a customer name is updated.*/

use sakila;
select * from customer;
#########################################################
CREATE TABLE Emp_log(
  
   old_name varchar(50),
  new_name varchar(50),

   Lastinserted Time
       );

select * from emp_log;

drop trigger if exists Employee_Trigger;

delimiter $$
CREATE TRIGGER Emp_Trigger
AFTER update ON customer
FOR EACH ROW
BEGIN
insert into emp_log values(old.first_name,
new.first_name,curtime());
 END$$
delimiter ;

update customer set first_name='suyash' where first_name like 'mary';

select * from emp_log;


