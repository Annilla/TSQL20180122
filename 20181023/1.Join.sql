USE EmpOrd;

SELECT * FROM dbo.Emp;
SELECT * FROM dbo.Ord;

SELECT *
FROM dbo.Emp e
INNER JOIN dbo.Ord o
	ON e.emp_id = o.emp_id;


SELECT *
FROM dbo.Ord o
INNER JOIN dbo.Emp e
	ON e.emp_id = o.emp_id;

SELECT e.emp_id, e.emp_name, o.amount
FROM dbo.Ord o
INNER JOIN dbo.Emp e
	ON e.emp_id = o.emp_id;


SELECT e.emp_id, e.emp_name, SUM(o.amount) AS total
FROM dbo.Ord o
INNER JOIN dbo.Emp e
	ON e.emp_id = o.emp_id
GROUP BY e.emp_id, e.emp_name;

INSERT INTO dbo.Emp(emp_id, emp_name)
VALUES(4, 'Rookie');

INSERT INTO dbo.Ord(ord_id, emp_id, amount)
VALUES(9, 99, 9999);

SELECT * FROM dbo.Emp;
SELECT * FROM dbo.Ord;

SELECT *
FROM dbo.Emp e
INNER JOIN dbo.Ord o
	ON e.emp_id = o.emp_id;


SELECT *
FROM dbo.Ord o
INNER JOIN dbo.Emp e
	ON e.emp_id = o.emp_id;

SELECT e.emp_id, e.emp_name, o.amount
FROM dbo.Ord o
INNER JOIN dbo.Emp e
	ON e.emp_id = o.emp_id;


SELECT e.emp_id, e.emp_name, SUM(o.amount) AS total
FROM dbo.Ord o
INNER JOIN dbo.Emp e
	ON e.emp_id = o.emp_id
GROUP BY e.emp_id, e.emp_name
ORDER BY total;


SELECT *
FROM dbo.Emp e
LEFT OUTER JOIN dbo.Ord o
	ON e.emp_id = o.emp_id;



SELECT e.emp_id, e.emp_name, SUM(o.amount) AS total
FROM dbo.Emp e
LEFT JOIN dbo.Ord o
	ON e.emp_id = o.emp_id
GROUP BY e.emp_id, e.emp_name
ORDER BY total;




SELECT *
FROM dbo.Emp e
INNER JOIN dbo.Ord o
	ON e.emp_id = o.emp_id;

SELECT *
FROM dbo.Emp e
LEFT OUTER JOIN dbo.Ord o
	ON e.emp_id = o.emp_id;

SELECT *
FROM dbo.Emp e
RIGHT OUTER JOIN dbo.Ord o
	ON e.emp_id = o.emp_id;

SELECT *
FROM dbo.Emp e
FULL OUTER JOIN dbo.Ord o
	ON e.emp_id = o.emp_id;

--ANSI 89

SELECT *
FROM dbo.Emp e, dbo.Ord o
WHERE e.emp_id = o.emp_id;

--ANSI 92
SELECT *
FROM dbo.Emp e
INNER JOIN dbo.Ord o
	ON e.emp_id = o.emp_id;

SELECT *
FROM dbo.Emp e, dbo.Ord o;


SELECT *
FROM dbo.Emp 
CROSS JOIN dbo.Ord;

SELECT *
FROM dbo.Emp e1
CROSS JOIN dbo.Emp e2;