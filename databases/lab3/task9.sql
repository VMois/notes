USE Lab3;

SELECT sname as 'Lazy students' FROM Student
EXCEPT
SELECT s.sname FROM Enrolled as e
JOIN Student as s ON e.snum = s.snum