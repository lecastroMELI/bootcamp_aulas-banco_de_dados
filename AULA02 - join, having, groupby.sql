SELECT *
FROM series;

SELECT COUNT(title)
FROM series;

-- QUANTIDADE DE TEMPORADAS CADASTRADAS
SELECT COUNT(*)
FROM seasons;

-- --------- FUNÇÕES DE AGREGAÇÃO, JOIN, GROUP BAY, HAVING --------- --

-- QUATIDADE DE TEMPORADA EM CADA SÉRIE
SELECT series.title, COUNT(*) AS "Temporadas"
FROM seasons
INNER JOIN series ON series.id = seasons.serie_id
GROUP BY series.id;

-- QUANTIDADE DE TEMPORADA PARA A SÉRIE "THE WALKING DEAD"
SELECT series.title, COUNT(*) AS "Temporadas"
FROM seasons
INNER JOIN series ON series.id = seasons.serie_id
WHERE series.title = "The Walking Dead"
GROUP BY series.id;

SELECT series.title, COUNT(*) AS "Temporadas"
FROM seasons
INNER JOIN series ON series.id = seasons.serie_id
WHERE series.title LIKE "Game%" OR series.title LIKE "%BANG%"
GROUP BY series.id;

-- QUAIS SÉRIES TEM MAIS DE 5 TEMPORADAS
SELECT series.title, COUNT(*) AS "Temporadas"
FROM seasons
INNER JOIN series ON series.id = seasons.serie_id
GROUP BY series.id
HAVING `TEMPORADAS` > 5;

SELECT series.title, COUNT(*) AS "Temporadas"
FROM seasons
INNER JOIN series ON series.id = seasons.serie_id
GROUP BY series.id
HAVING `TEMPORADAS` > 5
ORDER BY `TEMPORADAS`;

-- QUAIS AS 3 SÉRIRES COM MAIOR NÚMERO DE TEMPORADAS
SELECT series.title, COUNT(*) AS "Temporadas"
FROM seasons
INNER JOIN series ON series.id = seasons.serie_id
GROUP BY series.id
ORDER BY `TEMPORADAS` DESC
LIMIT 3;
