-- 01 Qual o produto mais caro?
CREATE VIEW produto_mais_caro AS
SELECT Produto, Preco
FROM vendas_produtos
ORDER BY Preco DESC
LIMIT 1;