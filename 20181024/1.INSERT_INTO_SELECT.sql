USE db01;

CREATE TABLE dbo.Prdt
(
prdt_id int PRIMARY KEY,
prdt_name nvarchar(50),
price decimal(8, 2)
);

INSERT INTO dbo.Prdt(prdt_id, prdt_name, price)
SELECT productid, productname, unitprice
FROM TSQL.Production.Products;

SELECT * FROM dbo.Prdt;

SELECT *
INTO dbo.PrdtBk
FROM dbo.Prdt;

SELECT *
FROM dbo.Prdt p
INNER JOIN dbo.PrdtBk b
	ON p.prdt_id = b.prdt_id;

UPDATE dbo.Prdt
SET prdt_name = 'XXX', price = 0
WHERE prdt_id = 1;

DELETE FROM dbo.Prdt
WHERE prdt_id = 1;