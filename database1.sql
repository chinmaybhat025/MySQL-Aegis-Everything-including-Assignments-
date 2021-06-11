CREATE DATABASE ORG;

USE ORG;

CREATE TABLE Worker (
	WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	FIRST_NAME CHAR(25),
	LAST_NAME CHAR(25),
	SALARY INT(15),
	JOINING_DATE DATETIME,
	DEPARTMENT CHAR(25)
);

INSERT INTO Worker 
	(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		(001, 'Monika', 'Arora', 100000, '14-02-20 09.00.00', 'HR'),
		(002, 'Niharika', 'Verma', 80000, '14-06-11 09.00.00', 'Admin'),
		(003, 'Vishal', 'Singhal', 300000, '14-02-20 09.00.00', 'HR'),
		(004, 'Amitabh', 'Singh', 500000, '14-02-20 09.00.00', 'Admin'),
		(005, 'Vivek', 'Bhati', 500000, '14-06-11 09.00.00', 'Admin'),
		(006, 'Vipul', 'Diwan', 200000, '14-06-11 09.00.00', 'Account'),
		(007, 'Satish', 'Kumar', 75000, '14-01-20 09.00.00', 'Account'),
		(008, 'Geetika', 'Chauhan', 90000, '14-04-11 09.00.00', 'Admin');

CREATE TABLE Bonus (
	WORKER_REF_ID INT,
	BONUS_AMOUNT INT(10),
	BONUS_DATE DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Bonus 
	(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
		(001, 5000, '16-02-20'),
		(002, 3000, '16-06-11'),
		(003, 4000, '16-02-20'),
		(001, 4500, '16-02-20'),
		(002, 3500, '16-06-11');
CREATE TABLE Title (
	WORKER_REF_ID INT,
	WORKER_TITLE CHAR(25),
	AFFECTED_FROM DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Title 
	(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
 (001, 'Manager', '2016-02-20 00:00:00'),
 (002, 'Executive', '2016-06-11 00:00:00'),
 (008, 'Executive', '2016-06-11 00:00:00'),
 (005, 'Manager', '2016-06-11 00:00:00'),
 (004, 'Asst. Manager', '2016-06-11 00:00:00'),
 (007, 'Executive', '2016-06-11 00:00:00'),
 (006, 'Lead', '2016-06-11 00:00:00'),
 (003, 'Lead', '2016-06-11 00:00:00');
 
 
 #On the tables of the org database, perform queries to solve the following questions: [10*1=10]
 #1.Write An SQL Query To Fetch The Departments That Have Less Than Five People In It.(Worker)
 use org;
 select * from worker;
 select department,count(*)
 from worker
 group by department
 having count(*)<5;
 
 #2. Write An SQL Query To Print The First Three Characters Of  FIRST_NAME From Worker Table.
 select substring(FIRST_NAME,1,3) from worker;
 
 #3. Write An SQL Query To Print The DEPARTMENT From Worker Table After Removing White Spaces From The Left Side.
 ##select * from worker;
 
 SELECT TRIM(LEADING ' ' FROM DEPARTMENT) from worker;
 

 
 #4.Write An SQL Query That Fetches The Unique Values Of DEPARTMENT From Worker Table And Prints Its Length.
 ##select * from worker;
 
 select count(distinct(department)) from worker;
 
 
 #5.Write An SQL Query To Print The FIRST_NAME And LAST_NAME From Worker Table Into A Single Column COMPLETE_NAME. 
 #A Space Char Should Separate Them.
 ##select * from worker;
 
 select concat(first_name,' ',last_name) as complete_name from worker;
 
 
 #6.Write An SQL Query To Print All Worker Details From The Worker Table Order By FIRST_NAME Ascending And DEPARTMENT Descending.
select * from worker order by first_name,department;
 
 #7.Write An SQL Query To Print Details Of The Workers Whose FIRST_NAME Contains ‘A’.
select * from worker where first_name like 'A%';
 
 #8.Write An SQL Query To Print Details Of The Workers Who Have Joined In Feb’2014.
select * from worker where joining_date='2014-02-20 09:00:00';
 
 #9.Write An SQL Query To Fetch The Count Of Employees Working In The Department ‘Admin’.
 ##select * from worker;
 select  first_name,last_name ,count(*) from worker where department='Admin';
 
 
 #10.Write An SQL Query To Print Details Of Workers Excluding First Names, “Vipul” And “Satish” From Worker Table.
 ##select * from worker;
 
 select * from worker where first_name not in('Vipul','Satish');
 
 
 
 