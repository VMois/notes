USE Lab3;

SELECT TOP 1 s.age as 'Max Age' from Student as s
LEFT JOIN Enrolled as e ON s.snum = e.snum
LEFT JOIN Class as c ON e.cname = c.name
LEFT JOIN Faculty as f ON c.fid = f.fid 
WHERE f.fname = 'Ivana Teach' OR s.major = 'History'
ORDER BY s.age DESC
