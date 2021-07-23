USE Lab1;

SELECT name, area, gdp FROM country WHERE year = 2009 and population > 10000000 and region like '%Europe%'