-- Consulta 1
SELECT * 
FROM city
WHERE CountryCode = 'ESP' AND Population > 1000000 
ORDER BY Population DESC;

-- Consulta 2
SELECT Name
FROM country
WHERE IndepYear IS NULL AND Continent = 'Asia'
ORDER BY Name;

-- Consulta 3
SELECT DISTINCT (Continent), Region
FROM country
ORDER BY Continent, Region;

-- Consulta 4
SELECT Name 
FROM city
WHERE Name LIKE 'New%'
ORDER BY Name; 

-- Consulta 5
SELECT CountryCode, idlanguage
FROM Spoken
WHERE Official = 1
ORDER BY CountryCode;

-- Consulta 6
SELECT coun.code, coun.name 
FROM country coun
JOIN city ci on coun.Code = ci.CountryCode
WHERE ci.name = 'Valencia';

-- Consulta 7
SELECT ci.name, coun.name, ci.Population
FROM country coun
JOIN city ci on coun.Code = ci.CountryCode
WHERE coun.Continent != 'Asia' AND ci.Population > 5000000
ORDER BY ci.name;

-- Consulta 8
SELECT coun.name
FROM country coun
JOIN Spoken s on coun.Code = s.CountryCode
JOIN language l on s.idlanguage = l.idlanguage
WHERE l.LanguageName = 'Spanish' AND s.Official = 1
ORDER BY coun.name;

-- Consulta 9
SELECT DISTINCT l.LanguageName
FROM country coun
JOIN Spoken s ON coun.Code = s.CountryCode
JOIN language l ON s.idlanguage = l.idlanguage
WHERE coun.Region = 'North America' AND s.Official = 1;

-- Consulta 10
SELECT ci.name, ci.Population
FROM country coun
JOIN city ci ON coun.Code = ci.CountryCode
WHERE ci.Population >= coun.Population * 0.3
ORDER BY  ci.name;

-- Consulta 11
SELECT COUNT(*) AS 'total_paises_africanos'
FROM country
WHERE Region = 'Southern Africa';

-- Consulta 12
SELECT COUNT(Region) AS 'total_paises',Region
FROM country
WHERE continent = 'Oceania'
GROUP BY Region;

-- Consulta 13
SELECT SUM(ci.Population) AS 'poblacion_ciudad', co.name
FROM city ci 
JOIN country co on ci.CountryCode = co.Code
WHERE co.Region = 'Southern Europe'
GROUP BY co.Code
ORDER BY co.name;

-- Consulta 14
SELECT SUM(ci.Population) AS 'poblacion_ciudad', co.name, co.Population AS 'poblacion_pais'
FROM city ci 
JOIN country co on ci.CountryCode = co.Code
WHERE co.Region = 'Western Europe'
GROUP BY co.Code
ORDER BY co.name;

-- Consulta 15
SELECT Continent,MAX(SurfaceArea) AS 'maxima superficie', AVG(SurfaceArea) AS 'media_area'
FROM country
GROUP BY continent
ORDER BY AVG(SurfaceArea) DESC;

-- Consulta 16
SELECT co.Region,MAX(ci.Population) AS 'poblacion maxima'
FROM city ci
JOIN country co ON co.Code = ci.CountryCode
WHERE co.Continent = 'Europe'
GROUP BY co.Region;

-- Consulta 17
SELECT continent, SUM(SurfaceArea) AS 'Superficie del pais'
FROM country
GROUP BY continent;

-- Consulta 18
SELECT region, (SUM(GNP)/ SUM(Population)) AS 'media GNP'
FROM country
GROUP BY region
ORDER BY (SUM(GNP)/ SUM(Population)) DESC;

-- Consulta 19
SELECT SUM(ci.Population) AS 'hispanohablantes'
FROM city ci
JOIN spoken s ON ci.CountryCode = s.CountryCode
WHERE s.idLanguage = 389;

-- Consulta 20
SELECT DISTINCT co.Region
FROM Country co
JOIN city ci ON ci.CountryCode = co.Code
WHERE co.continent = 'Europe' 
	AND ci.population < (SELECT AVG(Population)
						FROM city);
                        
-- Consulta a)
SELECT co.Name , SUM(s.Official)
FROM country co
JOIN spoken s on co.Code = s.CountryCode
GROUP BY co.Name
HAVING SUM(s.Official)>2;

-- Consulta b)
SELECT name, Population
FROM country
WHERE continent = 'Europe'
	AND population > (SELECT AVG(population)
						FROM country
						WHERE continent = 'Asia');