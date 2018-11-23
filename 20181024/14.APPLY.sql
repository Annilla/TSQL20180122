USE TSQL;

SELECT e.empid, e.firstname, o.orderid, o.orderdate
FROM HR.Employees e
CROSS APPLY
(SELECT TOP(3) orderid, orderdate
FROM Sales.Orders
WHERE orderdate BETWEEN '2007-1-1' AND '2007-1-31'
AND empid = e.empid
ORDER BY orderdate DESC) o;


SELECT e.empid, e.firstname, o.orderid, o.orderdate
FROM HR.Employees e
OUTER APPLY
(SELECT TOP(3) orderid, orderdate
FROM Sales.Orders
WHERE orderdate BETWEEN '2007-1-1' AND '2007-1-31'
AND empid = e.empid
ORDER BY orderdate DESC) o;