-- 04 Qual média de palavras pelo nome dos produtos?
CREATE VIEW media_palavras_produto AS
SELECT AVG(LENGTH(Produto) - LENGTH(REPLACE(Produto, ' ', '')) + 1) AS media_palavras
FROM produtos;