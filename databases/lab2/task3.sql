USE Lab1;

SELECT name, region FROM country WHERE area BETWEEN 2000000 AND 5000000 AND year = 2002 ORDER BY gdp DESC