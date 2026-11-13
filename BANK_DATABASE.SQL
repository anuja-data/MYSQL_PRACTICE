-- 1. Create Database
CREATE DATABASE BankDB;

-- 2. Use Database
USE BankDB;

-- 3. Create Customer Table
CREATE TABLE Customer (
    customer_id INT,
    customer_name VARCHAR(50),
    city VARCHAR(50),
    age INT
);

-- 4. Insert Customer Records
INSERT INTO Customer VALUES
(1, 'Rahul', 'Pune', 25),
(2, 'Priya', 'Mumbai', 22),
(3, 'Amit', 'Nanded', 30),
(4, 'Sneha', 'Pune', 27),
(5, 'Neha', 'Nashik', 24);

-- 5. Create Account Table
CREATE TABLE Account (
    account_no INT,
    customer_id INT,
    account_type VARCHAR(30),
    balance DECIMAL(10,2)
);

-- 6. Insert Account Records
INSERT INTO Account VALUES
(1001, 1, 'Saving', 50000),
(1002, 2, 'Current', 75000),
(1003, 3, 'Saving', 30000),
(1004, 4, 'Saving', 90000),
(1005, 5, 'Current', 45000);

-- 7. Create Transaction Table
CREATE TABLE Transactions (
    transaction_id INT,
    account_no INT,
    transaction_type VARCHAR(30),
    amount DECIMAL(10,2)
);

-- 8. Insert Transaction Records
INSERT INTO Transactions VALUES
(1, 1001, 'Deposit', 10000),
(2, 1002, 'Withdraw', 5000),
(3, 1003, 'Deposit', 8000),
(4, 1004, 'Withdraw', 2000),
(5, 1005, 'Deposit', 12000);

-- 9. Display All Tables
SELECT * FROM Customer;
SELECT * FROM Account;
SELECT * FROM Transactions;

-- 10. WHERE Condition
SELECT * FROM Customer
WHERE city = 'Pune';

-- 11. ORDER BY
SELECT * FROM Account
ORDER BY balance DESC;

-- 12. UPDATE
UPDATE Account
SET balance = 60000
WHERE account_no = 1001;

-- 13. DELETE
DELETE FROM Customer
WHERE customer_id = 5;

-- 14. Aggregate Functions
SELECT COUNT(*) FROM Customer;
SELECT SUM(balance) FROM Account;
SELECT AVG(balance) FROM Account;
SELECT MAX(balance) FROM Account;
SELECT MIN(balance) FROM Account;

-- 15. GROUP BY
SELECT account_type, SUM(balance)
FROM Account
GROUP BY account_type;

-- 16. INNER JOIN
SELECT Customer.customer_name,
       Account.account_no,
       Account.account_type,
       Account.balance
FROM Customer
INNER JOIN Account
ON Customer.customer_id = Account.customer_id;

-- 17. JOIN Three Tables
SELECT Customer.customer_name,
       Account.account_no,
       Transactions.transaction_type,
       Transactions.amount
FROM Customer
INNER JOIN Account
ON Customer.customer_id = Account.customer_id
INNER JOIN Transactions
ON Account.account_no = Transactions.account_no;

-- 18. LIKE Operator
SELECT * FROM Customer
WHERE customer_name LIKE 'S%';

-- 19. BETWEEN
SELECT * FROM Account
WHERE balance BETWEEN 30000 AND 75000;

-- 20. DISTINCT
SELECT DISTINCT city FROM Customer;

-- 21. Final Display
SELECT * FROM Customer;
SELECT * FROM Account;
SELECT * FROM Transactions;