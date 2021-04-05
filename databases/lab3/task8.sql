USE Lab3;

SELECT s.sname FROM Student as s
LEFT JOIN Enrolled AS e ON s.snum = e.snum
GROUP BY s.sname 
HAVING COUNT(e.snum) = (SELECT MAX(grouped.c) FROM (SELECT snum, COUNT(cname) as 'c' FROM Enrolled GROUP BY snum) as grouped)

