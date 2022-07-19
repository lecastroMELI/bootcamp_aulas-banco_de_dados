SELECT * FROM cliente;

SELECT sobrenome FROM cliente;

SELECT C.nome, C.sobrenome, P.velocidade_mb, P.preco FROM planos AS P
INNER JOIN cliente AS C
WHERE P.id = 3;

SELECT * FROM planos WHERE desconto > 0.00;

SELECT * FROM planos ORDER BY preco DESC;

SELECT velocidade_mb, preco
FROM planos 
ORDER BY preco DESC
LIMIT 2;