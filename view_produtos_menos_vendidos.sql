-- 09 Quais são os produtos menos vendidos em termos de receita?
CREATE VIEW produtos_menos_vendidos AS
SELECT Produto, SUM(CAST(Qty AS NUMERIC) * CAST(Preco AS NUMERIC)) AS receita_total
FROM vendas_produtos
GROUP BY Produto
ORDER BY receita_total ASC
LIMIT 10;