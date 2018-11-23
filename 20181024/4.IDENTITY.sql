USE db01;

CREATE TABLE dbo.AutoNumber2
(
id int PRIMARY KEY IDENTITY(1,1),
data nvarchar(50)
);

GO

INSERT INTO dbo.AutoNumber2(data)
VALUES('AAA'),('BBB'),('CCC');

SELECT * FROM dbo.AutoNumber2;

GO

TRUNCATE TABLE dbo.AutoNumber2;

GO

SET IDENTITY_INSERT dbo.AutoNumber2 ON;

INSERT INTO dbo.AutoNumber2(id, data)
VALUES(1, 'AAA'), (2, 'BBB'), (3, 'CCC');

SET IDENTITY_INSERT dbo.AutoNumber2 OFF


SELECT * FROM dbo.AutoNumber2;

SELECT * FROM TSQL.Sales.Orders;


TRUNCATE TABLE dbo.AutoNumber2;

SET IDENTITY_INSERT dbo.AutoNumber2 ON;

INSERT INTO dbo.AutoNumber2(id, data)
SELECT orderid, shipname
FROM TSQL.Sales.Orders

SET IDENTITY_INSERT dbo.AutoNumber2 OFF

SELECT * FROM dbo.AutoNumber2

SELECT SCOPE_IDENTITY();

DBCC CHECKIDENT('dbo.AutoNumber2', RESEED, 0)

INSERT INTO dbo.AutoNumber2(data)
VALUES('Test');

SELECT * FROM dbo.AutoNumber2;