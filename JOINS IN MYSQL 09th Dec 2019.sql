-- till 32 levels you able to perform the subqueries--
-- subqueries returning single row multiple columns=row subquery--
 -- subqueries returning multiple row with single columns=column subquery--
 -- subqueries returning the table data(i.e.Multiple row and Multiple Columns)=table subquery--
 -- subqueries returning the single value=Scalar subquery--
 -- references column to the outer query=Correlated Subqueries
 -- Any operator works like your 'OR' operator.
 -- All operator works like your 'AND' operator.
 -- My SQL Does not support "FULL Outer Join" Keyword so we use "UNION" and "UNION ALL".
 
 create database JOINS_AND_SUBQUERIES;
 use JOINS_AND_SUBQUERIES;
 
 create table geography
 (
 id int primary key auto_increment,
 store_name varchar(30) unique key,
 region_name varchar(10)
 );
 
 insert into geography(store_name,region_name) values('Boston','East'),('New York','East'),('Los Angeles','West'),('San Diego','West');
 
 select * from geography;
 
 create table store_sales
 (
 sale_id int primary key,
 store_name varchar(30),
 sales int,
 txn_date date,
 foreign key(store_name) references geography(store_name)
 );
 
 insert into store_sales values(101,'Los Angeles',1500,'19990105'),(102,'San Diego',250,'19990107'),(103,'Los Angeles',300,'19990108'),(104,'Boston',700,'19990108');
 -- yyyymmdd
 select * from store_sales;
 
 -- INNER JOIN/CROSS JOIN/JOIN
 select * from geography cross join store_sales;
 
 
 select * from geography join store_sales;
 
 select * from geography inner join store_sales;
 
 select * from geography;
 select * from store_sales;
 
 
 
 select * from geography inner join store_sales using(store_name);
 -- when you have at least one column(i.e.column names is same in both the tables on which joins are applied.)
 
 select * from geography A inner join store_sales B on A.store_name=B.store_name;
 -- columns name are different in both the tables but having some common data, then we write join query as above.
 
 -- LEFT JOIN
 select * from geography left join store_sales using(store_name);
 
 -- LEFT OUTER JOIN
 select * from geography left outer join store_sales using(store_name);
 
 -- RIGHT JOIN
 select * from geography right join store_sales using(store_name);
 -- RIGHT OUTER JOIN
 select * from geography right outer join store_sales using(store_name);
 
 -- NATURAL JOIN
 select * from geography natural inner join store_sales;
 
 select * from geography natural left join store_sales;
 
 select * from geography natural right join store_sales;
 -- when you need to perform natural join no need to give any conditions.
 
 create table ss1 as  select * from store_sales;
 
 select * from ss1;
 select * from store_sales;
 
 desc ss1;
 
 desc store_sales;
 
 select * from ss1;
 
 
 --
 select 
 * from store_sales
 right join geography using(store_name)
 right join ss1
 on ss1.store_name=geography.store_name
 where ss1.sales<1500;-- Table_name.column_name
 
 -- which region and store
 select * from geography;
 select * from store_sales;
 
 -- sales which having region and stores greater than 1000.
 select region_name,store_name from geography A natural join store_sales B where B.sales>1000;
 
 -- which region and sales did not have sales ??
 select store_name from geography left join store_sales using (store_name) 
 where sale_id is null ;
 
 select * from store_sales ;
 -- insert into geography (store_name , region_name)values ('Las vegas' , 'west');
 -- insert into store_sales(sale_id,store_name) values(106,'Las vegas');
 
 
 
 -- Joining the table with itself--
 select * from store_sales;
 
 alter table store_sales add column payment_date date;
 desc store_sales;
 insert into store_sales values
 (101,'Los Angeles',1500,'19990105','19990106'),
 (102,'San Diego',250,'19990107','19990107'),
 (103,'Los Angeles',300,'19990108','19990110'),
 (104,'Boston',700,'19990108','19990106')
 on duplicate key update payment_date=values(payment_date);
 
 select * from store_sales;
 
 -- which day has shown payment made same as on transaction date.
 select * from store_sales A natural join store_sales B where A.txn_date=B.payment_date;
 
 -- Alternative way
 select * from store_sales A ,store_sales B where A.txn_date=B.payment_date;
 

 
 select * from store_sales;
 
 select * from store_sales A natural join store_sales B where A.payment_date-B.txn_date=1;
 
 select * from store_sales;
 
 select *, max(b.payment_date-a.txn_date) as difference
 from store_sales a natural join store_sales b;
 
 select * from geography;
 select * from store_sales;
 
 select a.region_name,max(b.sales)
 from geography a natural join store_sales b
 where b.sales=(select max(b.sales) from store_sales) group by region_name;
 
 
 --
  select a.region_name,sum(b.sales)
 from geography a natural join store_sales b
 where b.sales=(select sum(b.sales) from store_sales) group by region_name;
 
 -- 
 select sum(b.sales),a.region_name from geography a natural join store_sales b group by a.region_name;
 
 select * from store_sales;
 
 
 
 
use dp1801;

select eid,salary from employee where (eid%2)=0;



 
 
 
 
 
 
 
 
 
 
 
 
 