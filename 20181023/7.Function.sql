USE TSQL;

SELECT ROUND(12345.6789, 2),
ROUND(12345.6789, -3),
ROUND(12345.6789, 2, 1);

SELECT productid, SUM(qty*unitprice) AS total,
ROUND(SUM(qty*unitprice), 0) AS [ROUND(SUM)],
SUM(ROUND(qty*unitprice, 0)) AS [SUM(ROUND)],
ROUND(SUM(qty*unitprice), 0) - SUM(ROUND(qty*unitprice, 0)) 
FROM Sales.OrderDetails
GROUP BY productid;

SELECT LEFT('Microsoft SQL Server', 9),
SUBSTRING('Microsoft SQL Server', 11, 3),
RIGHT('Microsoft SQL Server', 6);


SELECT CHARINDEX('SQL', 'Microsoft SQL Server SQL SQL'); --11
SELECT CHARINDEX('SQL', 'Microsoft SQL Server SQL SQL', 12); --22
SELECT CHARINDEX('SQL', 'Microsoft SQL Server SQL SQL', 23); --26
SELECT CHARINDEX('SQL', 'Microsoft SQL Server SQL SQL', 27); --0

SELECT REPLACE('Learning about T-SQL string functions T-SQL T-SQL', 'T-SQL', 'Transact-SQL');

SELECT UPPER('Microsoft SQL Server') AS [UPPER],
LOWER('Microsoft SQL Server') AS [lower];

SELECT REPLICATE('ABC', 10)

SELECT RTRIM('   ABC   '),
LTRIM('   ABC   '),
LTRIM(RTRIM('   ABC   '));

SELECT STUFF('A123456789', 1, 6, 'XXXXXX');

USE dbEmp
--Code Page 950

--USE TSQL;
SELECT '中文字'   --950
SELECT N'中文字'  --65001

SELECT CAST('中文字' AS varbinary(20))
SELECT CAST(N'中文字' AS varbinary(20))
SELECT CAST('   中文字abc   ' AS varbinary(20))

SELECT LEN('   中文字abc   ');
SELECT LEN(N'   中文字abc   ');
SELECT DATALENGTH('   中文字abc   ');
SELECT DATALENGTH(N'   中文字abc   ');


SELECT GETDATE();
SELECT CURRENT_TIMESTAMP;
SELECT GETUTCDATE();
SELECT SYSDATETIME()
SELECT SYSDATETIMEOFFSET()

SELECT GETDATE();



USE db01;

CREATE TABLE dbo.DataLog
(
id int PRIMARY KEY,
data_log nvarchar(100),
add_time datetime DEFAULT GETDATE()
);

INSERT INTO dbo.DataLog(id, data_log)
VALUES(1, 'AAA');
WAITFOR DELAY '0:0:10';
INSERT INTO dbo.DataLog(id, data_log)
VALUES(2, 'BBB');

SELECT * FROM dbo.DataLog;

SELECT YEAR(GETDATE()) AS yr,
MONTH(GETDATE()) AS mn,
DAY(GETDATE()) AS dy;

SELECT YEAR('2018-3-12')

SELECT DATEPART(YEAR, GETDATE()) AS yr,
DATEPART(MONTH, GETDATE()) AS mn,
DATEPART(DAY, GETDATE()) AS dy,
DATEPART(WEEK, GETDATE()) AS wk_no,
DATEPART(WEEKDAY, GETDATE()) AS wk_day,
DATEPART(HOUR, GETDATE()) AS hh,
DATEPART(MINUTE, GETDATE()) AS nn,
DATEPART(SECOND, GETDATE()) AS ss;

SELECT * FROM sys.syslanguages;
SET LANGUAGE N'繁體中文';
SET LANGUAGE N'us_english'
SELECT DATENAME(YEAR, GETDATE()) AS yr,
DATENAME(MONTH, GETDATE()) AS mn,
DATENAME(DAY, GETDATE()) AS dy,
DATENAME(WEEK, GETDATE()) AS wk_no,
DATENAME(WEEKDAY, GETDATE()) AS wk_day,
DATENAME(HOUR, GETDATE()) AS hh,
DATENAME(MINUTE, GETDATE()) AS nn,
DATENAME(SECOND, GETDATE()) AS ss;

