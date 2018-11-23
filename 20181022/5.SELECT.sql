USE TSQL;

SELECT companyname, country
FROM Sales.Customers;

SELECT * FROM Sales.Customers;

SELECT unitprice, qty, unitprice * qty AS total
FROM Sales.OrderDetails;

SELECT empid, lastname, hiredate, YEAR(hiredate) AS yr
FROM HR.Employees;

SELECT country
FROM Sales.Customers;


SELECT DISTINCT country
FROM Sales.Customers;


SELECT ALL country
FROM Sales.Customers;

SELECT orderdate, 
YEAR(orderdate) AS yr,
MONTH(orderdate) AS mn
FROM Sales.Orders;

SELECT DISTINCT
YEAR(orderdate) AS yr
FROM Sales.Orders;

SELECT DISTINCT
YEAR(orderdate) AS yr,
MONTH(orderdate) AS mn
FROM Sales.Orders;