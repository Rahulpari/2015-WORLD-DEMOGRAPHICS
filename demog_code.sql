-- Understanding Data
SELECT * FROM world.demog
LIMIT 10;

SELECT * FROM world.demog
ORDER BY id DESC
LIMIT 10;

SELECT COUNT(id) FROM world.demog;
SELECT COUNT(DISTINCT name) FROM world.demog;
DESCRIBE world.demog;

-- Secondary Data
-- 3 Secondary data is created: %land; %water & density for each country
DROP Table if exists world.demog01;
CREATE TABLE world.demog01
(
SELECT *,
ROUND((area_land/area*100),2) AS percent_land,
ROUND((area_water/area*100),2) AS percent_water,
ROUND((population/area_land),2) AS density
FROM world.demog
);

SELECT * FROM world.demog01
LIMIT 10;

-- Summarizing the variables
SELECT ROUND(MIN(area),2), ROUND(MAX(area),2), ROUND(AVG(area),2) FROM world.demog01;
SELECT ROUND(MIN(area_land),2), ROUND(MAX(area_land),2), ROUND(AVG(area_land),2) FROM world.demog01;
SELECT ROUND(MIN(area_water),2), ROUND(MAX(area_water),2), ROUND(AVG(area_water),2) FROM world.demog01;
SELECT ROUND(MIN(population),2), ROUND(MAX(population),2), ROUND(AVG(population),2) FROM world.demog01;
SELECT ROUND(MIN(population_growth),2), ROUND(MAX(population_growth),2), ROUND(AVG(population_growth),2) FROM world.demog01;
SELECT ROUND(MIN(birth_rate),2), ROUND(MAX(birth_rate),2), ROUND(AVG(birth_rate),2) FROM world.demog01;
SELECT ROUND(MIN(death_rate),2), ROUND(MAX(death_rate),2), ROUND(AVG(death_rate),2) FROM world.demog01;
SELECT ROUND(MIN(migration_rate),2), ROUND(MAX(migration_rate),2), ROUND(AVG(migration_rate),2) FROM world.demog01;
SELECT ROUND(MIN(percent_land),2), ROUND(MAX(percent_land),2), ROUND(AVG(percent_land),2) FROM world.demog01;
SELECT ROUND(MIN(percent_water),2), ROUND(MAX(percent_water),2), ROUND(AVG(percent_water),2) FROM world.demog01;
SELECT ROUND(MIN(density),2), ROUND(MAX(density),2), ROUND(AVG(density),2) FROM world.demog01;

-- Data of Country with highest population
SELECT * FROM world.demog01
WHERE population = ( SELECT MAX(population) FROM world.demog01);

-- Data of Country with lowest population
SELECT * FROM world.demog01
WHERE population = ( SELECT MIN(population) FROM world.demog01);

-- Data of Country with highest Population Growth
SELECT * FROM world.demog01
WHERE population_growth = ( SELECT MAX(population_growth) FROM world.demog01);

-- Data of Country with lowest Population Growth
SELECT * FROM world.demog01
WHERE population_growth = ( SELECT MIN(population_growth) FROM world.demog01);

-- Data of Country with highest density
SELECT * FROM world.demog01
WHERE density = ( SELECT MAX(density) FROM world.demog01);

-- Data of Country with lowest density
SELECT * FROM world.demog01
WHERE density = ( SELECT MIN(density) FROM world.demog01);