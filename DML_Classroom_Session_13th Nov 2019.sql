use movies;

create table marks
(
ID int,
name varchar(10),
marks1 int,
marks2 int
);

desc marks;

select * from marks;

-- loading the data file
load data infile "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Marks.txt"
into table marks
fields terminated by ',';

create table t1
(
s1 int,
s2 char(5) Not null
);

insert into t1 values(100,'abcde'),('200','CDFER');

select * from t1;

select s2 into @x from t1 where s1=100;

select @x;


create table test_table
(
a int,
b int
);

insert into test_table values(1,2),(2,3),(3,4);

select a,b,a+b into outfile
'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/result.txt'
FIELDS terminated by ',' optionally enclosed by ""LINES terminated by '\n'
from test_table;

select a,b,a+b into dumpfile
'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/result2.txt'
from test_table limit 1;

-- Data Retrieval Language(DRL)--
use movies;

desc actor;

select first_name,last_name,actor_id,city from actor;

select actor.* from actor;

select * from actor;

select 50+65;

select 50-65;

select 540/20;

select 100-63 as sub;

select current_date,current_time();

select * from information_schema.columns where table_schema='movies';

select actor_id as ID, first_name as FN,last_name as LN from actor;


###### String Functions######
select ASCII('hello'); #Return numeric value of left-most character

select BIN(5);#Return a string containing binary representation of a number

select CHAR(97);#Return the character for each integer passed(ASCII value)

select CHAR_LENGTH('hello');#/CHARACTER_LENGTH()	Return number of characters in argument

select CONCAT('hi',' there');#Return concatenated string

select CONCAT_WS('+','hi','there');	#Return concatenate with separator

SELECT elt(2,'hello','there','hello','you'); #Return string at index number

select FIELD('hello', 'there','you','hello');#Return the index (position) of the first argument in the subsequent arguments.

select find_in_set('hello','there,you,hello'); #Return the index position of the first argument within the second argument

select find_in_set('CHINMAY','there,you,hello'); #Return the index position of the first argument within the second argument

select find_in_set('','there,you,hello'); #Return the index position of the first argument within the second argument

select FORMAT(45,4);#Return a number formatted to specified number of decimal places.

SELECT INSERT('Quadratic', 3, 4, 'What');	#Insert a substring at the specified position up to the specified number of characters.

SELECT INSTR('foobarbar', 'bar');#Return the index of the first occurrence of substring

SELECT LEFT('foobarbar', 5);#Return the leftmost number of characters as specified

SELECT LOCATE('bar', 'foobarbar'); #LOCATE()/POSITION()	#Return the position of the first occurrence of substring

SELECT LOWER('QUADRATICALLY');	#Return the argument in lowercase

SELECT LPAD('hi',5,'?');#Return the string argument, left-padded with the specified string

SELECT LTRIM('  barbar');	#Remove leading spaces

SELECT ORD('app');	#Return character code for leftmost character of the argument

SELECT REPEAT('MySQL', 3);	#Repeat a string the specified number of times.

SELECT REPLACE('www.mysql.com', 'w', 'Ww');	#Replace occurrences of a specified string



SELECT REVERSE('abc');	#Reverse the characters in a string


SELECT RIGHT('foobarbar', 4);	#Return the specified rightmost number of characters


SELECT RPAD('hi',5,'?');	#Append string the specified number of times


SELECT RPAD('hi',3,'?');


SELECT RTRIM('barbar   ');	#Remove trailing spaces


SELECT SPACE(6);	#Return a string of the specified number of spaces


SELECT STRCMP('text', 'text');	#Compare two strings STRCMP() returns 0 if the strings are the same, -1 if the first argument is smaller than the second according to the current sort order, and 1 otherwis

SELECT SUBSTRING('Sakila' FROM -4 FOR 2);	#Return the substring as specified


SELECT SUBSTRING('foobarbar' FROM 4);


SELECT SUBSTRING('Quadratically',5);


SELECT SUBSTRING('Quadratically',5,6);


SELECT SUBSTRING('Sakila', -3);


SELECT SUBSTRING('Sakila', -5, 3);


SELECT SUBSTRING_INDEX('www.mysql.com', '.', 2);#Return a substring from a string before the specified number of occurrences of the delimiter


SELECT SUBSTRING_INDEX('www.mysql.com', '.', -2); 

#If count is negative, everything to the right of the final delimiter (counting from the right) is returned. SUBSTRING_INDEX() performs a case-sensitive match when searching for delim.


SELECT TRIM('  bar   ');


SELECT TRIM(LEADING 'x' FROM 'xxxbarxxx');


SELECT TRIM(BOTH 'x' FROM 'xxxbarxxx');


SELECT TRIM(TRAILING 'xyz' FROM 'barxxyz');
 #Remove leading and trailing spaces


SELECT UPPER('Hej');#UPPER()/UCASE()	
#Convert to uppercase


select 2+3 as sum;


select isnull(null);

