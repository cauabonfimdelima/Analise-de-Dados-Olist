--Customers
CREATE VIEW vw_dim_clientes AS
SELECT
	customer_id AS id_sessao_cliente,
	customer_unique_id AS id_unico_cliente,
	customer_zip_code_prefix AS prefixo_cep_cliente,
	UPPER(TRIM(customer_city)) AS cidade_cliente,
	customer_state AS estado_cliente
FROM olist_customers_dataset;
