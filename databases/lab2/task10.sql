USE master;

SELECT DISTINCT country.name, region, a.[Total GDP] FROM country 
INNER JOIN 
(SELECT name, SUM(gdp) as 'Total GDP' FROM country GROUP BY name HAVING SUM(gdp) > 1.4)
as a on a.name = country.name

