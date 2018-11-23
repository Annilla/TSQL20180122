USE TSQL;

SELECT c.categoryid, c.categoryname,
p.productid, p.productname, p.unitprice
FROM Production.Categories c
INNER JOIN Production.Products p
ON c.categoryid = p.categoryid;

SELECT c.custid, c.companyname, 
o.orderid, o.orderdate,
od.productid, od.qty, od.unitprice
FROM Sales.Customers c
INNER JOIN Sales.Orders o
	ON c.custid = o.custid
INNER JOIN Sales.OrderDetails od
	ON o.orderid = od.orderid
WHERE c.custid = 1;

SELECT c.custid, c.companyname,
o.orderid, o.orderdate, o.*
FROM Sales.Customers c
LEFT JOIN Sales.Orders o
	ON c.custid = o.custid
ORDER BY o.orderid;


SELECT c.custid, c.companyname,
o.orderid, o.orderdate
FROM Sales.Customers c
LEFT JOIN Sales.Orders o
	ON c.custid = o.custid
WHERE o.orderid IS NULL;

SELECT e1.empid, e1.firstname, 
	e2.empid, e2.firstname
FROM HR.Employees e1
CROSS JOIN HR.Employees e2;

SELECT empid, firstname, title, mgrid
FROM HR.Employees;


SELECT e.empid, e.firstname, e.title, e.mgrid,
m.firstname AS mgr_firstname,
m.title AS mgr_title
FROM HR.Employees e
INNER JOIN HR.Employees m
	ON e.mgrid = m.empid;

SELECT e.empid, e.firstname, e.title, e.mgrid,
m.firstname AS mgr_firstname,
m.title AS mgr_title
FROM HR.Employees e
LEFT JOIN HR.Employees m
	ON e.mgrid = m.empid