-- 14 Quais são os cinco países que mais compram em termos de quantidade de produtos?
CREATE VIEW top_paises AS
SELECT "ship-country", SUM(CAST(Qty AS NUMERIC)) AS total_produtos
FROM vendas_produtos
GROUP BY "ship-country"
ORDER BY total_produtos DESC
LIMIT 5;
