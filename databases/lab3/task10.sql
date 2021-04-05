USE Lab3;

SELECT age, standing FROM Student GROUP BY age, standing ORDER BY COUNT(*) DESC