-- Levantamento de Insights para o Projeto
-- PEDIDOS (ORDERS)

--SELECT TOP 10 * FROM olist_orders_dataset
-- Contagem Status
SELECT
	order_status AS status_pedido, COUNT(*) AS qtd_status
FROM
	olist_orders_dataset
GROUP BY order_status
ORDER BY COUNT(*) DESC
 
-- Tempo Médio de Entrega (Em dias)
SELECT
	AVG(CAST(DATEDIFF(day, order_approved_at, order_delivered_customer_date) AS FLOAT)) AS media_tempo_entrega_dias
FROM
	olist_orders_dataset

-- Tempo Médio de Entrega (Em dias por Estado)
SELECT
	c.customer_state AS cliente_estado,
	AVG(CAST(DATEDIFF(day, order_approved_at, order_delivered_customer_date) AS FLOAT)) AS media_tempo_entrega_dias
FROM
	olist_orders_dataset o
INNER JOIN
olist_customers_dataset c
	ON c.customer_id =  o.customer_id
WHERE
	o.order_approved_at IS NOT NULL
	AND o.order_delivered_customer_date IS NOT NULL
GROUP BY c.customer_state
ORDER BY
	media_tempo_entrega_dias DESC

-- Pico de Vendas MÊS
SELECT
	--order_purchase_timestamp AS compra_pedido,
	--DAY(order_purchase_timestamp) AS dia_compra,
	--DATENAME(WEEKDAY, order_purchase_timestamp) AS dia_semana_compra,
	CASE
	WHEN MONTH(order_purchase_timestamp) = 1 THEN 'Janeiro' 
	WHEN MONTH(order_purchase_timestamp) = 2 THEN 'Fevereiro'
	WHEN MONTH(order_purchase_timestamp) = 3 THEN 'Março'
	WHEN MONTH(order_purchase_timestamp) = 4 THEN 'Abril'
	WHEN MONTH(order_purchase_timestamp) = 5 THEN 'Maio'
	WHEN MONTH(order_purchase_timestamp) = 6 THEN 'Junho'
	WHEN MONTH(order_purchase_timestamp) = 7 THEN 'Julho'
	WHEN MONTH(order_purchase_timestamp) = 8 THEN 'Agosto'
	WHEN MONTH(order_purchase_timestamp) = 9 THEN 'Setembro'
	WHEN MONTH(order_purchase_timestamp) = 10 THEN 'Outubro'
	WHEN MONTH(order_purchase_timestamp) = 11 THEN 'Novembro'
	WHEN MONTH(order_purchase_timestamp) = 12 THEN 'Dezembro'
	END AS mes_compra,

	COUNT(*) AS total_compras
FROM
	olist_orders_dataset
GROUP BY
	MONTH(order_purchase_timestamp)
ORDER BY 
	total_compras DESC,
	mes_compra DESC;

-- Pico de Vendas DIA DA SEMANA
SELECT
	DATENAME(WEEKDAY, order_purchase_timestamp) AS dia_semana_compra,
	COUNT(*) AS total_compras
FROM
	olist_orders_dataset
GROUP BY
	DATENAME(WEEKDAY, order_purchase_timestamp)
ORDER BY 
	total_compras DESC,
	dia_semana_compra DESC;
