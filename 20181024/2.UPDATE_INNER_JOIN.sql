USE db01;


SELECT *
FROM dbo.Prdt p
INNER JOIN dbo.PrdtBk b
	ON p.prdt_id = b.prdt_id;

--disaster
UPDATE dbo.Prdt
SET prdt_name = 'XXX', price = 0
--WHERE prdt_id = 1;

/*
DELETE FROM dbo.Prdt
WHERE prdt_id = 1;
*/
UPDATE dbo.Prdt
SET prdt_name = b.prdt_name, price = b.price
--SELECT *
FROM dbo.Prdt p
INNER JOIN dbo.PrdtBk b
	ON p.prdt_id = b.prdt_id;

SELECT *
FROM dbo.Prdt p
INNER JOIN dbo.PrdtBk b
	ON p.prdt_id = b.prdt_id;