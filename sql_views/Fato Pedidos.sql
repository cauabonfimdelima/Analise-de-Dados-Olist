--SELECT TOP 10 * FROM olist_orders_dataset

CREATE VIEW vw_fato_pedidos AS
SELECT
	order_id AS id_pedido,
	customer_id AS fk_id_cliente,
	order_status AS status_pedido,
	order_purchase_timestamp AS momento_compra,
	CAST(order_purchase_timestamp AS DATE) AS data_compra,
	CAST(order_purchase_timestamp AS TIME) AS hora_compra,
	order_approved_at AS momento_pedido_aprovado,
	CAST(order_approved_at AS DATE) AS data_pedido_aprovado,
	CAST(order_approved_at AS TIME) AS hora_pedido_aprovado,
	order_delivered_carrier_date AS momento_entrega_transportadora,
	CAST(order_delivered_carrier_date AS DATE) AS data_entrega_transportadora,
	CAST(order_delivered_carrier_date AS TIME) AS hora_entrega_transportadora,
	order_delivered_customer_date AS momento_entrega_cliente,
	CAST(order_delivered_customer_date AS DATE) AS data_entrega_cliente,
	CAST(order_delivered_customer_date AS TIME) AS hora_entrega_cliente,
	order_estimated_delivery_date AS previsao_entrega,
	CAST(order_estimated_delivery_date AS DATE) AS data_previsao_entrega
FROM olist_orders_dataset;