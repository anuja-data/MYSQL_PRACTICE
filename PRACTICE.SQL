-- 1. CREATE DATABASE (DDL)
CREATE DATABASE CollegeDB;
USE CollegeDB;


-- =========================================================
-- 2.1 CREATE TABLE AND DATATYPES
-- =========================================================

-- Department table
CREATE TABLE Departments (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(50) NOT NULL UNIQUE
);

-- Student table
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50) NOT NULL,
    Age INT CHECK (Age >= 0),
    City VARCHAR(30),
    Marks DECIMAL(5,2) CHECK (Marks BETWEEN 0 AND 100),
    AdmissionDate DATE,
    DeptID INT,
    Email VARCHAR(100) UNIQUE,
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID)
);

-- View table structure
DESC Students;


-- =========================================================
-- INSERT SAMPLE DATA (DML)
-- =========================================================

INSERT IGNORE INTO Departments (DeptID, DeptName) VALUES
(1, 'Computer Science'),
(2, 'Commerce'),
(3, 'Science'),
(4, 'Arts');

INSERT IGNORE INTO Students
(StudentID, StudentName, Age, City, Marks, AdmissionDate, DeptID, Email)
VALUES
(101, 'Rahul', 20, 'Pune', 85.50, '2026-06-10', 1, 'rahul@example.com'),
(102, 'Priya', 21, 'Mumbai', 92.00, '2026-06-11', 1, 'priya@example.com'),
(103, 'Amit', 19, 'Pune', 67.50, '2026-06-12', 2, 'amit@example.com'),
(104, 'Sneha', 22, 'Nashik', 78.00, '2026-06-13', 3, 'sneha@example.com'),
(105, 'Rohan', 20, 'Mumbai', 55.00, '2026-06-14', 2, 'rohan@example.com'),
(106, 'Neha', 23, 'Pune', 88.00, '2026-06-15', 3, 'neha@example.com');

-- Display all students
SELECT * FROM Students;
SELECT * FROM Departments;


-- =========================================================
-- 2.1 ALTER, RENAME, TRUNCATE AND DROP
-- Run these examples individually when needed
-- =========================================================

-- Add a column
ALTER TABLE Students ADD Phone VARCHAR(15);

-- Modify a column datatype
ALTER TABLE Students MODIFY StudentName VARCHAR(100);

-- Rename a column (MySQL 8.0+)
ALTER TABLE Students RENAME COLUMN Phone TO Mobile;

-- Rename a table example (optional)
-- RENAME TABLE Students TO StudentDetails;
-- RENAME TABLE StudentDetails TO Students;

-- Remove all rows but retain the table RISKY
-- TRUNCATE TABLE Students;

-- Remove a table entirely RISKY    
-- DROP TABLE Students;


-- =========================================================
-- 2.2 INSERT, UPDATE, DELETE
-- =========================================================

-- Insert one student
INSERT INTO Students
(StudentName, Age, City, Marks, AdmissionDate, DeptID, Email)
VALUES
('Kiran', 20, 'Delhi', 75.00, '2026-06-16', 4, 'kiran@example.com');

-- Update one student's marks
UPDATE Students
SET Marks = 90
WHERE StudentID = 101;

-- Update a student's city
UPDATE Students
SET City = 'Pune'
WHERE StudentID = 102;

-- Delete one student
DELETE FROM Students
WHERE StudentName = 'Kiran';

-- Check changes
SELECT * FROM Students;


-- =========================================================
-- 2.3 TCL: COMMIT, ROLLBACK, SAVEPOINT
-- =========================================================

-- COMMIT: permanently save changes
START TRANSACTION;

UPDATE Students
SET Marks = 95
WHERE StudentID = 101;

COMMIT;

-- ROLLBACK: undo uncommitted changes
START TRANSACTION;

UPDATE Students
SET Marks = 10
WHERE StudentID = 101;

