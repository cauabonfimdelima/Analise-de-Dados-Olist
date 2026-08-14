SELECT TOP 10 * FROM olist_order_reviews_dataset
SELECT TOP 10 * FROM olist_orders_dataset
SELECT TOP 10 * FROM olist_customers_dataset

-- Avaliação x Tempo de Espera Pedidos
SELECT 
	r.review_score AS nota_avaliacao,
	COUNT(o.order_id) AS total_pedidos,
	AVG(CAST(DATEDIFF(day, o.order_approved_at, o.order_delivered_customer_date) AS FLOAT)) AS media_dias
FROM olist_order_reviews_dataset r  
INNER JOIN olist_orders_dataset o
	ON  r.order_id = o.order_id
WHERE o.order_status = 'delivered'
	AND o.order_approved_at IS NOT NULL	
	AND o.order_delivered_customer_date IS NOT NULL
GROUP BY r.review_score
ORDER BY r.review_score DESC

-- Avaliação x Tempo de Espera Pedidos por Estado
SELECT 
	c.customer_state AS estado_cliente,
	r.review_score AS nota_avaliacao,
	COUNT(o.order_id) AS total_pedidos,
	AVG(CAST(DATEDIFF(day, o.order_approved_at, o.order_delivered_customer_date) AS FLOAT)) AS media_dias
FROM olist_order_reviews_dataset r  
INNER JOIN olist_orders_dataset o
	ON  r.order_id = o.order_id
INNER JOIN olist_customers_dataset c
	ON c.customer_id = o.customer_id
WHERE o.order_status = 'delivered'
	AND o.order_approved_at IS NOT NULL	
	AND o.order_delivered_customer_date IS NOT NULL
GROUP BY r.review_score, c.customer_state
ORDER BY r.review_score
