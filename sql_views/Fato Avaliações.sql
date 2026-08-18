/*SELECT TOP 10 * FROM olist_order_reviews_dataset

SELECT 
	review_score, COUNT(*) AS total_avaliacoes
FROM 
	olist_order_reviews_dataset 
GROUP BY review_score
ORDER BY review_score*/
CREATE VIEW vw_fato_avaliacoes AS
SELECT
	review_id AS id_avaliacao,
	order_id AS fk_id_pedido,
	review_score AS classificacao_avaliacao,
	COALESCE(review_comment_title, 'Não Inseriu Título na Avaliação') AS titulo_avaliacao,
	COALESCE(review_comment_message, 'Não Inseriu Comentário na Avaliação') AS comentario_avaliacao,
	CAST(review_creation_date AS DATE) AS data_avaliacao,
	YEAR(review_creation_date) AS ano_avaliacao,
	CASE
		WHEN MONTH(review_creation_date) = 1 THEN 'Janeiro'
		WHEN MONTH(review_creation_date) = 2 THEN 'Fevereiro'
		WHEN MONTH(review_creation_date) = 3 THEN 'Março'
		WHEN MONTH(review_creation_date) = 4 THEN 'Abril'
		WHEN MONTH(review_creation_date) = 5 THEN 'Maio'
		WHEN MONTH(review_creation_date) = 6 THEN 'Junho'
		WHEN MONTH(review_creation_date) = 7 THEN 'Julho'
		WHEN MONTH(review_creation_date) = 8 THEN 'Agosto'
		WHEN MONTH(review_creation_date) = 9 THEN 'Setembro'
		WHEN MONTH(review_creation_date) = 10 THEN 'Outubro'
		WHEN MONTH(review_creation_date) = 11 THEN 'Novembro'
		WHEN MONTH(review_creation_date) = 12 THEN 'Dezembro'
	END AS mes_avaliacao,
	CASE
		WHEN MONTH(review_creation_date) <= 6 THEN '1º Semestre'
		ELSE '2º Semestre'
	END AS semestre_avaliacao
FROM olist_order_reviews_dataset