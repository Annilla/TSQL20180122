USE TSQL;

SELECT custid
FROM Sales.Orders
WHERE orderdate BETWEEN '2007-1-1' AND '2007-1-31'
ORDER BY custid;


SELECT DISTINCT custid
FROM Sales.Orders
WHERE orderdate BETWEEN '2007-1-1' AND '2007-1-31'
ORDER BY custid;

SELECT COUNT(*) AS count_all, 
COUNT(custid) AS count_custid,
COUNT(DISTINCT custid) AS count_custid
FROM Sales.Orders
WHERE orderdate BETWEEN '2007-1-1' AND '2007-1-31';


SELECT MONTH(orderdate) AS mn,
COUNT(*) AS count_all, 
COUNT(custid) AS count_custid,
COUNT(DISTINCT custid) AS count_custid
FROM Sales.Orders
WHERE orderdate BETWEEN '2007-1-1' AND '2007-12-31'
GROUP BY MONTH(orderdate)
ORDER BY mn;