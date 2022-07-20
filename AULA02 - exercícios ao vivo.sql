-- ADICIONE UM FILME A TABELA DE FILMES.
INSERT INTO movies VALUES(null, NOW(), null, "Wonder Woman 84", 10, 5, "2020-12-25", 184, 5);

-- ADICIONE UM GENENOR A TABELA DE GENEROS
INSERT INTO genres VALUES(null, NOW(), null, "Heróis", 19, 1);

-- ASSOCIE O FILME INSERIDO NO ITEM 1 COM O GENERO CRIADO NO ITEM 2
-- Update deve sempre usar a chave primária, por questões de segurança
UPDATE movies
SET genre_id = 16, updated_at = NOW()
WHERE id = 22;

-- MODIFIQUE A TABELA ATORES PARA QUE PELO MENOS UM ATOR TENHA O FILME ADICIONADO NO ITEM 1 COMO FAVORITO
UPDATE actors
SET favorite_movie_id = 22, updated_at = NOW()
WHERE id IN (1,2,3);

-- CRIE UMA TABELA TEMPORÁRIA DA TABELA FILMES
CREATE TEMPORARY TABLE movies_copy
SELECT * FROM movies;

-- ELIMINE DA TABELA TEMPORÁRIA TODOS OS FILMES QUE GANHARAM MENOS DE 5 PREMIOS
-- Desligar o Safe Delete/Update em Preferences > SQL Editor > Desmarcar a última opção
DELETE FROM movies_copy
WHERE awards < 5;

-- OBTENHA A LISTA DE TODOS OS GÊNEROS QUE POSSUEM PELO MENOS UM FILME
-- Desta forma traz os nomes com repetições, proporcionalmente com a combinação de cada filme
SELECT name
FROM genres
INNER JOIN movies ON genres.id = movies.genre_id;

-- Para corrigir usar DISTINCT
SELECT DISTINCT name
FROM genres
INNER JOIN movies ON genres.id = movies.genre_id;

-- OBTENHA A LISTA DE ATORES CUJO O FILME FAVORITO GANHOU AO MENOS 3 PRÊMIOS
SELECT first_name, last_name
FROM actors
INNER JOIN  movies ON actors.favorite_movie_id = movies.id
WHERE movies.awards > 3;

-- CRIE UM ÍNDICE NO TÍTULO NA TABELA DE FILMES
CREATE INDEX indx_movies_title ON movies(title);
