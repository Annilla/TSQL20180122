/*
USE master;
DROP DATABASE dbEmp;

sp_who

kill 54
*/


CREATE DATABASE dbEmp;
GO --批次執行
USE dbEmp;

CREATE TABLE dbo.Employee
(
emp_id int PRIMARY KEY,--束制條件(Constraint)
emp_name nvarchar(20),
birth_date date,
salary decimal(10, 2)
);

INSERT INTO dbo.Employee(emp_id, emp_name, birth_date, salary)
VALUES(1, 'John', '1980-1-1', 40000),
(2, 'Peter', '1981-1-1', 46000),
(3, 'Linda', '1982-1-1', 42000),
(4, 'Alice', '1983-1-1', 38000);

SELECT * FROM dbo.Employee;

SELECT * FROM dbo.Employee
WHERE emp_id = 3;

SELECT emp_id, emp_name FROM dbo.Employee
WHERE emp_id = 3;

SELECT * FROM dbo.Employee
WHERE salary < 40000;

SELECT * FROM dbo.Employee
WHERE birth_date >= '1981-1-1';

SELECT * FROM dbo.Employee
WHERE emp_name <> 'John';

SELECT * FROM dbo.Employee
WHERE emp_id IN (1, 3, 5);

SELECT * FROM dbo.Employee
WHERE salary BETWEEN 30000 AND 40000;

SELECT * FROM dbo.Employee
WHERE emp_name LIKE 'A%';

SELECT * FROM dbo.Employee
WHERE emp_name LIKE '%A';

SELECT * FROM dbo.Employee
WHERE emp_name LIKE '%A%';

SELECT * FROM dbo.Employee
WHERE emp_name LIKE 'J___';

SELECT * FROM dbo.Employee
WHERE emp_name LIKE 'J____';

SELECT * FROM dbo.Employee
WHERE emp_name = 'John';

SELECT * FROM dbo.Employee
WHERE emp_name = 'JOHN';

SELECT * FROM dbo.Employee
WHERE emp_name = 'john';

SELECT * FROM dbo.Employee
WHERE emp_name = 'john' COLLATE Chinese_Taiwan_Stroke_CI_AS;


--Collation(定序)