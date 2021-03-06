/*
DURATION : 120 MINUTES
MAX MARKS: 50


All the questions in both the sections are compulsory. 

Few questions are based on the Chinook database (already provided as Chinook.sql) which represents a digital media store, 
including tables for artists, albums, media tracks, invoices, customers, etc. */

#####################################################SECTION A#############################################################
/*1.Display a pivot table for the number of customers from diferent countries handled by each of the sales support agent. 		  [10 marks]
*/ -- Hint(Customer table used supportrepid column countries mei groupby kaarna hey)
-- Employee table to refer names.

use chinook;

select * from employee;

select * from customer;

select * from employee;

desc customer;

select  
  country, 
  sum( if(supportrepid=3,1,0 ) ) as 'peacock', 
  sum( if(supportrepid=4,1,0 ) ) as 'park', 
  sum( if(supportrepid=5,1,0 ) )   as 'johnson' 
from customer 
group by country; 



/*2.Display a pivot table for the sum of sale amount for each year over different quarters.								[5 marks]
*/-- invoice table used 

create table imp1 as select year(invoicedate) as year,month(invoicedate) as month ,sum(total) over(order by month(invoicedate)) as sum from invoice;
select year,
sum( if( month=1 or month=2 or month=3 , sum, 0 ) ) as 'quarter1',
sum( if( month=4 or month=5 or month=6 , sum, 0 ) ) as 'quarter2',
sum( if( month=7 or month=8 or month=9 , sum, 0 ) ) as 'quarter3',
sum( if( month=10 or month=11 or month=12 , sum, 0 ) ) as 'quarter4'
from imp1 group by year;

select * from invoice;





/*3.Create 3 users and 2 roles and assign those roles to users. 			[5 marks]
show grants for all 3 users and drop a roleand drop a user*/

CREATE USER Chinmay@localhost IDENTIFIED BY '12345';
CREATE USER Trapti@localhost IDENTIFIED BY '67891';
CREATE USER Gayatri@localhost IDENTIFIED BY '23459';

CREATE ROLE role1, role2;
GRANT ALL ON chinook.* TO role1;
GRANT INSERT, DELETE ON chinook.* TO role2;

GRANT  role1, role2 TO Chinmay@localhost, Trapti@localhost, Gayatri@localhost;
show grants for Chinmay@localhost;
show grants for Trapti@localhost;
show grants for Gayatri@localhost;
DROP ROLE role1;
drop user Gayatri@localhost;



/*4. Display the total sale in a month, avg sale in a month, highest sale in a month and highest sale in the year for each month-year value
-- invoice table									window functions																		[5 marks]
*/
select * from invoice;


select EXTRACT(year FROM InvoiceDate), EXTRACT(MONTH FROM InvoiceDate),
sum(total) over(partition by EXTRACT(MONTH FROM InvoiceDate)) as 'Total Sale in month',
avg(total) over(partition by EXTRACT(MONTH FROM InvoiceDate)) as 'Average Sale in month' ,
FIRST_VALUE(total) over(partition by EXTRACT(MONTH FROM InvoiceDate) order by total desc) as 'Highest Sale in Month',
FIRST_VALUE(total) over(partition by EXTRACT(YEAR_MONTH FROM InvoiceDate) order by total desc) as 'Highest Sale in month_year'
from invoice order by EXTRACT(YEAR FROM InvoiceDate), EXTRACT(month FROM InvoiceDate);


SELECT 
	DISTINCT YEAR(DATE(InvoiceDate)) as year, 
    MONTH(DATE(InvoiceDate)) as month,
    sum(total) over(partition by MONTH(DATE(InvoiceDate))) as month_Total_Sale,
    avg(total) over(partition by MONTH(DATE(InvoiceDate))) as month_Avg_Sale,
    max(total) over(partition by MONTH(DATE(InvoiceDate))) as month_Max_Sale,
    max(total) over(partition by YEAR(DATE(InvoiceDate))) as year_Max_Sale 
	FROM invoice ;




/*5. Create a simple procedure that takes in the customerid and returns the total bill incurred by the customer. 					[5 marks]
*/ -- Procedure customer id as input and totalbill as output
  -- invoice table used

create procedure bill(in id int)
select sum(total)from invoice where customerid=id ;
call bill(4);

/*6.Write a query that displays names of all the tracks and the length(long, medium or short) based on the average of all track lengths:
long: if track length is 1 minute greater than average 
medium:less than long but greater then average track length
short: less than average track length 																						[10 marks]
*/-- Track table used
USE `Chinook`;
SELECT Milliseconds/60000 as Minute,
CASE
    WHEN ((select avg(Milliseconds/60000) from track) + 1 < Milliseconds/60000)  THEN 'This is long track'
    WHEN (((select avg(Milliseconds/60000) from track)+ 1 > Milliseconds/60000) and ((select avg(Milliseconds/60000)from track) < Milliseconds/60000)) THEN 'This is medium track'
    WHEN ((select avg(Milliseconds/60000) from track) > Milliseconds/60000)  THEN 'This is short track'
    ELSE 'Not mensioned'
END AS track_lengths from track;



/*7. Write a function to print the factorial of a number.                                         [5 marks]
*/-- 
SET GLOBAL log_bin_trust_function_creators = 1;


delimiter $$
create function factorial(n int) returns int
begin
declare done boolean default 0;
declare fact int default 1;
repeat
set fact=fact*n;
set n=n-1;
if n=1 then set done=1;end if;
until done end repeat;
return fact;
end;
$$ delimiter ;

select factorial(5);

select factorial(10);


#8. Create a trigger for the Sakila database, that stores in the log the original name,           [5 marks]
# new name and time of update, when a customer name is updated.

use sakila;

create table customer1_info
(
cust_id int auto_increment primary key,
new_name varchar(70) not null,
old_name varchar(70) not null,
time_of_update datetime default null
);

create trigger customer_creater
after update on customer for each row
insert into customer1_info
      set old_name=old.first_name,
      new_name=new.first_name,
      time_of_update=now();
      
select * from customer;

update customer set first_name='CHINMAY' where customer_id=1;

select * from customer1_info;
      


