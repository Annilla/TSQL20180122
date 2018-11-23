USE TSQL;

SELECT categoryid, 
SUM(unitprice) AS total,
(SELECT SUM(unitprice) FROM Production.Products) AS total_all
FROM Production.Products
GROUP BY categoryid;

SELECT categoryid, 
SUM(unitprice) AS total,
SUM(unitprice) * 100 / (SELECT SUM(unitprice) FROM Production.Products) AS [%]
FROM Production.Products
GROUP BY categoryid
ORDER BY total DESC;

SELECT categoryid, productid, productname, unitprice,
(SELECT SUM(unitprice) FROM Production.Products WHERE categoryid = p.categoryid)
FROM Production.Products p
ORDER BY categoryid ASC, unitprice DESC;

SELECT categoryid, productid, productname, unitprice,
unitprice * 100 / (SELECT SUM(unitprice) FROM Production.Products WHERE categoryid = p.categoryid)
AS [%]
FROM Production.Products p
ORDER BY categoryid ASC, unitprice DESC;

SELECT MONTH(o.orderdate) AS mn,
e.empid, e.firstname, 
SUM(od.qty*od.unitprice) AS total
FROM HR.Employees e 
INNER JOIN Sales.Orders o
	ON e.empid = o.empid
INNER JOIN Sales.OrderDetails od
	ON o.orderid = od.orderid
WHERE o.orderdate BETWEEN '2007-1-1' AND '2007-12-31'
GROUP BY MONTH(o.orderdate), e.empid, e.firstname
ORDER BY mn, total DESC;


SELECT MONTH(o.orderdate) AS mn,
e.empid, e.firstname, 
SUM(od.qty*od.unitprice) AS total,
SUM(od.qty*od.unitprice) * 100 / 
(SELECT SUM(od2.qty * od2.unitprice)
FROM Sales.Orders o2 
INNER JOIN Sales.OrderDetails od2 
	ON o2.orderid = od2.orderid
WHERE o2.orderdate BETWEEN '2007-1-1' AND '2007-12-31'
 AND MONTH(o2.orderdate) = MONTH(o.orderdate)
 ) AS [%]
FROM HR.Employees e 
INNER JOIN Sales.Orders o
	ON e.empid = o.empid
INNER JOIN Sales.OrderDetails od
	ON o.orderid = od.orderid
WHERE o.orderdate BETWEEN '2007-1-1' AND '2007-12-31'
GROUP BY MONTH(o.orderdate), e.empid, e.firstname
ORDER BY mn, total DESC;