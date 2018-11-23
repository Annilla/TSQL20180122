USE TSQL;

SELECT orderid, orderdate, shipperid
FROM Sales.Orders;

SELECT DISTINCT shipperid
FROM Sales.Orders;

SELECT orderid, orderdate, shipperid,
CASE shipperid
WHEN 1 THEN N'海運'
WHEN 2 THEN N'空運'
WHEN 3 THEN N'DHL'
ELSE N'未知'
END AS shippername
FROM Sales.Orders;


SELECT productid, productname, unitprice,
CASE
WHEN unitprice < 10 THEN N'低價位'
WHEN unitprice < 20 THEN N'中價位'
WHEN unitprice >= 20 THEN N'高價位'
ELSE N'未知'
END AS pricetype
FROM Production.Products
ORDER BY unitprice;