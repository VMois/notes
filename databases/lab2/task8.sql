USE master;

-- Approach 1
SELECT name, region, population FROM country WHERE /*year = 2010 AND*/ population = (SELECT MAX(population) FROM country where year = 2010)

-- Approach 2
SELECT TOP 1 name, region, population from country WHERE year = 2010 ORDER BY population DESC