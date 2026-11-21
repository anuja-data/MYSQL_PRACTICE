CREATE DATABASE ProductDB;

USE ProductDB;

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Price DECIMAL(10,2),
    Quantity INT,
    Category VARCHAR(50)
);

INSERT INTO Products VALUES
(1, 'Laptop', 55000, 10, 'Electronics'),
(2, 'Mobile', 20000, 15, 'Electronics'),
(3, 'Keyboard', 1500, 25, 'Accessories'),
(4, 'Mouse', 500, 30, 'Accessories');

-- Display Products
SELECT * FROM Products;

-- Search Product
SELECT * FROM Products
WHERE ProductName = 'Laptop';

-- Update Price
UPDATE Products
SET Price = 60000
WHERE ProductID = 1;

-- Delete Product
DELETE FROM Products
WHERE ProductID = 4;

-- Sort by Price
SELECT * FROM Products
ORDER BY Price DESC;

-- Total Products
SELECT COUNT(*) FROM Products;

-- Total Stock Value
SELECT SUM(Price * Quantity) AS TotalStockValue
FROM Products;