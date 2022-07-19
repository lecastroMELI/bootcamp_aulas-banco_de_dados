USE movies_db;

-- Gerando uma tabela temporária, que não existirá no banco, porem é possível fazer consultas. Ela existe enquanto há a conexão com o banco.
CREATE TEMPORARY TABLE actors_names
SELECT first_name, last_name
FROM actors
WHERE rating > 5;

SELECT * FROM actors_names;

