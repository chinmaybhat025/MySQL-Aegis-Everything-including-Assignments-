use sakila;

select * from country;


delimiter $$
create trigger after_insert
after update on country for each row
BEGIN
   insert into country(country_id,country) values(user(),concat('Insert Student record',old.country_id,'',new.country,'',new.last_update=now()));
END $$
delimiter ;   

set sql_safe_updates=0;
update country set country='xxz' where last_update=now();

select * from country;



create table xyz (u int,val varchar(100));
insert into xyz values (1,'Apple,Mango,Plum'),(2,'Apple,Mango');

select * from xyz;

desc xyz;

Drop table xyz_1nf;

create table xyz_1nf (u int,val varchar(100)) as 
SELECT distinct u ,SUBSTRING_INDEX(SUBSTRING_INDEX(t.val, ',', n.n), ',', -1) val
FROM xyz t CROSS JOIN 
(SELECT 1 as n UNION ALL SELECT 2 UNION ALL SELECT 3) n
order by u;

select * from xyz_1nf;

