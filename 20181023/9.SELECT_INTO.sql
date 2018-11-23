USE db01;

SELECT *
INTO dbo.Emp
FROM TSQL.HR.Employees

SELECT * FROM dbo.Emp

--DROP TABLE dbo.EmpName

SELECT empid, firstname + ' ' + lastname AS empname
INTO dbo.EmpName
FROM dbo.Emp
--ORDER BY firstname;

SELECT * FROM dbo.EmpName;