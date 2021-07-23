USE Lab1;

SELECT TOP 3 name, SUM(gdp) as 'Total GDP' FROM country WHERE region = 'Asia' GROUP BY name ORDER BY 'Total GDP' ASC