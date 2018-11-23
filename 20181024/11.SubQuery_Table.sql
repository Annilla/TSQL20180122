USE TSQL;

SELECT e.empid, e.firstname,
o.orderid, o.orderdate
FROM HR.Employees e 
LEFT JOIN (
SELECT orderid, orderdate, empid
FROM Sales.Orders 
WHERE orderdate BETWEEN '2007-1-1' AND '2007-1-5'
) o ON e.empid = o.empid;

--CTE
--Common Table Expression
WITH Ord
AS
(
SELECT orderid, orderdate, empid
FROM Sales.Orders 
WHERE orderdate BETWEEN '2007-1-1' AND '2007-1-5'
)
SELECT e.empid, e.firstname,
o.orderid, o.orderdate
FROM HR.Employees e 
LEFT JOIN Ord o
	ON e.empid = o.empid;

WITH Ord
AS
(
SELECT o.empid, SUM(od.qty*od.unitprice) AS total
FROM Sales.Orders o
INNER JOIN Sales.OrderDetails od
	ON o.orderid = od.orderid
WHERE o.orderdate BETWEEN '2007-1-1' AND '2007-1-31'
GROUP BY o.empid
)
SELECT e.empid, e.firstname, o.total
FROM HR.Employees e 
LEFT JOIN Ord o
	ON e.empid = o.empid;

SELECT e.empid, e.firstname, o.total
FROM HR.Employees e 
LEFT JOIN (
SELECT o.empid, SUM(od.qty*od.unitprice) AS total
FROM Sales.Orders o
INNER JOIN Sales.OrderDetails od
	ON o.orderid = od.orderid
WHERE o.orderdate BETWEEN '2007-1-1' AND '2007-1-31'
GROUP BY o.empid
) o	ON e.empid = o.empid;
