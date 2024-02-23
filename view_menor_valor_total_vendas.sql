-- 08 Qual é o país com o menor valor total de vendas?
CREATE VIEW menor_valor_total_vendas AS
SELECT "ship-country", SUM(CAST(Qty AS NUMERIC) * CAST(Preco AS NUMERIC)) AS valor_total_vendas
FROM vendas_produtos
GROUP BY "ship-country"
ORDER BY valor_total_vendas ASC
LIMIT 1;