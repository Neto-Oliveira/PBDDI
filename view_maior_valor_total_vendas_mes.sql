-- 10 Qual é o mês com o maior valor total de vendas?
CREATE VIEW maior_valor_total_vendas_mes AS
SELECT 
    TO_DATE(Date, 'MM/DD/YYYY') AS mes,
    SUM(CAST(Qty AS NUMERIC) * CAST(Preco AS NUMERIC)) AS valor_total_vendas
FROM 
    vendas_produtos
GROUP BY 
    mes
ORDER BY 
    valor_total_vendas DESC
LIMIT 1;