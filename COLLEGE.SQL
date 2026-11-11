
-- 1. CREATE DATABASE
CREATE DATABASE CollegeDB;
USE CollegeDB;

-- 2. CREATE TABLES
CREATE TABLE Students (
    ID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Age INT,
    City VARCHAR(50),
    Marks INT
);

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(50)
);

CREATE TABLE Enrollments (
    EID INT PRIMARY KEY,
    ID INT,
    CourseID INT,
    FOREIGN KEY (ID) REFERENCES Students(ID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

-- 3. INSERT DATA
INSERT INTO Students VALUES
(1,'Rahul',20,'Nagpur',85),
(2,'Priya',21,'Mumbai',90),
(3,'Amit',19,'Pune',75);

INSERT INTO Courses VALUES
(101,'SQL'),(102,'Python');

INSERT INTO Enrollments VALUES
(1,1,101),(2,2,102),(3,3,101);

-- 4. SELECT
SELECT * FROM Students;
SELECT Name,Marks FROM Students;
SELECT DISTINCT City FROM Students;
SELECT * FROM Students WHERE Marks > 80;
SELECT * FROM Students ORDER BY Marks DESC;
SELECT * FROM Students LIMIT 2;

-- 5. UPDATE AND DELETE
UPDATE Students SET Marks=95 WHERE ID=1;
DELETE FROM Students WHERE ID=3;

-- 6. ALTER TABLE
ALTER TABLE Students ADD Email VARCHAR(100);
ALTER TABLE Students MODIFY Name VARCHAR(100);
ALTER TABLE Students DROP COLUMN Email;

-- 7. AGGREGATE FUNCTIONS
SELECT COUNT(*) FROM Students;
SELECT MAX(Marks) FROM Students;
SELECT MIN(Marks) FROM Students;
SELECT AVG(Marks) FROM Students;
SELECT SUM(Marks) FROM Students;

-- 8. GROUP BY AND HAVING
SELECT City,COUNT(*)
FROM Students GROUP BY City;

SELECT City,AVG(Marks)
FROM Students GROUP BY City
HAVING AVG(Marks)>80;

-- 9. JOINS

-- INNER JOIN
SELECT S.Name,C.CourseName
FROM Students S
INNER JOIN Enrollments E ON S.ID=E.ID
INNER JOIN Courses C ON E.CourseID=C.CourseID;

-- LEFT JOIN
SELECT S.Name,E.CourseID
FROM Students S
LEFT JOIN Enrollments E ON S.ID=E.ID;

-- RIGHT JOIN
SELECT S.Name,E.CourseID
FROM Students S
RIGHT JOIN Enrollments E ON S.ID=E.ID;

-- FULL OUTER JOIN (MySQL uses UNION)
SELECT S.Name,E.CourseID
FROM Students S
LEFT JOIN Enrollments E ON S.ID=E.ID
UNION
SELECT S.Name,E.CourseID
FROM Students S
RIGHT JOIN Enrollments E ON S.ID=E.ID;

-- CROSS JOIN
SELECT S.Name,C.CourseName
FROM Students S CROSS JOIN Courses C;

-- SELF JOIN
SELECT A.Name,B.Name
FROM Students A JOIN Students B
ON A.City=B.City AND A.ID<B.ID;

-- 10. OPERATORS
SELECT * FROM Students WHERE Marks BETWEEN 70 AND 90;
SELECT * FROM Students WHERE City IN ('Nagpur','Pune');
SELECT * FROM Students WHERE Name LIKE 'R%';

-- 11. FUNCTIONS
SELECT UPPER(Name),LOWER(Name) FROM Students;
SELECT CONCAT(Name,' ',City) FROM Students;
SELECT LENGTH(Name) FROM Students;
SELECT ROUND(85.678,2);
SELECT CURDATE(),NOW();

-- 12. SUBQUERY
SELECT * FROM Students
WHERE Marks > (SELECT AVG(Marks) FROM Students);

-- 13. CASE
SELECT Name,Marks,
CASE
WHEN Marks>=90 THEN 'A'
WHEN Marks>=80 THEN 'B'
ELSE 'C'
END AS Grade
FROM Students;

-- 14. VIEW
CREATE VIEW TopStudents AS
SELECT Name,Marks FROM Students WHERE Marks>=80;

SELECT * FROM TopStudents;

-- 15. INDEX
CREATE INDEX idx_name ON Students(Name);

-- 16. SECOND HIGHEST MARKS
SELECT MAX(Marks) FROM Students
WHERE Marks < (SELECT MAX(Marks) FROM Students);

-- 17. TRANSACTION
START TRANSACTION;
UPDATE Students SET Marks=90 WHERE ID=1;
SAVEPOINT S1;
ROLLBACK TO S1;
COMMIT;

-- 18. DELETE TABLE
DROP VIEW TopStudents;
DROP TABLE Enrollments;
DROP TABLE Courses;

