-- 01 qual o produto mais caro?
-- 02 qual marca com maior acervo de produtos?
-- 03 qual a relação entre quantidade de produtos entre brasil e japão
-- 04 qual média de palavras pelo nome dos produtos
-- 05 qual maior número de letras dos produtos abaixo
-- 06 qual produto com o menor número de caracteres
-- 07 qual é o total de vendas por produto?
-- 08 qual é o país com o menor valor total de vendas?
-- 09 quais são os produtos menos vendidos em termos de receita?
-- 10 qual é o mês com o maior valor total de vendas?
-- 11 qual é a quantidade total de produtos vendidos por marca?
-- 12 qual é a marca mais enviada na região do brasil
-- 13 qual é o produto mais vendido em cada país?
-- 14 quais são os cinco clientes que mais compram em termos de quantidade de produtos?
-- 15 qual dia com maior número de vendas em quantidade.
SELECT * FROM produtos;
SELECT * FROM vendas;



CREATE TABLE vendas_produtos AS
SELECT v."order-ID", v.Date, v."ship-service-level", v.Codigo AS vendas_Codigo, v.CourierStatus, v.Qty, v."ship-country", v.Fulfillment, p.Codigo AS produtos_Codigo, p.Produto, p.Preco
FROM vendas v
JOIN tb_produtos p ON v.Codigo = p.Codigo;

select * from vendas_produtos;


-- 01 Qual o produto mais caro?
CREATE VIEW mais_caro AS
SELECT Produto, Preco
FROM vendas_produtos
ORDER BY Preco DESC
LIMIT 1;


-- 02 Qual marca com maior acervo de produtos?
CREATE VIEW marca_com_maior_acervo AS
SELECT Produto, COUNT(*) AS quantidade_produtos
FROM vendas_produtos
GROUP BY Produto
ORDER BY quantidade_produtos DESC
LIMIT 1;

-- 03 Qual a relação entre quantidade de produtos entre Brasil e Japão?
CREATE VIEW quantidade_produto_brasil_japao AS
SELECT "ship-country", COUNT(*) AS quantidade_produtos
FROM vendas_produtos
WHERE "ship-country" IN ('BR', 'JP')
GROUP BY "ship-country";

-- 04 Qual média de palavras pelo nome dos produtos?
CREATE VIEW media_palavras_produto AS
SELECT AVG(LENGTH(Produto) - LENGTH(REPLACE(Produto, ' ', '')) + 1) AS media_palavras
FROM produtos;


-- 05 qual maior número de letras dos produtos abaixo
CREATE VIEW maior_numero_letras AS
SELECT Produto, LENGTH(Produto) AS numero_letras
FROM produtos
ORDER BY numero_letras DESC
LIMIT 1;

-- 06 Qual produto com o menor número de caracteres?
CREATE VIEW menor_numero_caracteres AS
SELECT Produto, LENGTH(Produto) AS numero_caracteres
FROM produtos
ORDER BY numero_caracteres ASC
LIMIT 1;

-- 07 Qual é o total de vendas por produto?
CREATE VIEW total_vendas_produto AS
SELECT Produto, SUM(CAST(Qty AS NUMERIC)) AS total_vendas
FROM vendas_produtos
GROUP BY Produto;

-- 08 Qual é o país com o menor valor total de vendas?
CREATE VIEW menor_valor_total_vendas AS
SELECT "ship-country", SUM(CAST(Qty AS NUMERIC) * CAST(Preco AS NUMERIC)) AS valor_total_vendas
FROM vendas_produtos
GROUP BY "ship-country"
ORDER BY valor_total_vendas ASC
LIMIT 1;

-- 09 Quais são os produtos menos vendidos em termos de receita?
CREATE VIEW produtos_menos_vendidos AS
SELECT Produto, SUM(CAST(Qty AS NUMERIC) * CAST(Preco AS NUMERIC)) AS receita_total
FROM vendas_produtos
GROUP BY Produto
ORDER BY receita_total ASC
LIMIT 10;

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


-- 11 Qual é a quantidade total de produtos vendidos por marca?
CREATE VIEW quantidade_total_produtos_vendidos AS
SELECT Produto, SUM(CAST(Qty AS NUMERIC)) AS quantidade_total_produtos
FROM vendas_produtos
GROUP BY Produto;

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

-- 13 Qual é o produto mais vendido em cada país?
CREATE VIEW produto_mais_vendido_pais AS
SELECT "ship-country", Produto, SUM(CAST(Qty AS NUMERIC)) AS quantidade_vendida
FROM vendas_produtos
GROUP BY "ship-country", Produto
ORDER BY "ship-country", quantidade_vendida DESC;

-- 14 Quais são os cinco países que mais compram em termos de quantidade de produtos?
CREATE VIEW top_paises AS
SELECT "ship-country", SUM(CAST(Qty AS NUMERIC)) AS total_produtos
FROM vendas_produtos
GROUP BY "ship-country"
ORDER BY total_produtos DESC
LIMIT 5;


-- 15 Qual dia com maior número de vendas em quantidade?
CREATE VIEW dia_maior_numero_vendas AS
SELECT Date, SUM(CAST(Qty AS NUMERIC)) AS total_vendas
FROM vendas_produtos
GROUP BY Date
ORDER BY total_vendas DESC
LIMIT 1;