ROLLBACK;

-- SAVEPOINT: undo part of a transaction
START TRANSACTION;

UPDATE Students
SET Marks = 90
WHERE StudentID = 101;

SAVEPOINT S1;

UPDATE Students
SET Marks = 40
WHERE StudentID = 102;

ROLLBACK TO SAVEPOINT S1;

COMMIT;


-- =========================================================
-- 2.4 SELECT: RETRIEVING DATA
-- =========================================================

-- All columns
SELECT * FROM Students;

-- Selected columns
SELECT StudentName, Marks FROM Students;

-- Column aliases
SELECT StudentName AS Name, Marks AS TotalMarks
FROM Students;

-- Unique cities
SELECT DISTINCT City FROM Students;


-- =========================================================
-- 2.4 WHERE: RESTRICTING DATA
-- =========================================================

-- Equality
SELECT * FROM Students WHERE City = 'Pune';

-- Greater than
SELECT * FROM Students WHERE Marks > 80;

-- Less than
SELECT * FROM Students WHERE Age < 21;

-- AND
SELECT * FROM Students
WHERE City = 'Pune' AND Marks > 80;

-- OR
SELECT * FROM Students
WHERE City = 'Pune' OR City = 'Mumbai';

-- BETWEEN
SELECT * FROM Students
WHERE Marks BETWEEN 70 AND 90;

-- IN
SELECT * FROM Students
WHERE City IN ('Pune', 'Mumbai');

-- LIKE: names starting with R
SELECT * FROM Students
WHERE StudentName LIKE 'R%';

-- LIKE: names ending with a
SELECT * FROM Students
WHERE StudentName LIKE '%a';

-- IS NULL
SELECT * FROM Students
WHERE City IS NULL;

-- IS NOT NULL
SELECT * FROM Students
WHERE City IS NOT NULL;


-- =========================================================
-- 2.4 ORDER BY
-- =========================================================

-- Ascending
SELECT * FROM Students ORDER BY Marks ASC;

-- Descending
SELECT * FROM Students ORDER BY Marks DESC;

-- Sort by multiple columns
SELECT * FROM Students
ORDER BY City ASC, Marks DESC;

-- Top three marks
SELECT StudentName, Marks
FROM Students
ORDER BY Marks DESC
LIMIT 3;


-- =========================================================
-- 2.4 JOIN
-- =========================================================

-- INNER JOIN: only matching rows
SELECT s.StudentName, d.DeptName
FROM Students s
INNER JOIN Departments d ON s.DeptID = d.DeptID;

-- LEFT JOIN: all students
SELECT s.StudentName, d.DeptName
FROM Students s
LEFT JOIN Departments d ON s.DeptID = d.DeptID;

-- RIGHT JOIN: all departments
SELECT s.StudentName, d.DeptName
FROM Students s
RIGHT JOIN Departments d ON s.DeptID = d.DeptID;

-- CROSS JOIN: all combinations
SELECT s.StudentName, d.DeptName
FROM Students s
CROSS JOIN Departments d;


-- =========================================================
-- 2.1 VIEWS
-- =========================================================

CREATE OR REPLACE VIEW HighScorers AS
SELECT StudentID, StudentName, Marks
FROM Students
WHERE Marks >= 80;

-- Read the view
SELECT * FROM HighScorers;

-- Delete the view
DROP VIEW HighScorers;


-- =========================================================
-- 2.5 UNIQUE AND CHECK CONSTRAINT EXAMPLES
-- =========================================================

-- A separate table to demonstrate constraints
CREATE TABLE IF NOT EXISTS ExamResults (
    ResultID INT PRIMARY KEY,
    Email VARCHAR(100) UNIQUE,
    Marks DECIMAL(5,2) CHECK (Marks BETWEEN 0 AND 100)
);

INSERT IGNORE INTO ExamResults VALUES
(1, 'exam1@example.com', 85.00);

