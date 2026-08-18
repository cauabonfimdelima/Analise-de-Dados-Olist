/*SELECT TOP 10 * FROM olist_products_dataset
SELECT TOP 10 * FROM product_category_name_translation*/
CREATE VIEW vw_dim_produtos AS
SELECT 
	p.product_id AS id_produto,
	COALESCE(p.product_category_name, 'Sem Categoria') AS categoria_portugues,
	COALESCE(t.product_category_name_english, 'Without Category') AS categoria_ingles,
	p.product_weight_g AS produto_peso_g,
	p.product_length_cm AS produto_comprimento_cm,
	p.product_height_cm AS produto_altura_cm,
	p.product_width_cm AS produto_largura_cm
FROM olist_products_dataset p
LEFT JOIN product_category_name_translation t
	ON p.product_category_name = t.product_category_name

