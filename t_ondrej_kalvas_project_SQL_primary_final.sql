CREATE OR REPLACE TABLE t_ondrej_kalvas_project_SQL_primary_final_payroll AS
	SELECT 
		round(avg(value)) AS rounded_average_wage,
		payroll_year,
		cpib.name AS industry
	FROM czechia_payroll cp 
	LEFT JOIN czechia_payroll_industry_branch cpib 
		ON cpib.code = cp.industry_branch_code 
	LEFT JOIN czechia_payroll_value_type cpvt 
		ON cpvt.code = cp.value_type_code 
	LEFT JOIN czechia_payroll_unit cpu 
		ON cpu.code = cp.unit_code
	WHERE cpib.name IS NOT NULL
	AND cpvt.code = 5958
	AND cpu.code = 200
	AND cp.payroll_year >= 2006
	AND cp.payroll_year <= 2018
	GROUP BY payroll_year, industry;


CREATE OR REPLACE TABLE t_ondrej_kalvas_project_SQL_primary_final_price AS
	SELECT 
		round(avg(value)) AS round_average_food_price,
		YEAR(date_from) AS price_year,
		cpc.name AS food_name
	FROM czechia_price cpr
	LEFT JOIN czechia_price_category cpc 
		ON cpr.category_code = cpc.code 
	GROUP BY price_year, food_name;
	

CREATE OR REPLACE TABLE t_ondrej_kalvas_project_SQL_primary_final AS 
	SELECT *
	FROM t_ondrej_kalvas_project_SQL_primary_final_price tcpr
	LEFT JOIN t_ondrej_kalvas_project_SQL_primary_final_payroll tcp
		ON tcpr.price_year = tcp.payroll_year;