USE TSQL;

SELECT e.empid, e.firstname,
SUM(od.qty*od.unitprice) AS total
FROM HR.Employees e
INNER JOIN Sales.Orders o
	ON e.empid = o.empid
INNER JOIN Sales.OrderDetails od
	ON o.orderid = od.orderid
WHERE YEAR(o.orderdate) = 2007 AND MONTH(o.orderdate) = 1
GROUP BY e.empid, e.firstname


SELECT orderid, empid
FROM Sales.Orders o
WHERE YEAR(o.orderdate) = 2007 AND MONTH(o.orderdate) = 1
ORDER BY empid;


SELECT e.empid, e.firstname,
SUM(od.qty*od.unitprice) AS total
FROM HR.Employees e
LEFT JOIN Sales.Orders o
	ON e.empid = o.empid
LEFT JOIN Sales.OrderDetails od
	ON o.orderid = od.orderid
WHERE YEAR(o.orderdate) = 2007 AND MONTH(o.orderdate) = 1
GROUP BY e.empid, e.firstname


SELECT e.empid, e.firstname,
SUM(od.qty*od.unitprice) AS total
FROM HR.Employees e
LEFT JOIN Sales.Orders o
	ON e.empid = o.empid
	  AND YEAR(o.orderdate) = 2007 AND MONTH(o.orderdate) = 1
LEFT JOIN Sales.OrderDetails od
	ON o.orderid = od.orderid
--WHERE YEAR(o.orderdate) = 2007 AND MONTH(o.orderdate) = 1
GROUP BY e.empid, e.firstname;

SELECT c.custid, c.companyname
FROM Sales.Customers c 
LEFT JOIN Sales.Orders o
	ON c.custid = o.custid
	 AND YEAR(o.orderdate) = 2007
WHERE o.orderid IS NULL;
