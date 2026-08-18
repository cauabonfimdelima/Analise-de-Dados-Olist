/*SELECT TOP 10 * FROM olist_order_payments_dataset

SELECT DISTINCT
	payment_sequential
FROM olist_order_payments_dataset
ORDER BY payment_sequential  

SELECT DISTINCT
	payment_installments
FROM olist_order_payments_dataset
ORDER BY payment_installments 

SELECT DISTINCT
	payment_type
FROM olist_order_payments_dataset
ORDER BY payment_type */
CREATE VIEW vw_fato_pagamentos AS
SELECT
	order_id AS fk_id_pedido,
	payment_sequential AS sequencial_pagamento,
	payment_type AS tipo_pagamento,
	payment_installments AS parcelas_pagamento,
	CAST((payment_value / 100) AS DECIMAL(10,2)) AS valor_pagamento
FROM olist_order_payments_dataset
