SELECT TOP 10 * FROM olist_order_items_dataset
SELECT TOP 10 * FROM olist_products_dataset

-- CATEGORIAS DE PRODUTOS QUE GERAM MAIS RECEITA
SELECT 
	p.product_category_name AS categoria_produto,
	CAST(SUM(o.price / 100) AS DECIMAL(10,2)) AS valor_total,
	CAST(AVG(o.price / 100) AS DECIMAL(10,2)) AS valor_medio
FROM olist_order_items_dataset o
LEFT JOIN olist_products_dataset p
	ON o.product_id = p.product_id
GROUP BY p.product_category_name
ORDER BY valor_total DESC