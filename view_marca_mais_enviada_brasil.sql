-- 12 Qual é a marca mais enviada na região do Brasil?
CREATE VIEW marca_mais_enviada_brasil AS
SELECT 
    SUBSTRING(Produto FROM 1 FOR POSITION(' ' IN Produto) - 1) AS marca,
    COUNT(*) AS quantidade_envios
FROM 
    vendas_produtos
WHERE 
    "ship-country" = 'BR'
GROUP BY 
    marca
ORDER BY 
    quantidade_envios DESC
LIMIT 1;