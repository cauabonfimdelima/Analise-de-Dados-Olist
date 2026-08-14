-- Levantamento de Insights para o Projeto

-- CUSTOMERS

-- Estados com mais Clientes
--SELECT TOP 10 * FROM olist_customers_dataset
SELECT
	customer_state AS estado_cliente, COUNT(*) AS qtd_clientes
FROM
	olist_customers_dataset
GROUP BY customer_state 
ORDER BY COUNT(*) DESC

-- Cidades com mais Clientes
SELECT 
	customer_city AS cidade_cliente, COUNT(*) AS qtd_clientes
FROM 
	olist_customers_dataset
GROUP BY customer_city
ORDER BY COUNT(*) DESC