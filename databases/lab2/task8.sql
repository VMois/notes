USE master;

SELECT name, region, population FROM country WHERE year = 2010 and population = (SELECT MAX(population) FROM country where year = 2010)