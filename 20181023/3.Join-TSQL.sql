USE TSQL;

SELECT * FROM Production.Categories;
SELECT * FROM Production.Products;
SELECT * FROM Sales.Customers;
SELECT * FROM HR.Employees;
SELECT * FROM Sales.Orders;
SELECT * FROM Sales.OrderDetails;

SELECT p.productid, p.productname,
od.qty, od.unitprice
FROM Sales.OrderDetails od
INNER JOIN Production.Products p
ON od.productid  = p.productid
WHERE od.orderid = 10248;

SELECT o.orderid, o.orderdate,
	p.productid, p.productname,
	od.qty, od.unitprice
FROM Sales.Orders o
INNER JOIN Sales.OrderDetails od
	ON o.orderid = od.orderid
INNER JOIN Production.Products p
	ON od.productid = p.productid	
WHERE o.custid = 1;

SELECT e.empid, e.firstname,
SUM(od.qty*od.unitprice) AS total
FROM Sales.Orders o
INNER JOIN HR.Employees e 
	ON o.empid = e.empid
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
	ON od.productid = p.productid
INNER JOIN Sales.Orders o
	ON o.orderid = od.orderid
WHERE YEAR(o.orderdate) = 2007 
 AND MONTH(o.orderdate) = 1
GROUP BY c.categoryid, c.categoryname;