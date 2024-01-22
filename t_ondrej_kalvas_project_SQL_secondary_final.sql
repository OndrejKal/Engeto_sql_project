SELECT *
FROM countries c 

SELECT *
FROM economies e  

CREATE OR REPLACE TABLE t_ondrej_kalvas_project_SQL_secondary_final AS
	SELECT e.country,
		e.year,
		GDP
	FROM economies e 
	JOIN countries c 
		ON c.country = e.country
	WHERE c.continent = 'Europe'
	AND e.year BETWEEN 2006 AND 2018
	ORDER BY country, year

	