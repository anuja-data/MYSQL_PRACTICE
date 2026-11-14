USE LibraryDB;

-- 1. Display all books
SELECT * FROM Book;

-- 2. Display only book names
SELECT book_name FROM Book;

-- 3. Find books with price greater than 500
SELECT * FROM Book
WHERE price > 500;

-- 4. Find books with price less than 600
SELECT * FROM Book
WHERE price < 600;

-- 5. Find books with price between 400 and 600
SELECT * FROM Book
WHERE price BETWEEN 400 AND 600;

-- 6. Find members from Pune
SELECT * FROM Member
WHERE city = 'Pune';

-- 7. Find names starting with A
SELECT * FROM Member
WHERE member_name LIKE 'A%';

-- 8. Sort books by price ascending
SELECT * FROM Book
ORDER BY price ASC;

-- 9. Sort books by price descending
SELECT * FROM Book
ORDER BY price DESC;

-- 10. Display first 3 books
SELECT * FROM Book
LIMIT 3;

-- 11. Count total books
SELECT COUNT(*) FROM Book;

-- 12. Find maximum book price
SELECT MAX(price) FROM Book;

-- 13. Find minimum book price
SELECT MIN(price) FROM Book;

-- 14. Find average book price
SELECT AVG(price) FROM Book;

-- 15. Find total book price
SELECT SUM(price) FROM Book;

-- 16. Display unique cities
SELECT DISTINCT city FROM Member;

-- 17. Display books category-wise
SELECT category, COUNT(*)
FROM Book
GROUP BY category;

-- 18. Display member and issue details
SELECT Member.member_name, Issue.issue_date
FROM Member
INNER JOIN Issue
ON Member.member_id = Issue.member_id;

-- 19. Update book price
UPDATE Book
SET price = 650
WHERE book_id = 2;

