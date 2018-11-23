USE db01;

GO
INSERT INTO dbo.TestFloat(n1, n2, n3)
VALUES(0.1, 0.1, 0.1);
GO 1024

SELECT * FROM dbo.TestFloat;

SELECT SUM(n1), SUM(n2), SUM(n3)
FROM dbo.TestFloat;