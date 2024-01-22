CREATE OR REPLACE TABLE t_prices AS
SELECT round_average_food_price,
	price_year,
	food_name
FROM t_ondrej_kalvas_project_sql_primary_final tokpspf 
WHERE food_name IN ('Chléb konzumní kmínový', 'Mléko polotučné pasterované')
GROUP BY food_name,  price_year;


CREATE OR REPLACE TABLE t_wages AS 
SELECT rounded_average_wage,
	payroll_year,
	industry
FROM t_ondrej_kalvas_project_sql_primary_final tokpspf 
WHERE payroll_year IN (2006, 2018)
GROUP BY payroll_year, industry;


CREATE OR REPLACE TABLE t_prices_with_wages AS
SELECT *
FROM t_prices p 
JOIN t_wages w 
	ON w.payroll_year = p.price_year;


-- for every industry
SELECT round((rounded_average_wage / round_average_food_price)) AS 'purchase',
	price_year,
	industry,
	food_name
FROM t_prices_with_wages tpww;

-- overall
SELECT round(avg(rounded_average_wage)) AS 'average_wage_for_every_industry',
	round(avg(rounded_average_wage) / round_average_food_price) AS 'purchase',
	payroll_year ,
	food_name 
FROM t_prices_with_wages tpww 
WHERE payroll_year IN (2006, 2018)
GROUP BY payroll_year, food_name ;


