USE Lab3;

SELECT s.sname FROM Faculty as f 
JOIN Class as c ON f.fid = c.fid
JOIN Enrolled as e ON c.name = e.cname
JOIN Student as s ON e.snum = s.snum WHERE f.fname = 'Ivana Teach' and s.standing = 'JR'