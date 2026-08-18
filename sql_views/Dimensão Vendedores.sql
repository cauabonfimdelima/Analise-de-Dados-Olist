--SELECT TOP 10 * FROM olist_sellers_dataset

CREATE VIEW vw_dim_vendedores AS
SELECT
	seller_id AS id_vendedor,
	seller_zip_code_prefix AS prefixo_cep_vendedor,
	UPPER(seller_city) AS cidade_vendedor,
	seller_state AS estado_vendedor
FROM olist_sellers_dataset