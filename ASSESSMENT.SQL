CREATE DATABASE HospitalDB;
USE HospitalDB;

CREATE TABLE hospital (
    hno INT PRIMARY KEY,
    hname VARCHAR(50),
    city VARCHAR(30),
    Est_year INT
);

CREATE TABLE doctor (
    dno INT PRIMARY KEY,
    dname VARCHAR(50),
    address VARCHAR(100),
    Speciality VARCHAR(50)
);

(5, 'Global Hospital', 'Nagpur', 1988);

INSERT INTO doctor VALUES
(1001, 'Dr. Sharma', 'Pune', 'Cardiology'),
(1002, 'Dr. S Patil', 'Mumbai', 'Neurology'),
(1003, 'Dr. Amit', 'Nashik', 'Cardiology'),
(1004, 'Dr. Mehta', 'Pune', 'Orthopedics'),
(1005, 'Dr. S Joshi', 'Nagpur', 'Cardiology');

-- 1. Find all doctors specialized in Cardiology
SELECT * FROM doctor
WHERE Speciality = 'Cardiology';

-- 2. Count the number of hospitals in each city
SELECT city, COUNT(*) AS total_hospitals
FROM hospital
GROUP BY city;

-- 3. Get doctors whose address matches the city of any hospital
SELECT * FROM doctor
WHERE address IN (SELECT city FROM hospital);

-- 4. Delete hospitals established before 1990
DELETE FROM hospital
WHERE Est_year < 1990;

-- 5. Find the second-oldest hospital
SELECT * FROM hospital
ORDER BY Est_year ASC
LIMIT 1 OFFSET 1;

-- 6. Find doctors whose names start with 'Dr. S'
SELECT * FROM doctor
WHERE dname LIKE 'Dr. S%';

-- 7. Add a new column phone to the Doctor table
ALTER TABLE doctor
ADD COLUMN phone VARCHAR(10);

-- 8. Set the phone number for Dr. Mehta
UPDATE doctor
SET phone = '8975782645'
WHERE dno = 1004;

-- 9. Display doctors working in Pune hospitals
SELECT * FROM doctor
WHERE address = 'Pune';

-- 10. Drop both tables and the database
DROP TABLE doctor;
DROP TABLE hospital;
DROP DATABASE HospitalDB;