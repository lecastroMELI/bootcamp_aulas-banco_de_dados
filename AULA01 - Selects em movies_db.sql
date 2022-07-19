USE movies_db;

-- Mostrar todos os registros da tabela filmes.
SELECT * 
FROM movies;

-- Mostrar nome, sobrenome e classificação
SELECT first_name, last_name, rating
FROM actors;

-- Mostrar o título de todas as séries e use alias para que tanto o nome da tabela quanto o campo sejam em Português.
-- DÁ PRA FAZER COM OU SEM O AS
SELECT séries.title AS "Título"
FROM series AS Séries;

-- mostrar nome e sobrenome dos atores cuja classificação é superior a 7,5
SELECT first_name AS "Nome", last_name AS "Sobrenome", rating
FROM actors
WHERE rating > 7.5;

-- Mostrar o título dos filmes, classificação e prêmios, onde a avaliação é maior que 7.5 e mais que dois prêmios
SELECT title, rating, awards
FROM movies
WHERE rating > 7.5 AND awards > 2;

-- Título e classificação ordenados de forma crescente pela classificação
SELECT 
    title, rating
FROM
    movies
ORDER BY rating ASC;

-- Título e classificação ordenados de forma decrescente pela classificação
SELECT 
    title, rating
FROM
    movies
ORDER BY rating DESC;

-- 3 PRIMEIROS FILMES
SELECT title
FROM movies
LIMIT 3;

-- Mostrar 5 primeiros filmes com a classificação mais alta
SELECT title, rating
FROM movies
ORDER BY rating DESC
LIMIT 5;

SELECT first_name
FROM actors
LIMIT 10;

-- Mostrar Título e a Classificação de todos os filmes cujo título é Toy Story
SELECT title, rating
FROM movies
WHERE title LIKE "%STORY%";

-- Mostrar todos os atores que tem o mesmo nome SAM
SELECT 
	first_name AS "Nome", 
    last_name AS "Sobrenome"
FROM
	actors
WHERE
	first_name LIKE "SAM%";

-- Mostrar o título dos flmes que saíram entre 2004 e 2008
SELECT title, release_date
FROM movies
WHERE year(release_date) >= 2004 AND year(release_date) <= 2008;

-- OUTRA FORMA SERIA 
SELECT title, release_date
FROM movies
WHERE year(release_date) BETWEEN 2004 AND 2008;

SELECT title AS "TÍTULO", release_date AS "DATA", awards AS "PRÊMIOS"
FROM movies
WHERE rating > 3 AND awards > 1 AND year(release_date) BETWEEN 1988 AND 2009
ORDER BY rating;

-- INSERINDO
-- Quando não é explicitada a ordem dos campos, para inserir valores, as informações deverão seguir a ordem que está no banco
INSERT INTO actors
VALUES (null, null, null, "Wonder", "Woman", 10.0, 1);

INSERT INTO actors
VALUES (null, null, null, "Mulher", "Leopardo", 10.0, 1);

-- ATUALIZANDO
UPDATE actors
SET last_name = "Woman Castro"
WHERE id = 50;

-- APAGANDO
DELETE FROM actors
WHERE id = 51;

-- VERIFICANDO O ID APOS APAGAR E INSERIR NOVO REGISTRO, o próximo será 53.
INSERT INTO actors
VALUES (null, null, null, "Mulher", "Maravilha", 10.0, 5);