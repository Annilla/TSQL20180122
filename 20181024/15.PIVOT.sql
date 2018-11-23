USE TSQL;
/*
WITH EmpTotal(mn, eid, ename, total)
AS
(
SELECT MONTH(o.orderdate),
e.empid, e.firstname, 
SUM(od.qty*od.unitprice)
FROM HR.Employees e 
INNER JOIN Sales.Orders o
	ON e.empid = o.empid
INNER JOIN Sales.OrderDetails od
	ON o.orderid = od.orderid	
WHERE o.orderdate BETWEEN '2007-1-1' AND '2007-12-31'
GROUP BY MONTH(o.orderdate),
e.empid, e.firstname
)
SELECT eid, ename, --mn, total,
SUM(CASE mn WHEN 1 THEN total END) AS mn1,
SUM(CASE mn WHEN 2 THEN total END) AS mn2,
SUM(CASE mn WHEN 3 THEN total END) AS mn3,
SUM(CASE mn WHEN 4 THEN total END) AS mn4,
SUM(CASE mn WHEN 5 THEN total END) AS mn5,
SUM(CASE mn WHEN 6 THEN total END) AS mn6,
SUM(CASE mn WHEN 7 THEN total END) AS mn7,
SUM(CASE mn WHEN 8 THEN total END) AS mn8,
SUM(CASE mn WHEN 9 THEN total END) AS mn9,
SUM(CASE mn WHEN 10 THEN total END) AS mn10,
SUM(CASE mn WHEN 11 THEN total END) AS mn11,
SUM(CASE mn WHEN 12 THEN total END) AS mn12
FROM EmpTotal
GROUP BY eid, ename;
--ORDER BY eid, mn
*/


WITH EmpTotal(mn, eid, ename, total)
AS
(
SELECT MONTH(o.orderdate),
e.empid, e.firstname, 
SUM(od.qty*od.unitprice)
FROM HR.Employees e 
INNER JOIN Sales.Orders o
	ON e.empid = o.empid
INNER JOIN Sales.OrderDetails od
	ON o.orderid = od.orderid	
WHERE o.orderdate BETWEEN '2007-1-1' AND '2007-12-31'
GROUP BY MONTH(o.orderdate),
e.empid, e.firstname
)
SELECT * FROM EmpTotal
PIVOT (SUM(total)
FOR mn IN ([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12])
) a;