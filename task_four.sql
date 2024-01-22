CREATE OR REPLACE VIEW v_question_4 AS 
  SELECT price_year AS pw_year,
  	AVG(rounded_average_food_price) AS avg_food_price,
  	AVG(rounded_average_wage) AS avg_wage
  FROM t_ondrej_kalvas_project_sql_primary_final tf 
  WHERE price_year BETWEEN 2006 AND 2017
  GROUP BY price_year;

 
WITH wage_growth AS (
	SELECT pw_year,
		avg_wage,
		(avg_wage - lag(avg_wage) OVER (ORDER BY pw_year)) /
		lag(avg_wage) OVER (ORDER BY pw_year) * 100 AS wage_pct_change
	FROM v_question_4 vh 
),
price_growth AS (
	SELECT pw_year,
		avg_food_price,
		(avg_food_price - lag(avg_food_price) OVER (ORDER BY pw_year)) /
		lag(avg_food_price) OVER (ORDER BY pw_year) * 100 AS price_pct_change
	FROM v_help vh 
)
SELECT wg.pw_year,
	wg.wage_pct_change,
	pg.price_pct_change
FROM wage_growth wg
JOIN price_growth pg
	ON wg.pw_year = pg.pw_year
WHERE pg.price_pct_change > 10 
AND wg.wage_pct_change < pg.price_pct_change ;
