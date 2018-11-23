USE TSQL;

--IN
SELECT empid, firstname
FROM HR.Employees 
WHERE empid IN (SELECT empid
FROM Sales.Orders
WHERE orderdate BETWEEN '2007-1-1' AND '2007-1-5'
);

SELECT DISTINCT 
e.empid, e.firstname
FROM HR.Employees e 
INNER JOIN Sales.Orders o
	ON e.empid = o.empid
WHERE o.orderdate BETWEEN '2007-1-1' AND '2007-1-5';

SELECT empid, firstname
FROM HR.Employees 
WHERE empid NOT IN (SELECT empid
FROM Sales.Orders
WHERE orderdate BETWEEN '2007-1-1' AND '2007-1-5'
);


SELECT 
e.empid, e.firstname
FROM HR.Employees e 
LEFT JOIN Sales.Orders o
	ON e.empid = o.empid
	AND o.orderdate BETWEEN '2007-1-1' AND '2007-1-5'
WHERE o.orderid IS NULL

SELECT empid, firstname
FROM HR.Employees
WHERE empid IN (1, 2, 4, 8, NULL);


SELECT empid, firstname
FROM HR.Employees
WHERE empid NOT IN (1, 2, 4, 8, NULL);

SELECT empid, firstname
FROM HR.Employees e 
WHERE EXISTS(SELECT * 
FROM Sales.Orders
WHERE orderdate BETWEEN '2007-1-1' AND '2007-1-5'
AND empid = e.empid);

SELECT empid, firstname
FROM HR.Employees e 
WHERE NOT EXISTS(SELECT * FROM Sales.Orders
WHERE orderdate BETWEEN '2007-1-1' AND '2007-1-5'
AND empid = e.empid)
