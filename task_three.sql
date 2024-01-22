CREATE OR REPLACE TABLE t_auxiliary AS
SELECT food_name,
	round_average_food_price ,
	price_year
FROM t_ondrej_kalvas_project_sql_primary_final tokpspf 
GROUP BY food_name, price_year
ORDER BY price_year, food_name 

WITH next_date_and_price AS (
SELECT *,
	lead(round_average_food_price) OVER (PARTITION BY food_name ORDER BY price_year) AS next_price,
	lead(price_year) OVER (PARTITION BY food_name ORDER BY price_year) AS next_date
FROM t_auxiliary ta 
)
SELECT food_name,
	round(1.0 * next_price / round_average_food_price - 1, 2) AS pct_change,
	round_average_food_price,
	price_year
FROM next_date_and_price
WHERE next_date IS NOT NULL
ORDER BY pct_change