USE db01;

CREATE TABLE dbo.T1
(
c1 int,
c2 int
);

CREATE TABLE dbo.T2
(
c3 int,
c4 int
);

INSERT INTO dbo.T1(c1, c2) 
VALUES(1, 1),(2, 2),(3, 3);

INSERT INTO dbo.T2(c3, c4)
VALUES(2, 2),(3, 3),(4, 4);

SELECT * FROM dbo.T1;
SELECT * FROM dbo.T2;

SELECT c1, c2 FROM dbo.T1
UNION
SELECT c3, c4 FROM dbo.T2;


SELECT c1, c2 FROM dbo.T1
UNION ALL
SELECT c3, c4 FROM dbo.T2;


SELECT c1, c2 FROM dbo.T1
INTERSECT
SELECT c3, c4 FROM dbo.T2;


SELECT c1, c2 FROM dbo.T1
EXCEPT
SELECT c3, c4 FROM dbo.T2;

USE TSQL;

SELECT companyname, contactname, 1  AS kind
FROM Sales.Customers
UNION ALL
SELECT companyname, contactname, 2
FROM Production.Suppliers
ORDER BY kind, contactname;

SELECT * FROM
(
SELECT TOP(3)
1 AS mn,
e.empid, e.firstname,
SUM(od.qty*od.unitprice) AS total
FROM HR.Employees e 
INNER JOIN Sales.Orders o
	ON e.empid = o.empid
INNER JOIN Sales.OrderDetails od
	ON o.orderid = od.orderid
WHERE o.orderdate BETWEEN '2007-1-1' AND '2007-1-31'
GROUP BY e.empid, e.firstname
ORDER BY total DESC) o
UNION ALL
SELECT * FROM
(
SELECT TOP(3)
2 AS mn,
e.empid, e.firstname,
SUM(od.qty*od.unitprice) AS total
FROM HR.Employees e 
INNER JOIN Sales.Orders o
	ON e.empid = o.empid
INNER JOIN Sales.OrderDetails od
	ON o.orderid = od.orderid
WHERE o.orderdate BETWEEN '2007-2-1' AND '2007-2-28'
GROUP BY e.empid, e.firstname
ORDER BY total DESC) o;

WITH o1
AS
(
SELECT TOP(3)
1 AS mn,
e.empid, e.firstname,
SUM(od.qty*od.unitprice) AS total
FROM HR.Employees e 
INNER JOIN Sales.Orders o
	ON e.empid = o.empid
INNER JOIN Sales.OrderDetails od
	ON o.orderid = od.orderid
WHERE o.orderdate BETWEEN '2007-1-1' AND '2007-1-31'
GROUP BY e.empid, e.firstname
ORDER BY total DESC),
o2
AS
(
SELECT TOP(3)
2 AS mn,
e.empid, e.firstname,
SUM(od.qty*od.unitprice) AS total
FROM HR.Employees e 
INNER JOIN Sales.Orders o
	ON e.empid = o.empid
INNER JOIN Sales.OrderDetails od
	ON o.orderid = od.orderid
WHERE o.orderdate BETWEEN '2007-2-1' AND '2007-2-28'
GROUP BY e.empid, e.firstname
ORDER BY total DESC)
SELECT * FROM o1
UNION ALL
SELECT * FROM o2;