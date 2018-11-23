WITH Emp
AS
(
SELECT empid, firstname, title, 1 AS lvl
FROM HR.Employees 
WHERE empid = 1
UNION ALL
SELECT e.empid, e.firstname, e.title, m.lvl + 1
FROM HR.Employees e 
INNER JOIN Emp m
	ON e.mgrid = m.empid
)
SELECT * FROM Emp;

WITH Emp
AS
(
SELECT empid, firstname, title, 1 AS lvl, CAST(firstname AS nvarchar(1000)) AS tree
FROM HR.Employees 
WHERE empid = 1
UNION ALL
SELECT e.empid, e.firstname, e.title, m.lvl + 1, CAST(m.tree + '=>' + e.firstname AS nvarchar(1000))
FROM HR.Employees e 
INNER JOIN Emp m
	ON e.mgrid = m.empid
)
SELECT * FROM Emp;