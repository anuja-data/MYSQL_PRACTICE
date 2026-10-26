CREATE TABLE EMPLOYEE (
    Emp_no INT,
    E_name VARCHAR(50),
    E_address VARCHAR(100),
    E_ph_no VARCHAR(15),
    Dept_no INT,
    Dept_name VARCHAR(50),
    Job_id VARCHAR(20),
    Designation VARCHAR(30),
    Salary DECIMAL(10,2),
    join_date DATE,
    experience INT
);

SELECT Emp_no, E_name, Salary
FROM EMPLOYEE
WHERE Designation = 'MANAGER';

SELECT *
FROM EMPLOYEE
WHERE Salary > 10000;

SELECT *
FROM EMPLOYEE
WHERE join_date > '1981-12-31'
ORDER BY Designation ASC;

SELECT E_name, experience, Salary / 30 AS Daily_Salary
FROM EMPLOYEE;

SELECT *
FROM EMPLOYEE
WHERE Designation IN ('CLERK', 'ANALYST');

SELECT *
FROM EMPLOYEE
WHERE join_date IN (
    '1981-05-01',
    '1981-12-03',
    '1981-12-17',
    '1980-01-19'
);

SELECT *
FROM EMPLOYEE
WHERE Dept_no IN (10, 20);

SELECT E_name
FROM EMPLOYEE
WHERE E_name LIKE 'S%';

SELECT MAX(Salary) AS Highest_Salary
FROM EMPLOYEE;

SELECT E_name, SUBSTR(E_name, 1, 5) AS Name
FROM EMPLOYEE
WHERE E_name LIKE 'H%'
AND Designation NOT IN ('PRESIDENT', 'MGR')
ORDER BY Salary ASC;

SELECT MIN(Salary) AS Minimum_Salary,
       MAX(Salary) AS Maximum_Salary,
       experience
FROM EMPLOYEE
GROUP BY experience;

SELECT SUM(Salary) AS Total_Salary
FROM EMPLOYEE;

SELECT AVG(Salary) AS Average_Salary
FROM EMPLOYEE
WHERE Dept_name = 'IT';

SELECT DISTINCT Salary
FROM EMPLOYEE;

DROP DATABASE lab1;
