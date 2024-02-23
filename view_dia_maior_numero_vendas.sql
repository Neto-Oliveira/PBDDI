-- 15 Qual dia com maior número de vendas em quantidade?
CREATE VIEW dia_maior_numero_vendas AS
SELECT Date, SUM(CAST(Qty AS NUMERIC)) AS total_vendas
FROM vendas_produtos
GROUP BY Date
ORDER BY total_vendas DESC
LIMIT 1;
