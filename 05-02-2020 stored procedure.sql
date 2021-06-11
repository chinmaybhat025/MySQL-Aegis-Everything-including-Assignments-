use org;
-- procedure -----------------------------------------------------------------------------------------------------
-- print hello world 

create procedure p1()
select 'hello world' as output ; -- output is column name 

call p1() ;
-- or 
call p1 ;

-- create procedure to select all rows from  table stu_table
select * from stu_table ;

create procedure liststudents()
select * from stu_table ;

call liststudents();

drop procedure liststudents ;

create procedure liststudents()
select stu_id , stu_name from stu_table ;

call liststudents();

-- create a procedure with your name as parameter and print hello with your name 
create procedure hello_name(in MYname varchar(30))
 select CONCAT('hello', ' ',MYname) as greeting ;
 
 call hello_name('sanket');

-- create a procedure that uses in parameter in select  where clause 
create procedure student_details(in MYname varchar(30))
 select * from stu_table where stu_name = Myname ;
 
 call student_details('sanket') ;
 
 -- create a procedure that uses 2 in parameter 
create procedure say_something(in MYname varchar(30) , in phrase varchar(30))
 select CONCAT(phrase , ' ' , MYname) as output ;
 
 call say_something('sanket' , 'wassup !!!') ;
 
 -- create a procedure that uses in parameter in select  where clause  finding the details of student using student id 
 create procedure student_details_by_id(in id int)
 select * from stu_table where stu_id = id ;
 
 call student_details_by_id(1) ;
 
 -- create a procedure takes integer and display if positive or negative or zero 
 drop procedure sign;
 delimiter $$
 create procedure sign(num int)
 begin 
 if num > 0 then
 select 'posivtive number' as output ;
 elseif num < 0 then 
 select 'negative number' as output ;
 else
 select 'zero' as output ;
 end if;
 end $$
 delimiter ;
 
 call sign(-3) ;
 call sign(9) ;
 call sign(0);
 
 
 -- create a procedure to make calculator 
delimiter $$
 create procedure calc (in num1 int , in num2 int , out sum int , out product int , inout inc int)
 begin 
 set sum = num1 + num2 ;
 set product = num1 * num2 ;
 set inc = inc+1 ;
 end $$
 delimiter ;
 
 set @i = 50 ;
 call calc(4,5,@sum,@product,@i) ;
 
 select @sum ;
 select @product ;
 select @i;
 
-- create a procedure to show case statement 
delimiter $$
create procedure digi_name (in num1 int )
begin 
declare result varchar(30) ;
case num1
when 0 then set result = 'zero';
when 1 then set result = 'one' ;
when 2 then set result = 'two' ;
when 3 then set result = 'three' ;
when 4 then set result = 'four' ;
when 5 then set result = 'five' ;
when 6 then set result = 'six' ;
when 7 then set result = 'seven' ;
when 8 then set result = 'eight' ;
when 9 then set result = 'nine' ;
when 10 then set result = 'ten' ;
end case ;
select concat(result , ' is the name of the digit ' , num1) as name ; 
end $$
delimiter ;
drop procedure digi_name ;
call digi_name(4);

-- functions --------------------------------------------------------------------------------------------------------
set global log_bin_trust_function_creators = 1 ;

create function hello_world () returns text
return 'hello world ' ;
select hello_world() as output;

drop function hello_world ;

create function hello_world () returns text
return 'hello world this is sanket ' ;
select hello_world() as output;


-- create function that cost as input and return tax 
delimiter $$
create function cost (cost decimal(10,2)) returns decimal 
begin 
declare tax decimal(10,2) ;
set tax = cost * 0.05 ;
return tax;
end $$
delimiter ;

select cost(1200);

