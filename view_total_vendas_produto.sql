-- 07 Qual é o total de vendas por produto?
CREATE VIEW total_vendas_produto AS
SELECT Produto, SUM(CAST(Qty AS NUMERIC)) AS total_vendas
FROM vendas_produtos
GROUP BY Produto;