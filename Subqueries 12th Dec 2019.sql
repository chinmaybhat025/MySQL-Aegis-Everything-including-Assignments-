
use joins_and_subqueries;

create table employee1
(
employee_id int unique key,
name varchar(15),
age int,
location varchar(20),
dob date
);

insert into employee1 values(11,'Samit',30,'Mumbai','1987/08/31'),(13,'Aarya',32,'Bandra','1987/02/16'),(14,'Saanvi',27,'Coorg','1990/10/21'),(12,'Sushant',35,'Banglore','1985/05/09');

create table employee_bkp
(
employee_id int unique key,
name varchar(15),
age int,
location varchar(20),
dob date
);


-- insert the values in employee1 into the backup table using select.
insert into employee_bkp select * from employee1 limit 2;
-- Truncate table employee_bkp;

select * from employee_bkp;

create table employee_bkp2 select * from employee1;

select * from employee1;

-- Scalar Subqueries--
select * from employee1 where age=(select max(age) from employee1);

select * from employee1 where age=35;



select * from employee1 where age !=(select min(age) from employee1);


select * from employee1 where name =(select name from employee_bkp where employee_id=11);


select * from employee1 where employee_id not in(select employee_id from employee_bkp);


create table Products1
(
ProdID int primary key,
ProdName varchar(30),
Price int
);

create table OrderDetails
(
OrderDetailID int primary key,
ProdID int,
OrderID int,
Quantity int,
foreign key(ProdID) references Products1(ProdID)
);


insert into Products1 values
(1,'Syrup',18),
(2,'flaxseeds',19),
(3,'Protinex',10),
(4,'Chais',22),
(5,'Turmeric',23);

insert into OrderDetails values
(1,1,17,12),(2,2,17,10),(3,3,17,5),(4,4,18,9),(5,5,18,40),(6,5,20,10),(7,3,21,10),(8,2,25,101);

select * from Products1;
select * from OrderDetails;


select ProdName from Products1 where ProdID in (select ProdID from OrderDetails where Quantity=10);

select ProdName from Products1 where ProdID=(select ProdID from OrderDetails where Quantity>99);


create table shoes
(
id char(10) primary key,
brand char(20) not null,
type char(250) not null,
color char(250) not null,
price decimal(6,2) not null,
desce varchar(750) null
);


insert into shoes(id, brand,type,color,price,desce) values
('15699','Prada','Wedges','Beige',1500.99,'Classy'),
('15644','Prada','Peep-toes','Beige',1500.99,'Classy'),
('86752','Hush_puppies','Sandals','brown',2320.50,'best_shoes'),
('76982','Reebok','Ankle_boots','black',3650.00,'comfortable'),
('15623','Gucci','Peep-toes','Beige',1000.99,'Elegance'),
('86767','Hush_puppies','Loafers','red',2620.50,'best_shoes'),
('76945','Reebok','gladiators','blue',2450.00,'comfortable');

create table shoe_bkp as select * from shoes;

select * from shoe_bkp;
select * from shoes;

select * from shoes where (type,color)=(select type,color  from shoe_bkp where brand='Gucci');



insert into Products1 values(6,'Milk',21);
delete from orderdetails where prodid=4;
select * from products1;
select * from orderdetails;


select * from products1 where exists (select * from orderdetails where products1.ProdID=orderdetails.ProdID);


select * from products1 where exists (select 1 from orderdetails where products1.ProdID=orderdetails.ProdID);

select * from products1 where not exists (select * from orderdetails where products1.ProdID=orderdetails.ProdID);



-- Derived Tables--
select prodid,sum(quantity) from OrderDetails group by prodid having sum(quantity)=(select max(sum_column) from (select sum(quantity) as sum_column from orderdetails group by prodid) as t1);










