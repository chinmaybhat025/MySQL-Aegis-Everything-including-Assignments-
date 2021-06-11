create table students_1
(
id int primary key auto_increment,
class varchar(20),
marks_social_science int,
marks_science int,
marks_maths int
);

desc students;

select * from students_1;

## Inserting the single row
insert
into
students_1(id , class,marks_social_science,marks_science,marks_maths)
values(1 ,'F', 90,100,80);

## Updating the value as belows
insert
into
students_1(id , class,marks_social_science,marks_science,marks_maths)
values(1 , 'd', 60,50,40)
on duplicate key update
class=values(class), 
marks_social_science=values(marks_social_science),
marks_science=values(marks_science),
marks_maths=values(marks_maths);

## query has been executed successfully, but when i fire below select query it is showing non updated data only.


select * from students_1;