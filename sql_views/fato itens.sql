--ORDER ITENS
CREATE VIEW vw_fato_itens AS
SELECT
	order_id AS fk_id_pedido,
	order_item_id AS id_item_pedido,
	product_id AS fk_id_produto,
	seller_id AS fk_id_vendedor,
	shipping_limit_date AS limite_envio,
	CAST(shipping_limit_date AS DATE) AS data_limite_envio,
	CAST(shipping_limit_date AS TIME) AS horario_limite_envio,
	DAY(shipping_limit_date) AS dia_limite_envio,
	MONTH(shipping_limit_date) AS mes_limite_envio,
	CASE 
		WHEN MONTH(shipping_limit_date) = 01 THEN 'Janeiro'
		WHEN MONTH(shipping_limit_date) = 02 THEN 'Fevereiro'
		WHEN MONTH(shipping_limit_date) = 03 THEN 'Março'
		WHEN MONTH(shipping_limit_date) = 04 THEN 'Abril'
		WHEN MONTH(shipping_limit_date) = 05 THEN 'Maio'
		WHEN MONTH(shipping_limit_date) = 06 THEN 'Junho'
		WHEN MONTH(shipping_limit_date) = 07 THEN 'Julho'
		WHEN MONTH(shipping_limit_date) = 08 THEN 'Agosto'
		WHEN MONTH(shipping_limit_date) = 09 THEN 'Setembro'
		WHEN MONTH(shipping_limit_date) = 10 THEN 'Outubro'
		WHEN MONTH(shipping_limit_date) = 11 THEN 'Novembro'
		WHEN MONTH(shipping_limit_date) = 12 THEN 'Dezembro'
	END AS texto_mes_limite_envio,
	CASE
		WHEN MONTH(shipping_limit_date) <= 06 THEN '1º Semestre'
		ELSE '2º Semestre'
	END AS semestre_limite_envio,
	YEAR(shipping_limit_date) AS ano_limite_envio,
	CAST((price/100) AS DECIMAL(10,2)) AS preco,
	CAST((freight_value/100) AS DECIMAL(10,2)) AS valor_frete
FROM olist_order_items_dataset

--SELECT * FROM olist_order_items_dataset