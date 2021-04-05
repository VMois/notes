Use Lab3;

SELECT cname as 'name' FROM Enrolled GROUP BY cname HAVING COUNT(*) >= 5
UNION
SELECT name FROM Class WHERE room = 'R128'