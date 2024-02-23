-- 02 Qual marca com maior acervo de produtos?
CREATE VIEW marca_com_maior_acervo AS
SELECT Produto, COUNT(*) AS quantidade_produtos
FROM vendas_produtos
GROUP BY Produto
ORDER BY quantidade_produtos DESC
LIMIT 1;