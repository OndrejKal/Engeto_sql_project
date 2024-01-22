CREATE OR REPLACE VIEW v_question_5 AS 
	SELECT country,
		`year`,
		GDP,
		round(GDP - lag(gdp, 1) OVER (PARTITION BY country ORDER BY year)) / sum(gdp) * 100 AS pct_change
	FROM t_ondrej_kalvas_project_sql_secondary_final ts
	WHERE country = 'Czech Republic'
	GROUP BY YEAR
	

CREATE OR REPLACE VIEW pomoc  AS 
  SELECT price_year AS pw_year,
  	AVG(rounded_average_food_price) AS avg_food_price,
  	AVG(rounded_average_wage) AS avg_wage
  FROM t_ondrej_kalvas_project_sql_primary_final tf 
  GROUP BY price_year
  
  WITH wage_growth AS (
	SELECT pw_year,
		avg_wage,
		(avg_wage - lag(avg_wage) OVER (ORDER BY pw_year)) /
		lag(avg_wage) OVER (ORDER BY pw_year) * 100 AS wage_pct_change
	FROM pomoc vq 
),
price_growth AS (
	SELECT pw_year,
		avg_food_price,
		(avg_food_price - lag(avg_food_price) OVER (ORDER BY pw_year)) /
		lag(avg_food_price) OVER (ORDER BY pw_year) * 100 AS price_pct_change
	FROM pomoc vq 
),
gdp_growth AS (
	SELECT vq.YEAR AS GDP_year,
		pct_change AS GDP_pct_change
	FROM v_question_5 vq 
)
SELECT wg.pw_year AS 'year',
	wg.wage_pct_change,
	pg.price_pct_change,
	GDP_pct_change
FROM wage_growth wg
JOIN price_growth pg
	ON wg.pw_year = pg.pw_year
JOIN gdp_growth gdpg
	ON gdpg.GDP_year = wg.pw_year
	
