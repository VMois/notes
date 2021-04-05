USE Lab3;

SELECT f.fname FROM Class as c
JOIN Faculty as f ON c.fid = f.fid GROUP BY f.fname 
HAVING COUNT(DISTINCT c.room) >= (SELECT COUNT(DISTINCT c.room) FROM Enrolled as e JOIN Class as c ON e.cname = c.name)
