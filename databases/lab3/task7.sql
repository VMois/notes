USE Lab3;

-- part 1 --
SELECT standing, AVG(age) FROM Student GROUP BY standing

-- part 2 --
SELECT standing, AVG(age) FROM Student WHERE standing != 'JR' GROUP BY standing