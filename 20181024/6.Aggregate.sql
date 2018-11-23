USE TSQL;

SELECT unitprice FROM Production.Products ORDER BY unitprice;
SELECT
	MAX(unitprice) AS max_price,
	MIN(unitprice) AS min_price,
	SUM(unitprice) AS sum_price,
	AVG(unitprice) AS avg_price,
	COUNT(*) AS count_all
FROM Production.Products;

SELECT categoryid,
	MAX(unitprice) AS max_price,
	MIN(unitprice) AS min_price,
	SUM(unitprice) AS sum_price,
	AVG(unitprice) AS avg_price,
	COUNT(*) AS count_all
FROM Production.Products
GROUP BY categoryid;

SELECT categoryid, productid,
	MAX(unitprice) AS max_price,
	MIN(unitprice) AS min_price,
	SUM(unitprice) AS sum_price,
	AVG(unitprice) AS avg_price,
	COUNT(*) AS count_all
FROM Production.Products
GROUP BY categoryid, productid;


SELECT e.empid, e.firstname,
od.qty*od.unitprice AS total
FROM HR.Employees e
INNER JOIN Sales.Orders o
	ON e.empid = o.empid
INNER JOIN Sales.OrderDetails od
	ON o.orderid = od.orderid
WHERE YEAR(o.orderdate) = 2007
 AND MONTH(o.orderdate) = 1
ORDER BY e.empid;


SELECT e.empid, e.firstname,
SUM(od.qty*od.unitprice) AS total
FROM HR.Employees e
INNER JOIN Sales.Orders o
	ON e.empid = o.empid
INNER JOIN Sales.OrderDetails od
	ON o.orderid = od.orderid
WHERE YEAR(o.orderdate) = 2007
 AND MONTH(o.orderdate) = 1
GROUP BY e.empid, e.firstname;

SELECT c.categoryid, c.categoryname,
SUM(od.qty*od.unitprice) AS total
FROM Production.Categories c
INNER JOIN Production.Products p
	ON c.categoryid = p.categoryid
INNER JOIN Sales.OrderDetails od
	ON p.productid = od.productid
INNER JOIN Sales.Orders o
	ON o.orderid = od.orderid
WHERE YEAR(o.orderdate) = 2007 AND MONTH(o.orderdate) = 1
GROUP BY c.categoryid, c.categoryname
HAVING SUM(od.qty*od.unitprice) < 5000
