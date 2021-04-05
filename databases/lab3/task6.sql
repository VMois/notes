USE Lab3;

SELECT f.fname, COUNT(s.snum) FROM Faculty as f
LEFT JOIN Class AS c ON f.fid = c.fid
LEFT JOIN Enrolled AS e ON c.name = e.cname
LEFT JOIN Student AS s ON s.snum = e.snum
GROUP BY f.fname

