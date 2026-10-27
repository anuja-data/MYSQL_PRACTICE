
-- =====================================
-- 1. JOIN
-- =====================================

CREATE DATABASE IF NOT EXISTS JoinDB;
USE JoinDB;

CREATE TABLE Department (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(30)
);

CREATE TABLE Student (
    ID INT PRIMARY KEY,
    Name VARCHAR(30),
    Marks INT,
    DeptID INT,
    FOREIGN KEY (DeptID) REFERENCES Department(DeptID)
);

-- Insert sample data
INSERT INTO Department VALUES
(1, 'Computer'), (2, 'Commerce'), (3, 'Science');

INSERT INTO Student VALUES
(101, 'Rahul', 85, 1),
(102, 'Priya', 92, 2),
(103, 'Amit', 70, 1);

-- INNER JOIN: matching records only
SELECT Student.Name, Department.DeptName
FROM Student
INNER JOIN Department
ON Student.DeptID = Department.DeptID;

-- LEFT JOIN: all students
SELECT Student.Name, Department.DeptName
FROM Student
LEFT JOIN Department
ON Student.DeptID = Department.DeptID;

-- RIGHT JOIN: all departments
SELECT Student.Name, Department.DeptName
FROM Student
RIGHT JOIN Department
ON Student.DeptID = Department.DeptID;

-- CROSS JOIN: all combinations
SELECT Student.Name, Department.DeptName
FROM Student
CROSS JOIN Department;


-- =====================================
-- 2. HAVING
-- =====================================

-- Departments with average marks above 75
SELECT DeptID, AVG(Marks) AS AverageMarks
FROM Student
GROUP BY DeptID
HAVING AVG(Marks) > 75;

-- Departments having more than one student
SELECT DeptID, COUNT(*) AS TotalStudents
FROM Student
GROUP BY DeptID
HAVING COUNT(*) > 1;


-- =====================================
-- 3. DCL: GRANT AND REVOKE
-- =====================================

-