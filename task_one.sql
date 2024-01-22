SELECT payroll_year,
	industry,
	rounded_average_wage
FROM t_ondrej_kalvas_project_sql_primary_final
GROUP BY payroll_year, industry  
ORDER BY payroll_year , industry ;
