CREATE DATABASE EmpOrd;
GO
USE EmpOrd;

CREATE TABLE dbo.Emp
(
emp_id int PRIMARY KEY,
emp_name nvarchar(20)
);

CREATE TABLE dbo.Ord
(
ord_id int PRIMARY KEY,
emp_id int,
amount int
);

INSERT INTO dbo.Emp(emp_id, emp_name)
VALUES(1, 'John'),
(2, 'Peter'),
(3, 'Alice');

INSERT INTO dbo.Ord(ord_id, emp_id, amount)
VALUES(1, 1, 3000),
(2, 2, 4000),
(3, 2, 5000),
(4, 3, 6000);

SELECT * FROM dbo.Emp;
SELECT * FROM dbo.Ord;

SELECT *
FROM dbo.Emp e
INNER JOIN dbo.Ord o
	ON e.emp_id = o.emp_id;


SELECT o.ord_id, e.emp_id, e.emp_name, o.amount
FROM dbo.Emp e
INNER JOIN dbo.Ord o
	ON e.emp_id = o.emp_id;
