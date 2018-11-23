USE db01;

DELETE FROM dbo.Prdt
WHERE prdt_id <= 20;

UPDATE dbo.Prdt
SET prdt_name = 'XXX', price = 0
WHERE prdt_id <= 40;

MERGE INTO dbo.Prdt T
USING dbo.PrdtBk S
	ON T.prdt_id = S.prdt_id
WHEN NOT MATCHED BY TARGET THEN
	INSERT(prdt_id, prdt_name, price)
	VALUES(S.prdt_id, S.prdt_name, S.price)
WHEN MATCHED THEN
	UPDATE
		SET prdt_name = S.prdt_name, price = S.price
WHEN NOT MATCHED BY SOURCE THEN
	DELETE;

SELECT * FROM dbo.Prdt p
INNER JOIN dbo.PrdtBk b
	ON p.prdt_id = b.prdt_id;