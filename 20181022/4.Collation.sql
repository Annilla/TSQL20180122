USE dbEmp;


SELECT COLLATIONPROPERTY('Latin1_General_CI_AS', 'codepage')

SELECT COLLATIONPROPERTY('Chinese_Taiwan_Stroke_CI_AS', 'codepage')

SELECT SERVERPROPERTY('Collation');

SELECT name, collation_name FROM sys.databases;

USE dbEmp
SELECT COLUMN_NAME,DATA_TYPE, COLLATION_NAME
FROM INFORMATION_SCHEMA.COLUMNS;

INSERT INTO dbo.Employee(emp_id, emp_name, birth_date, salary)
VALUES(5, '李曉明', '1990-1-1', 30000);

SELECT * FROM dbo.Employee;

DELETE FROM dbo.Employee
WHERE emp_id =5

INSERT INTO dbo.Employee(emp_id, emp_name, birth_date, salary)
VALUES(5, N'李曉明', '1990-1-1', 30000);

USE [master]
GO
ALTER DATABASE [dbEmp] COLLATE Chinese_Taiwan_Stroke_CI_AS
GO

USE dbEmp;

INSERT INTO dbo.Employee(emp_id, emp_name, birth_date, salary)
VALUES(6, '李曉明', '1990-1-1', 30000);


SELECT * FROM dbo.Employee

USE db01;
SELECT '李曉明'

SELECT N'李曉明'


USE dbEmp;
SELECT '李曉明'

SELECT N'李曉明'


USE [master]
GO
ALTER DATABASE [dbEmp] COLLATE Chinese_Taiwan_Stroke_CS_AS
GO

USE dbEmp;

SELECT * FROM dbo.employee;