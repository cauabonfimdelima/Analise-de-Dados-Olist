--Geolocation
CREATE VIEW vw_dim_geolocalizacao AS
SELECT
	geolocation_zip_code_prefix AS prefixo_cep_geolocalizacao,
	geolocation_lat AS latitude_geolocalizacao,
	geolocation_lng AS longitude_geolocalizacao,
	UPPER(TRIM(geolocation_city)) AS cidade_geolocalizacao,
	geolocation_state AS estado_geolocalizacao
FROM olist_geolocation_dataset;