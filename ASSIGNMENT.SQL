CREATE DATABASE COMPANY_DETAIL;
USE COMPANY_DETAIL;

CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    City VARCHAR(50),
    bdate DATE
);

CREATE TABLE Investor (
    inv_no INT PRIMARY KEY,
    inv_name VARCHAR(50),
    inv_date DATE,
    inv_amt INT,
    emp_id INT
);

SHOW TABLES;

INSERT INTO Employee VALUES (101, 'ANUJA', 'NANDED', '2006-11-14');
INSERT INTO Employee VALUES (102, 'NANDINI', 'PUNE', '2004-05-23');
INSERT INTO Employee VALUES (103, 'GAURI', 'AMRAVTI', '2005-03-24');
INSERT INTO Employee VALUES (104, 'DOORVA', 'DELHI', '2002-06-13');
INSERT INTO Employee VALUES (105, 'PRIYAA', 'MUMBAI', '2009-07-16');

SELECT * FROM Employee;

INSERT INTO Investor VALUES (1001, 'TATA', '2023-05-21', 50000, 101);
INSERT INTO Investor VALUES (1002, 'RELIANCE', '2032-02-23', 58000, 102);
INSERT INTO Investor VALUES (1003, 'BAJAJ', '2025-04-25', 57000, 103);
INSERT INTO Investor VALUES (1004, 'MARUTI', '2027-07-25', 65000, 104);
INSERT INTO Investor VALUES (1005, 'ROYAL_ENFIELD', '2020-09-23', 45000, 105);

SELECT * FROM Investor;

SELECT * FROM Employee;

ALTER TABLE Employee ADD Age INT;
ALTER TABLE Employee ADD Salary INT;

ALTER TABLE Employee
ADD CONSTRAINT chk_age_salary
CHECK (Age <= 50 AND Salary >= 10000);

SELECT * FROM Employee;
SHOW CREATE TABLE Employee;

ALTER TABLE Investor ADD COLUMN Age INT;

SELECT * FROM Investor;

ALTER TABLE Investor MODIFY inv_name TEXT;

DESC Investor;

ALTER TABLE Employee RENAME COLUMN emp_id TO e_id;

DESC Employee;

UPDATE Employee
SET City = 'Nagpur'
WHERE e_id = 104;

SELECT * FROM Employee;

DELETE FROM Investor
WHERE inv_no = 1004;

SELECT * FROM Investor;

ALTER TABLE Investor DROP COLUMN Age;

SELECT * FROM Investor;

ALTER TABLE Employee DROP CHECK chk_age_salary;

SHOW CREATE TABLE Employee;

ALTER TABLE Investor
ADD FOREIGN KEY (emp_id) REFERENCES Employee(e_id);

SELECT * FROM Investor;

SELECT inv_no, inv_name, inv_date, inv_amt
FROM Investor;

RENAME TABLE Employee TO Emp;

SHOW TABLES;

TRUNCATE TABLE Investor;

SELECT * FROM Investor;

DROP TABLE Investor;
DROP TABLE Emp;
