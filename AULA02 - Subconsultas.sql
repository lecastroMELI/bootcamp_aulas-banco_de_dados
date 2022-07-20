-- SUBCONSULTAS
-- QUAIS OS NOMES DOS ATORES QUE TRABRALHAM EM FILMES COM AVALIAÇÃO MAIOR QUE 9.1
-- 1. selecionar os id's dos atores que trabalharam em filmes com avaliação maior que 9.1
-- 2. a partir da resposta anterior, listar os atores cujo id está na lista gerada no passo 1

SELECT *
FROM actors
WHERE ID IN 

(SELECT actor_movie.actor_id
FROM movies
INNER JOIN actor_movie ON movies.id = actor_movie.movie_id
WHERE rating > 9.1)

ORDER BY first_name;

## VER SCRIPT 6, PARA TER AS OUTRAS CONSULTAS

-- QUAIS SÃO OS FILMES QUE NÃO É O FILME FAVORITO DE NENHUM ATOR
SELECT movies.title
FROM movies
WHERE NOT EXISTS
(SELECT actors.first_name FROM actors WHERE favorite_movie_id = movies.id); -- roda para cada item de movies / RETORNA O NOME DOS ATORES EM QUE O FILME FAVORITO DELE ESTÁ NA TABELA MOVIES