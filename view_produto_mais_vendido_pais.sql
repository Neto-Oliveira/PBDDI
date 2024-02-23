-- 13 Qual é o produto mais vendido em cada país?
CREATE VIEW produto_mais_vendido_pais AS
SELECT "ship-country", Produto, SUM(CAST(Qty AS NUMERIC)) AS quantidade_vendida
FROM vendas_produtos
GROUP BY "ship-country", Produto
ORDER BY "ship-country", quantidade_vendida DESC;