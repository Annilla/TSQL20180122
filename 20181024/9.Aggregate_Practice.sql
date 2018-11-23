USE TSQL;

SELECT o.orderid, o.orderdate,
SUM(od.qty*od.unitprice) AS salesamount
FROM Sales.Orders o
INNER JOIN Sales.OrderDetails od
	ON o.orderid = od.orderid
GROUP BY o.orderid, o.orderdate
ORDER BY salesamount DESC;

SELECT o.orderid, o.orderdate,
SUM(od.qty*od.unitprice) AS salesamount,
COUNT(*) AS no_of_order_lines,
AVG(od.qty*od.unitprice) AS avg_sales_amount_per_order_lines

FROM Sales.Orders o
INNER JOIN Sales.OrderDetails od
	ON o.orderid = od.orderid
GROUP BY o.orderid, o.orderdate
ORDER BY salesamount DESC;

SELECT YEAR(o.orderdate) * 100 + MONTH(o.orderdate) AS yearmonthno,
SUM(od.qty*od.unitprice) AS salesamount
FROM Sales.Orders o
INNER JOIN Sales.OrderDetails od
	ON o.orderid = od.orderid
GROUP BY YEAR(o.orderdate) * 100 + MONTH(o.orderdate)
ORDER BY yearmonthno;

SELECT c.custid, c.contactname, o.orderid, o.orderdate, 
SUM(od.qty*od.unitprice)  AS total_sales_amount,
MAX(od.qty*od.unitprice)  AS max_sales_amount,
COUNT(*) AS number_of_rows,
COUNT(o.orderid) AS number_of_order_lines
FROM Sales.Customers c
LEFT JOIN Sales.Orders o
	ON c.custid = o.custid
LEFT JOIN Sales.OrderDetails od
	ON o.orderid = od.orderid
GROUP BY c.custid, c.contactname, o.orderid, o.orderdate
ORDER BY o.orderid;