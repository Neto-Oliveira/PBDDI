-- 06 quai os produtos mais vendidosem Portugal
CREATE VIEW produtos_mais_vendidos_PT AS
SELECT produtos_Codigo, Produto, SUM(CAST(Qty AS NUMERIC)) AS total_vendido
FROM vendas_produtos
WHERE "ship-country" = 'PT'
GROUP BY produtos_Codigo, Produto
ORDER BY total_vendido DESC;