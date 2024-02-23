-- 05 qual maior número de letras dos produtos abaixo
CREATE VIEW maior_numero_letras AS
SELECT Produto, LENGTH(Produto) AS numero_letras
FROM produtos
ORDER BY numero_letras DESC
LIMIT 1;