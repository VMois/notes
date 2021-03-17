USE  master;

/* Check before */
/*SELECT COUNT(*) FROM country*/

DELETE FROM country WHERE gdp < 0

/* Check after */
/*SELECT COUNT(*) FROM country*/