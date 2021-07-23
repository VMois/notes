USE Lab1;

/* Initial check */
/*SELECT name, population + 15000 FROM country WHERE year = 2007 and area < 10000;*/

--UPDATE country SET population = population + 15000 WHERE year = 2007 and area < 10000;

/* Post check */
SELECT name, population FROM country WHERE year = 2007 and area < 10000;