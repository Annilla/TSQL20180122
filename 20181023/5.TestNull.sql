USE db01;

CREATE TABLE dbo.TestNull
(
c1 float,
c2 float,
c3 float
);

INSERT INTO dbo.TestNull(c1, c2, c3)
VALUES(90, 80, 70),
(80, NULL, 50),
(50, NULL, NULL),
(NULL, NULL, NULL);

SELECT * FROM dbo.TestNull;

SELECT * FROM dbo.TestNull
WHERE c1 >= 60;

SELECT * FROM dbo.TestNull
WHERE c1 < 60;

SELECT * FROM dbo.TestNull
WHERE c1 = NULL;

SELECT * FROM dbo.TestNull
WHERE c1 IS NULL;

SELECT * FROM dbo.TestNull
WHERE c1 IS NOT NULL;

SELECT c1, c2, c3, 
c1 + c2 + c3 AS total
FROM dbo.TestNull;

SELECT c1, c2, c3, 
ISNULL(c1,0) + ISNULL(c2,0) + ISNULL(c3,0) AS total
FROM dbo.TestNull;

SELECT c1, c2, c3, 
(c1 + c2 )/ c3 AS total
FROM dbo.TestNull;

SELECT c1, c2, c3, 
(ISNULL(c1,0) + ISNULL(c2,0)) / ISNULL(c3,0) AS total
FROM dbo.TestNull;