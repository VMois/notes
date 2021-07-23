USE Lab1;

-- Approach 1
SELECT DISTINCT country.name, region, a.[Total GDP] FROM country 
INNER JOIN 
(SELECT name, SUM(gdp) as 'Total GDP' FROM country GROUP BY name HAVING SUM(gdp) > 1.4)
as a on a.name = country.name

-- Approach 2
SELECT name, region, SUM(gdp) AS 'Total GDP' FROM country GROUP BY name, region HAVING SUM(gdp) > 1.4

