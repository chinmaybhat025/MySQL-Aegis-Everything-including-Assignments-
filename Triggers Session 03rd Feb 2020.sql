-- Triggers are always associated with Permanent tables.
-- It cannot be used with temporary tables.
-- Once the schema has been dropped the triggers has been dropped.

-- New and Old alias.
use org;

-- Create Before Insert Trigger in SQL -- 
create table Stu_Table
(
stu_Id int,
stu_Name varchar(15),
sub1 int,
sub2 int,
sub3 int,
sub4 int,
sub5 int,
total int,
per float,
status varchar(15)
);

select * from stu_Table;

delimiter $$
create trigger stu_insert
before insert on stu_table for each row
begin
      set new.total=new.sub1+new.sub2+new.sub3+new.sub4+new.sub5;
      set new.per=new.total/5;
      if new.per<33 then
           set new.status="fail";
	  elseif new.per>=33 and new.per<=45 then
		   set new.status="3rd Div";
	  elseif new.per>=45 and new.per<60 then
           set new.status="2nd Div";
	  else
           set new.status="1st Div";
	  end if;
END $$
delimiter ;

insert into stu_table (stu_id,stu_name,sub1,sub2,sub3,sub4,sub5) 
values(1,'Ashish',6,6,6,6,6),
(2,'Bobby',33,33,33,33,40),
(3,'Chetan',45,45,45,45,50),
(4,'Divya',67,67,67,67,67);

select * from stu_table;


-- 2)
create table stud_table1
(
stu_id int,
stu_Name varchar(15),
stu_Class int
);


create table stu_log
(
user_id varchar(15),
description varchar(100)
);

delimiter $$
   create trigger stu_insert2
   after insert on stud_table1 for each row
BEGIN
   insert into stu_log(user_id,description) values(user(),concat('Insert Student record',new.stu_id,'',new.stu_name,'',new.stu_class));
END $$
delimiter ;   



insert into stud_table1 values(1,'Komal',10),(2,'Ajay',10),(3,'Santosh',10),(4,'Rakesh',10),(5,'Bhau',10);

select * from stu_log;

select * from stud_table1;




-- 3)
Create table employee
(
id int,
first_name varchar(30),
last_name varchar(15),
start_date DATE,
end_date DATE,
city varchar(10),
description varchar(15)
);

insert 
into 
employee 
values(01,'Girish','Tiwari','20081225','20100625','Nainital','Programmer'),(02,'Komal','Choudhary','20071122','20100421','Meerut','Programmer'),(03,'Mahendra','Singh','20061012','20070512','Lucknow','Programmer');


select * from employee;

create table employee_log
(
user_id varchar(15),
description varchar(100)
);

select * from employee_log;


delimiter $$
create trigger employee_trigger
after update on employee
for each row
BEGIN
   insert into employee_log
   (user_id,description)values(user(),concat('Id with',NEW.id,'is modified','from', OLD.start_date,'to',NEW.start_date));
   
END $$
delimiter ;

-- set sql_safe_updates=0;

update employee set start_date='20061231';

update employee set start_date='20071111' where id=1;

select * from employee_log;

-- 4)
create table emp
(
id int,
first_name varchar(30),
last_name varchar(15),
start_date DATE,
end_date DATE,
city varchar(10),
description varchar(15)
);


insert 
into 
emp 
values(01,'Girish','Tewari','20081225','20100625','Nainital','Programmer'),(02,'Komal','Choudhary','20071122','20100421','Meerut','Programmer'),(03,'Mahendra','Singh','20061012','20070512','Lucknow','Programmer'),(04,'Amit','Kumar','20081225','20101203','Lucknow','Programmer');

select * from emp;

create table emp_log
(
id int,
first_name varchar(50),
last_name varchar(50),
start_date date,
end_date date,
city varchar(50),
description varchar(50),
lastinserted time
);

select * from emp_log;

delimiter $$
create trigger emp_trigger
after delete ON emp
for each row
begin
insert into emp_log values(old.id,old.first_name,old.last_name,old.start_date,old.end_date,old.city,old.description,curtime());
END $$
delimiter ;

delete from emp where id=4;

select * from emp_log;

-- alter trigger is not possible.

-- triggers in the current database.--
-- 1)
show triggers;

-- 2)
show triggers like '%stu_table%';

-- 3) by giving database name and trigger name###
select * from information_schema.triggers where trigger_schema='org' and trigger_name='stu_insert';

-- All triggers from a particular db--
select * from information_schema.triggers where trigger_schema='org';

-- All triggers associated with particular table-- 
select * from information_schema.triggers where trigger_schema='org' and event_object_table='emp';

-- trigger from database--
show triggers from org;


 
   




