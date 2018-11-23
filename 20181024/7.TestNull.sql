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


SELECT c1, c2, c3
FROM dbo.TestNull;

SELECT MAX(c1) AS c1,
MAX(c2) AS c2,
MAX(c3) AS c3
FROM dbo.TestNull
--WHERE c1 > 100;

SELECT c1, c2, c3
FROM dbo.TestNull;

SELECT MIN(c1) AS c1,
MIN(c2) AS c2,
MIN(c3) AS c3
FROM dbo.TestNull;

SELECT c1, c2, c3
FROM dbo.TestNull;

SELECT SUM(c1) AS c1,
SUM(c2) AS c2,
SUM(c3) AS c3
FROM dbo.TestNull;

SELECT c1, c2, c3
FROM dbo.TestNull;

SELECT AVG(c1) AS c1,
AVG(c2) AS c2,
AVG(c3) AS c3
FROM dbo.TestNull;

SELECT c1, c2, c3
FROM dbo.TestNull;

SELECT COUNT(c1) AS c1,
COUNT(c2) AS c2,
COUNT(c3) AS c3,
COUNT(*) AS count_all
FROM dbo.TestNull;

SELECT 1
FROM dbo.TestNull;

SELECT COUNT(1)
FROM dbo.TestNull;

SELECT COUNT(*)
FROM dbo.TestNull;
