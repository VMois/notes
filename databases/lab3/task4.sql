USE Lab3;

SELECT s.sname from Enrolled as e
LEFT JOIN Student as s ON s.snum = e.snum
LEFT JOIN Class as c ON e.cname = c.name
GROUP BY s.sname, c.meets_at HAVING COUNT(*) > 1