SELECT * FROM ExamResults;


-- =========================================================
-- 2.7 INDEXES
-- =========================================================

CREATE INDEX idx_student_name
ON Students(StudentName);

CREATE INDEX idx_city_marks
ON Students(City, Marks);

-- Show indexes
SHOW INDEX FROM Students;

-- Remove one index
DROP INDEX idx_student_name ON Students;


-- =========================================================
-- 2.8 SINGLE-ROW FUNCTIONS: CASE
-- =========================================================

SELECT StudentName, Marks,
CASE
    WHEN Marks >= 90 THEN 'Excellent'
    WHEN Marks >= 75 THEN 'Good'
    WHEN Marks >= 50 THEN 'Average'
    ELSE 'Needs Improvement'
END AS Grade
FROM Students;


-- =========================================================
-- 2.8 NUMBER FUNCTIONS
-- =========================================================

SELECT ROUND(85.567, 2) AS RoundedValue;
SELECT CEIL(85.2) AS RoundedUp;
SELECT FLOOR(85.9) AS RoundedDown;
SELECT ABS(-25) AS AbsoluteValue;


-- =========================================================
-- 2.8 DATE FUNCTIONS
-- =========================================================

SELECT CURDATE() AS Today;
SELECT NOW() AS CurrentDateTime;
SELECT YEAR('2026-06-15') AS YearValue;
SELECT MONTH('2026-06-15') AS MonthValue;

SELECT DATE_ADD('2026-06-15', INTERVAL 10 DAY) AS FutureDate;

SELECT DATEDIFF('2026-06-30', '2026-06-15') AS DaysDifference;


-- =========================================================
-- 2.8 CONVERSION FUNCTIONS
-- =========================================================

SELECT CAST('100' AS SIGNED) AS NumberValue;
SELECT CAST(100 AS CHAR) AS TextValue;

SELECT STR_TO_DATE('15-06-2026', '%d-%m-%Y') AS ConvertedDate;


-- =========================================================
-- 2.8 NULL FUNCTIONS
-- =========================================================

-- Replace missing city values
SELECT StudentName, IFNULL(City, 'Unknown') AS City
FROM Students;

-- First non-NULL value
SELECT COALESCE(NULL, NULL, 'Available') AS Result;

-- Return NULL if both values are equal
SELECT NULLIF(10, 10) AS Result;


-- =========================================================
-- 2.9 GROUP FUNCTIONS
-- =========================================================

-- COUNT: total students
SELECT COUNT(*) AS TotalStudents FROM Students;

-- COUNT: non-NULL city values
SELECT COUNT(City) AS StudentsWithCity FROM Students;

-- MIN: lowest marks
SELECT MIN(Marks) AS LowestMarks FROM Students;

-- MAX: highest marks
SELECT MAX(Marks) AS HighestMarks FROM Students;

-- SUM: total marks
SELECT SUM(Marks) AS TotalMarks FROM Students;

-- AVG: average marks
SELECT AVG(Marks) AS AverageMarks FROM Students;


-- =========================================================
-- GROUP BY AND HAVING
-- =========================================================

-- Count students per department
SELECT DeptID, COUNT(*) AS TotalStudents
FROM Students
GROUP BY DeptID;

-- Average marks per city
SELECT City, AVG(Marks) AS AverageMarks
FROM Students
GROUP BY City;

-- Departments with average marks above 75
SELECT DeptID, AVG(Marks) AS AverageMarks
FROM Students
GROUP BY DeptID
HAVING AVG(Marks) > 75;

-- Combined WHERE, GROUP BY, HAVING and ORDER BY
SELECT City, AVG(Marks) AS AverageMarks
FROM Students
WHERE Marks > 60
GROUP BY City
HAVING AVG(Marks) > 70
ORDER BY AverageMarks DESC;


-- =========================================================
-- END OF SQL PRACTICAL
-- =========================================================