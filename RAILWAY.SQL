-- 1. Create Database
CREATE DATABASE railway;

-- 2. Use Database
USE railway;

-- 3. Create Train Table
CREATE TABLE train (
    train_no INT PRIMARY KEY,
    train_name VARCHAR(50),
    source VARCHAR(50),
    destination VARCHAR(50)
);

-- 4. Insert Train Details
INSERT INTO train VALUES
(101, 'Deccan Express', 'Pune', 'Mumbai'),
(102, 'Rajdhani Express', 'Mumbai', 'Delhi'),
(103, 'Shatabdi Express', 'Pune', 'Nagpur');

-- 5. Create Passenger Table
CREATE TABLE passenger (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    train_no INT
);

-- 6. Insert Passenger Details
INSERT INTO passenger VALUES
(1, 'Rahul', 22, 101),
(2, 'Priya', 21, 102),
(3, 'Amit', 25, 103),
(4, 'Sneha', 20, 101);

-- 7. Display All Trains
SELECT * FROM train;

-- 8. Display All Passengers
SELECT * FROM passenger;

-- 9. Search Passenger
SELECT * FROM passenger
WHERE name = 'Rahul';

-- 10. Search Train
SELECT * FROM train
WHERE source = 'Pune';

-- 11. Update Passenger Age
UPDATE passenger
SET age = 23
WHERE id = 1;

-- 12. Delete Passenger
DELETE FROM passenger
WHERE id = 4;

-- 13. Count Total Passengers
SELECT COUNT(*) FROM passenger;

-- 14. Display Passenger and Train Details
SELECT passenger.name, train.train_name,
train.source, train.destination
FROM passenger
INNER JOIN train
ON passenger.train_no = train.train_no;

-- 15. Sort Passengers by Age
SELECT * FROM passenger
ORDER BY age ASC;