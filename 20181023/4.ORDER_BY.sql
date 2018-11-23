USE TSQL;

SELECT categoryid, productid, productname, unitprice
FROM Production.Products
ORDER BY unitprice;

SELECT categoryid, productid, productname, unitprice
FROM Production.Products
ORDER BY unitprice ASC;

SELECT categoryid, productid, productname, unitprice
FROM Production.Products
ORDER BY unitprice DESC;


SELECT categoryid, productid, productname, unitprice
FROM Production.Products
ORDER BY categoryid ASC, unitprice DESC;

SELECT categoryid, productid, productname, unitprice
FROM Production.Products
ORDER BY 4

SELECT TOP(10)
* FROM Production.Products;

SELECT TOP(10)
productid, productname FROM Production.Products;

SELECT TOP(10)
productid, productname, unitprice
FROM Production.Products
ORDER BY unitprice DESC;

SELECT TOP(10) PERCENT
productid, productname, unitprice
FROM Production.Products
ORDER BY unitprice DESC;

SELECT TOP(20)
productid, productname, unitprice
FROM Production.Products
ORDER BY unitprice DESC;

SELECT TOP(15) WITH TIES
productid, productname, unitprice
FROM Production.Products
ORDER BY unitprice DESC;

SELECT orderid, orderdate, empid, custid
FROM Sales.Orders
ORDER BY orderid
OFFSET 80 ROWS
FETCH NEXT 20 ROWS ONLY;

SELECT orderid, orderdate, empid, custid
FROM Sales.Orders
ORDER BY orderid
OFFSET 0 ROWS
FETCH NEXT 20 ROWS ONLY;