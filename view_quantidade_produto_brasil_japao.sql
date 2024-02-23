-- 03 Qual a relação entre quantidade de produtos entre Brasil e Japão?
CREATE VIEW quantidade_produto_brasil_japao AS
SELECT "ship-country", COUNT(*) AS quantidade_produtos
FROM vendas_produtos
WHERE "ship-country" IN ('BR', 'JP')
GROUP BY "ship-country";