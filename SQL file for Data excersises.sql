/*QUERY DATA EXCERSIES:*/


/*I use the database "world"*/


/*Task 1)*/
SELECT *
FROM country
WHERE population > (SELECT AVG(population) FROM country);


/*Task 2)*/
SELECT countrylanguage.`Language`, SUM(country.population/100*countrylanguage.Percentage) AS SpeakingTotal 
FROM country
INNER JOIN countrylanguage
ON country.`Code` = countrylanguage.CountryCode
GROUP BY `Language`
ORDER BY SpeakingTotal DESC
LIMIT 5;


/*Task 3)*/
SELECT `name` AS CountryName, (Population/SurfaceArea) AS PopulationDensity
FROM country
WHERE SurfaceArea > 0 AND Population > 0;


/*Task 4)*/
SELECT country.`name` AS CountryName
FROM country
LEFT JOIN city
ON country.Code = city.CountryCode
WHERE city.`name` IS NULL
GROUP BY country.`name`; 


/*Task 5)*/
SELECT Continent, AVG(LifeExpectancy) AS AverageLifeExpectancy
FROM country
GROUP BY Continent
ORDER BY AverageLifeExpectancy DESC;


/*Task 6)*/
/* For locating population of Japan:
SELECT Population
FROM country
WHERE `name` = "Japan";  = 126714000*/

SELECT country.`name` AS CountryName, city.`name` AS CityName, city.Population
FROM city
INNER JOIN country
WHERE city.Population BETWEEN 126714000*0.9 AND 126714000*1.1;


/*Task 7)*/
SELECT RANK() OVER (ORDER BY GNP DESC) AS `Rank`, `name` AS CountryName, GNP
FROM country
ORDER BY GNP DESC;


/*Task 8)*/
/*Assuming neighboor realtion is in a seperate neighbor table:*/
SELECT country.`Code`, country.`name` AS CountryName, country.GNP
FROM country
WHERE country.GNP > (
    SELECT MAX(country.GNP)
    FROM country
    JOIN neighbors
    ON country.`Code` = neighbors.neighbor_code
    WHERE neighbors.country_code = country.`Code`);


/*Task 9)*/
SELECT `Language`, COUNT(`Language`) AS CountriesSpeakingLanguage
FROM countrylanguage
GROUP BY `Language`
ORDER BY CountriesSpeakingLanguage DESC;


/*Task 10)*/
SELECT country.`Name` AS CountryName, city.`Name` AS CityName, country.Population AS CountryPopulation, city.Population AS CityPopulation, (country.Population - city.Population) AS Difference
FROM country
INNER JOIN city
ON country.`Code` = city.CountryCode
WHERE country.Population < city.Population;