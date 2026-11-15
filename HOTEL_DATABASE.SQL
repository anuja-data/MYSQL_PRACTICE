
-- 1. Create Database
CREATE DATABASE hotel_management;

-- 2. Select Database
USE hotel_management;

-- 3. Create Customers Table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(50),
    phone VARCHAR(15),
    email VARCHAR(100),
    city VARCHAR(50)
);

-- 4. Create Rooms Table
CREATE TABLE rooms (
    room_id INT PRIMARY KEY AUTO_INCREMENT,
    room_number INT UNIQUE,
    room_type VARCHAR(30),
    price DECIMAL(10,2),
    status VARCHAR(20)
);

-- 5. Create Bookings Table
CREATE TABLE bookings (
    booking_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    room_id INT,
    check_in DATE,
    check_out DATE,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id),
    FOREIGN KEY (room_id)
        REFERENCES rooms(room_id)
);

-- 6. Create Payments Table
CREATE TABLE payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    booking_id INT,
    payment_date DATE,
    amount DECIMAL(10,2),
    payment_method VARCHAR(30),
    FOREIGN KEY (booking_id)
        REFERENCES bookings(booking_id)
);

-- 7. Insert Customer Records
INSERT INTO customers
(customer_name, phone, email, city)
VALUES
('Rahul', '9876543210', 'rahul@gmail.com', 'Pune'),
('Priya', '9876543211', 'priya@gmail.com', 'Mumbai'),
('Amit', '9876543212', 'amit@gmail.com', 'Nashik');

-- 8. Insert Room Records
INSERT INTO rooms
(room_number, room_type, price, status)
VALUES
(101, 'Single', 1500, 'Available'),
(102, 'Double', 2500, 'Available'),
(103, 'Deluxe', 4000, 'Available'),
(104, 'Suite', 6000, 'Available');

-- 9. Insert Booking Records
INSERT INTO bookings
(customer_id, room_id, check_in, check_out, total_amount)
VALUES
(1, 1, '2026-11-16', '2026-11-18', 3000),
(2, 2, '2026-11-17', '2026-11-19', 5000),
(3, 3, '2026-11-20', '2026-11-22', 8000);

-- 10. Update Room Status
UPDATE rooms
SET status = 'Booked'
WHERE room_id IN (1, 2, 3);

-- 11. Insert Payment Records
INSERT INTO payments
(booking_id, payment_date, amount, payment_method)
VALUES
(1, '2026-11-16', 3000, 'Cash'),
(2, '2026-11-17', 5000, 'UPI'),
(3, '2026-11-20', 8000, 'Card');

-- 12. Display All Customers
SELECT * FROM customers;

-- 13. Display All Rooms
SELECT * FROM rooms;

-- 14. Display All Bookings
SELECT * FROM bookings;

-- 15. Display All Payments
SELECT * FROM payments;

-- 16. Customer Booking Details
SELECT
    customers.customer_name,
    rooms.room_number,
    rooms.room_type,
    bookings.check_in,
    bookings.check_out,
    bookings.total_amount
FROM bookings
JOIN customers
ON bookings.customer_id = customers.customer_id
JOIN rooms
ON bookings.room_id = rooms.room_id;

-- 17. Find Available Rooms
SELECT * FROM rooms
WHERE status = 'Available';

-- 18. Find Total Hotel Income
SELECT SUM(amount) AS total_income
FROM payments;

-- 19. Find Total Customers
SELECT COUNT(*) AS total_customers
FROM customers;

-- 20. Find Expensive Room
SELECT * FROM rooms
ORDER BY price DESC
LIMIT 1;

-- 21. Final Booking Report
SELECT
    bookings.booking_id,
    customers.customer_name,
    rooms.room_number,
    bookings.total_amount
FROM bookings
JOIN customers
ON bookings.customer_id = customers.customer_id

