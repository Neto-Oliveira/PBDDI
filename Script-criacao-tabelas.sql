update pg_database set encoding = pg_char_to_encoding('UTF8') where datname = 'postgres 5';

DROP TABLE IF EXISTS produtos;
CREATE TABLE produtos (
	Codigo VARCHAR(10),
	Produto VARCHAR(100),
	Preco VARCHAR(30)
);

COPY produtos(
	Codigo, Produto, Preco)
FROM
    -- caminho absoluto do arquivo .csv
	'C:\temp\aula 7\produtos.csv'
DELIMITER ','
CSV HEADER;

SELECT * FROM produtos;


CREATE TABLE tb_produtos AS (
	SELECT 
		codigo, 
		produto, 
		CAST(REPLACE(preco, '$', '') AS NUMERIC) AS preco
		FROM produtos
);

CREATE TABLE vendas (
	"order-ID" VARCHAR(10),
	Date VARCHAR(100),
	"ship-service-level" VARCHAR(30),
	Codigo VARCHAR(30),
	CourierStatus VARCHAR(30),
	Qty VARCHAR(30),
	"ship-country" VARCHAR(30),
	Fulfillment VARCHAR(100)
);
CREATE TABLE vendas_produtos AS
SELECT v."order-ID", v.Date, v."ship-service-level", v.Codigo AS vendas_Codigo, v.CourierStatus, v.Qty, v."ship-country", v.Fulfillment, p.Codigo AS produtos_Codigo, p.Produto, p.Preco
FROM vendas v
JOIN tb_produtos p ON v.Codigo = p.Codigo;

select * from vendas_produtos;
SELECT * FROM vendas;