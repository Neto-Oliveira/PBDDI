-- 11 Qual é a quantidade total de produtos vendidos por marca?
CREATE VIEW quantidade_total_produtos_vendidos AS
SELECT Produto, SUM(CAST(Qty AS NUMERIC)) AS quantidade_total_produtos
FROM vendas_produtos
GROUP BY Produto;