SELECT DATEDIFF(YEAR, '2018-12-31', '2019-1-1'),
DATEDIFF(MONTH, '2018-12-31', '2019-1-1'),
DATEDIFF(DAY, '2018-12-31', '2019-1-1'),
DATEDIFF(HOUR, '2018-12-31', '2019-1-1'),
DATEDIFF(MINUTE, '2018-12-31', '2019-1-1'),
DATEDIFF(SECOND, '2018-12-31', '2019-1-1');

SELECT DATEADD(YEAR, 6, '2018-3-12'),
DATEADD(MONTH, 6, '2018-3-31'),
DATEADD(DAY, 6, '2018-3-12'),
DATEADD(HOUR, 6, '2018-3-12'),
DATEADD(MINUTE, 6, '2018-3-12'),
DATEADD(SECOND, 6, '2018-3-12');

SELECT 3 + 4;
SELECT '3' + '4';
SELECT 3 + '4';
SELECT 3 + 'a';

SELECT CONVERT(varchar(1), 3) + 'a';
SELECT '3' + 'a';

USE TSQL;

SELECT CONVERT(varchar(5), productid) +'-' + productname
FROM Production.Products
ORDER BY productid;

SELECT CAST(productid AS varchar(5)) +'-' + productname
FROM Production.Products
ORDER BY productid;


SELECT CONCAT(productid, '-', productname, ':', unitprice)
FROM Production.Products;


SELECT FORMAT(12345.6789, 'c', 'zh-tw'),
FORMAT(12345.6789, 'c', 'en-us'),
FORMAT(12345.6789, 'c', 'en-gb'),
FORMAT(12345.6789, 'c', 'de-de'),
FORMAT(12345.6789, 'c', 'ja-jp');


SELECT FORMAT(12345.6789, '#,##0.00');

SELECT FORMAT(GETDATE(), 'd', 'zh-tw'),
FORMAT(GETDATE(), 'd', 'en-us'),
FORMAT(GETDATE(), 'd', 'en-gb'),
FORMAT(GETDATE(), 'd', 'de-de'),
FORMAT(GETDATE(), 'd', 'ja-jp');

SELECT FORMAT(GETDATE(), 'yyyy-MM-dd MMM MMMM ddd dddd', 'zh-tw'),
FORMAT(GETDATE(), 'yyyy-MM-dd MMM MMMM ddd dddd', 'en-us'),
FORMAT(GETDATE(), 'yyyy-MM-dd MMM MMMM ddd dddd', 'en-gb'),
FORMAT(GETDATE(), 'yyyy-MM-dd MMM MMMM ddd dddd', 'de-de'),
FORMAT(GETDATE(), 'yyyy-MM-dd MMM MMMM ddd dddd', 'ja-jp');

SELECT DATETIME2FROMPARTS(2018, 3, 12, 12, 30, 0, 0, 0);
SELECT DATEFROMPARTS(2018, 3, 12);
SELECT TIMEFROMPARTS(12, 30, 0, 0, 0);
SELECT DATETIMEFROMPARTS(2018, 3, 12, 12, 30, 0, 0);

SELECT EOMONTH(GETDATE()),
EOMONTH(GETDATE(), 1),
EOMONTH(GETDATE(), 2),
EOMONTH(GETDATE(), 3),
EOMONTH(GETDATE(), -1),
EOMONTH(GETDATE(), -2),
EOMONTH(GETDATE(), -3);


SELECT CONVERT(varchar(20), GETDATE(), 110),
CONVERT(varchar(20), GETDATE(), 111),
CONVERT(varchar(20), GETDATE(), 112),
 CONVERT(varchar(20), GETDATE(), 10),
CONVERT(varchar(20), GETDATE(), 11),
CONVERT(varchar(20), GETDATE(), 12);

SELECT CAST('abc' AS int)
SELECT TRY_CAST('abc' AS int)


SELECT productid, productname, unitprice,
IIF(unitprice<10, N'低價位',	
	IIF(unitprice < 20, N'中價位',
		IIF(unitprice >= 20, N'高價位', N'未知')
		)
	) AS price_type
FROM Production.Products
ORDER BY unitprice;

SELECT orderid, orderdate, shipperid,
CHOOSE(shipperid, N'海運', N'空運', N'DHL') AS shippername
FROM Sales.Orders
ORDER BY shipperid;