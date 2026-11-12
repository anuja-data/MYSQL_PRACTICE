Drop database college;
Create database college;
show databases;

use college;
create table Employees(EmpID int, FirstName varchar(50),LastName varchar (50),Age int, Empzone varchar(50));
desc Employees;

insert into Employees values(104,"Anuja","Patil",21,"South");

insert into Employees(EmpID,FirstName,LastName,Age,Empzone) 
values(101,'ANUJAa','BAPUNWAR',20,'NORTH'),
	   (102,'PRIYA','PADALWAR',21,'SOUTH'),
       (103,'NANDINI','BATTUL',22,'EAST'),
       (104,'TANVI','JOSHI',23,NULL);
       
select*from Employees;

update Employees set Empzone='NORTH' where EmpID=103;

Drop table Employees;

Delete from Employees where EmpID=103;
update Employees set Age = 28 where EmpID=104;

---------------------------------------------------------------------------------------------------------------------------------------

Create Database Company_DB;
USE Company_DB;
SHOW DATABASES;
CREATE TABLE EMPLOYEE(EmpID int NOT NULL, FirstName varchar(50),LastName varchar (50),Age int);

DESC EMPLOYEE;

-- LETS INSERT THE RECORDS--
INSERT INTO EMPLOYEE VALUES(NULL,'RAVI','PAWAR',25); -- WILL SHOW ERROR--

INSERT INTO EMPLOYEE VALUES(NULL,'RAVI','PAWAR',25); 

CREATE TABLE EMPLOYEE1(EmpID int NOT NULL, FirstName varchar(50),LastName varchar (50),unique(EmpID));

insert into EMPLOYEE1 VALUES(NULL,'RAVI','PAWAR');
INSERT INTO EMPLOYEE1 VALUES(1,'RAVI','PAWAR');
SELECT * FROM EMPLOYEE1;

INSERT INTO EMPLOYEE1 VALUES(1,'RAVI','PAWAR'); -- DUPLICATE ENTRY WILL BE DETECTED--

-- CHECK CONSTRAINT WHILE CREATING TABLE --

CREATE TABLE EMPLOYEE2(EmpID int NOT NULL, FirstName varchar(50),LastName varchar (50),EmpAge int, Check(EmpAge>20));
INSERT INTO EMPLOYEE2 VALUES(1,'XYZ','ABC',12); -- AGE IS NOT VALID-- -- WILL CHECK AGE--
INSERT INTO EMPLOYEE2 VALUES(2,'DEF','GHI',21);

ALTER TABLE EMPLOYEE2 ADD SALARY INT;

ALTER TABLE EMPLOYEE2 DROP SALARY;

-- APPLY CHECK CONSTRAINT TO SALARY COLUMN --
ALTER TABLE EMPLOYEE2 ADD COLUMN SALARY INT, ADD CHECK(SALARY>=5000);
DESC EMPLOYEE2;

INSERT INTO EMPLOYEE2 VALUES(5,'DXY','GSY',28,10000);
INSERT INTO EMPLOYEE2 VALUES(2,'DEFG','SGHI',26,700);

SHOW CREATE TABLE EMPLOYEE2;
SELECT * FROM EMPLOYEE2;

ALTER TABLE EMPLOYEE2 DROP CHECK employee2_chk_2;


CREATE TABLE EMPLOYEE3(EmpID int NOT NULL, FirstName varchar(50),LastName varchar (50),EmpAge int, Check(EmpAge>20),primary key(EmpID));

INSERT INTO EMPLOYEE3 VALUES(1,'ABC','PAWAR',22);
INSERT INTO EMPLOYEE3 VALUES(1,'ABCD','PAWAR',21);
INSERT INTO EMPLOYEE3 VALUES(1,'ABCD','PAWAR',21);
SELECT * FROM EMPLOYEE3;

DROP TABLE EMPLOYEE3;
CREATE TABLE EMPLOYEE5(EmpID int primary key, FirstName varchar(50), LastName varchar(50), EmpAge int, Salary int);

insert into EMPLOYEE5 Values(1,'abc','erd',23,45555);

-----------------------------------------------------------------------------------------------

alter table EMPLOYEE5 add constraint chk_EmpAge_Salary check(EmpAge>20 AND Salary >=50000);
insert into EMPLOYEE5 values(8,'dhe','sdguqe',56,35863);

-- Default Constraint --
Create table Employee8 (EmpID int NOT NULL, FirstName Varchar(50), LastName Varchar(50), EmpDept Varchar(50) Default 'Operations');

Desc EMPLOYEE8;






