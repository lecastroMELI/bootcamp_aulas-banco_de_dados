USE movies_db;

SELECT * FROM genres; -- 12
SELECT * FROM movies; -- 21

SELECT COUNT(id) FROM movies; -- 21
SELECT COUNT(*) FROM movies; -- 21

-- CONSULTAR DUAS TABELAS AO MESMO TEMPO

-- FORMA ERRADA
-- PRODUTO CARTESIANO (SQL ALGEBRA RELACIONAL, TEORIA DE CONJUTOS)
SELECT * FROM movies, genres; -- 252
SELECT COUNT(*) FROM movies, genres; -- 252
-- está trazendo as combinações entre cada combinação


-- FORMA CORRETA
SELECT * FROM movies, genres
WHERE movies.genre_id = genres.id;


-- FILMES CUJA COLUNA GENERO SEJA NULO
SELECT title
FROM movies
WHERE genre_id IS NULL;


-- COM JOIN 

-- OBS.: Natural join não usa o camando ON em diante, desde que os campos comparado tenham o mesmo nome e sejam correspondentes

-- LISTA OS FILMES QUE POSSUEM CLASSIFICAÇÃO E SEUS NOMES DE CLASSIFICAÇÃO
SELECT *
FROM movies
JOIN genres ON movies.genre_id = genres.id;

SELECT *
FROM movies AS M
INNER JOIN genres AS G
WHERE G.id = M.genre_id;

-- LISTA TODOS OS FILMES E SEUS NOMES CLASSIFICAÇÃO, INCLUSIVE SEM CLASSIFICAÇÃO (NULL)
SELECT *
FROM movies
LEFT JOIN genres ON movies.genre_id = genres.id;

-- LISTA TODAS AS CLASSIFICAÇÕES E OS FILMES CORRESPONDENTES
SELECT *
FROM movies
RIGHT JOIN genres ON movies.genre_id = genres.id;
