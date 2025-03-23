select gender, Avg(age) avg_age from mysql_for_data_analysis.employeedemographic
group by gender
having avg_age >31
