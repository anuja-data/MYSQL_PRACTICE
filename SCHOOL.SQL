# -- 1. Create Database
CREATE DATABASE SchoolDB;

# -- 2. Select Database
USE SchoolDB;

# -- 3. Create Student Table
CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50),
    Age INT,
    City VARCHAR(50)
);

# -- 4. Insert Student Records
INSERT INTO Student VALUES
(1, 'Rahul', 20, 'Pune'),
(2, 'Priya', 21, 'Mumbai'),
(3, 'Amit', 19, 'Delhi'),
(4, 'Sneha', 22, 'Pune'),
(5, 'Karan', 20, 'Nashik');

# -- 5. Create Subject Table
CREATE TABLE Subject (
    SubjectID INT PRIMARY KEY,
    SubjectName VARCHAR(50),
    StudentID INT
);

# -- 6. Insert Subject Records
INSERT INTO Subject VALUES
(101, 'Maths', 1),
(102, 'Science', 2),
(103, 'English', 3),
(104, 'Computer', 4);

# -- 7. Display Students
SELECT * FROM Student;

# -- 8. Display Subjects
SELECT * FROM Subject;

# -- 9. INNER JOIN
SELECT Student.StudentName,
Subject.SubjectName
FROM Student
INNER JOIN Subject
ON Student.StudentID = Subject.StudentID;

# -- 10. LEFT JOIN
SELECT Student.StudentName,
Subject.SubjectName
FROM Student
LEFT JOIN Subject
ON Student.StudentID = Subject.StudentID;

# -- 11. RIGHT JOIN
SELECT Student.StudentName,
Subject.SubjectName
FROM Student
RIGHT JOIN Subject
ON Student.StudentID = Subject.StudentID;

# -- 12. FULL OUTER JOIN (MySQL)
SELECT Student.StudentName, Subject.SubjectName
FROM Student
LEFT JOIN Subject
ON Student.StudentID = Subject.StudentID

UNION

SELECT Student.StudentName, Subject.SubjectName
FROM Student
RIGHT JOIN Subject
ON Student.StudentID = Subject.StudentID;

# -- 13. Find Students From Pune
SELECT * FROM Student
WHERE City = 'Pune';

# -- 14. Find Students Older Than 20
SELECT * FROM Student
WHERE Age > 20;

# -- 15. Count Total Students
SELECT COUNT(*) AS TotalStudents
FROM Student;

# -- 16. Find Maximum Age
SELECT MAX(Age) AS MaximumAge
FROM Student;

# -- 17. Find Minimum Age
SELECT MIN(Age) AS MinimumAge
FROM Student;

# -- 18. Update Student City
UPDATE Student
SET City = 'Mumbai'
WHERE StudentID = 1;

# -- 19. Update Student Age
UPDATE Student
SET Age = 23
WHERE StudentID = 2;

# -- 20. Delete Student
DELETE FROM Student
WHERE StudentID = 5;
