use movies;

desc language;

-- whenever you have auto incremented as one column, you should not enter the values in that column.--
insert 
into 
language(name)
values('English'),('Hindi'),('Marathi'),('Tamil'),('Kannada');

desc actor;

insert
into
actor(actor_id,first_name,last_name,city)
values(5,'SARANG','BAGUL','NASHIK');

SHOW STATUS LIKE 'last_query_cost' 

select * from actor;
 
select * from language;

select * from contact;
SHOW STATUS LIKE 'last_query_cost' ;


Select * from countries ;

desc countries;

insert
into
countries
values(111,'INDIA'),(112,'UK'),(113,'US'),(114,'IRAN'),(115,'CANADA');

desc films;

insert 
into 
films
values(101,'Zero',2018,2,120,'B'),(102,'Run',2004,2,100,'A'),(103,'Duniyadari',2013,3,120,'A'),(104,'War',2019,2,140,'B'),(105,'Gag',2006,1,78,'B');

select * from films;

##Delete from contact;
##SHOW STATUS LIKE 'last_query_cost'

desc film_category;

alter table film_category add name varchar(20);

insert
into
film_category
values(111,103,'ROMANCE'),(112,101,'Action'),(113,102,'Action'),(114,104,'Action'),(115,105,'Comedy');


desc staff;

insert
into
staff
values(1125,'RAM','Chennai',7,False,'2018/09/30', 6000.32);

select * from staff;

desc customer;

insert
into
customer(id,first_name,last_name)
values (11,'SAGAR','BEHERE'),(12,'CHINMAY','BHAT'),(13,'SAMEER','THORAT'),(14,'KAUSTUBHA','BAMBARKAR');
 
 
 select * from customer;
 
 desc contact;
 
 insert
 into
 contact
 values(101,13,'Goodwin'),(102,14,'XYZCust'),(103,11,'AvgCust');
 
 select * from contact;
 
 desc countries;

select * from countries;

insert into countries(country_id) values(116),(117);

select * from customer; 

select * from contact;

update customer set id=15 where id=11; ## as we have declared on delete cascade, on update cascade on customer table,it will be reflected in a contact table as well.
## if you are getting safe update then write following query
## set sql_safe_updates=0;
delete from customer where id=13; 

select * from customer;
select * from contact;


create table persons
(
ID int not null auto_increment,
last_name varchar(255) not null,
first_name varchar(255),
primary key(ID)
)
auto_increment=100;

##Drop table persons;

desc persons;

select * from persons;

insert
into
persons(last_name,first_name)
values('BHAT','CHINMAY'),('LIMAYE','ABHISHEK');



insert 
into
persons(first_name,last_name)
values('SACHIN','BADAPURE'),('KAMAL','SHAH');

select * from persons;

create table employee
(
emp_id int,
date_joined date
);

insert 
into 
employee(emp_id,date_joined)
values(1,'2019-02-11');

select * from employee;

select date_format(date_joined,'%d-%m-%Y') from employee;


create table students
(
id int primary key auto_increment,
class varchar(20),
marks_social_science int,
marks_science int,
marks_maths int
);

desc students;
truncate students ;

insert
into
students(id , class,marks_social_science,marks_science,marks_maths)
values(1 ,'F', 90,100,80);

select * from students;

insert
into
students(id , class,marks_social_science,marks_science,marks_maths)
values(1 , 'm', 70,70,66)
on duplicate key update 
class=values(class), marks_social_science=values(marks_social_science), marks_science=values(marks_science),marks_maths=values(marks_maths);

delete from students where id=03;

select * from students;


insert 
into
students(class,marks_social_science,marks_science,marks_maths)
values('S');

insert 
into
students(class,marks_social_science,marks_science,marks_maths)
values('F',85,65,75);

##truncate table students;


insert 
into
students(class,marks_social_science,marks_science,marks_maths)
values('S',48,55,70)
on duplicate key update 
class=values(class),
marks_social_science=values(marks_social_science),
marks_science=values(marks_science),
marks_maths=values(marks_maths);

select * from students ;