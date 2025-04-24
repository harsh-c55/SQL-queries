-- Top 5 most populous cities
SELECT Name, Population
FROM city
ORDER BY Population DESC
LIMIT 5;

-- COUNTRY WITH POPULATION MORE THAN 10000 IN ASCENDING ORDER
SELECT Name, Population 
From city
where Population>10000
ORDER BY Population asc
LIMIT 10;

select DISTRICT, COUNTRYCODE, NAME, POPULATION
FROM CITY
WHERE POPULATION>10000000;


-- Population by region
SELECT Region, SUM(Population) AS TotalPopulation
FROM country
GROUP BY Region
ORDER BY TotalPopulation DESC;




-- INNER JOIN: List cities with their country names
SELECT city.Name AS City, country.Name AS Country
FROM city
INNER JOIN country ON city.CountryCode = country.Code ;


-- LEFT JOIN: All countries and their capital city name (if exists)
SELECT country.Name, city.Name AS Capital
FROM country
LEFT JOIN city ON country.Capital = city.ID;

-- RIGHT JOIN: Languages used in countries (if your DB supports RIGHT JOIN)
SELECT l.Language, c.Name AS Country
FROM country c
RIGHT JOIN countrylanguage l ON c.Code = l.CountryCode;


-- Countries with population above the average
SELECT Name
FROM country
WHERE Population > (
    SELECT AVG(Population) FROM country
);


-- Average population per continent
SELECT Continent, AVG(Population) AS AvgPopulation
FROM country
GROUP BY Continent;

-- Total GNP by continent
SELECT Continent, SUM(GNP) AS TotalGNP
FROM country
GROUP BY Continent;




-- View of official languages per country
DROP VIEW IF EXISTS official_languages;


CREATE OR REPLACE VIEW official_languages AS
SELECT c.Name AS Country, l.Language
FROM country c
JOIN countrylanguage l ON c.Code = l.CountryCode
WHERE l.IsOfficial = 'T';

select * from official_languages;
-- This should be done by an admin:
GRANT CREATE VIEW ON world.* TO 'root'@'localhost';

-- Add index to speed up lookups
CREATE INDEX idx_country_code ON city(CountryCode);
CREATE INDEX idx_language_country ON countrylanguage(CountryCode);


DESCRIBE city;

drop city , if exists city;








