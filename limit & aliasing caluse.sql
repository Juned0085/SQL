select * from mysql_for_data_analysis.employeedemographic
order by age desc
limit 3;


select JobTitle, avg(salary) as AVGSAL, count(salary) as TotalEmployee from mysql_for_data_analysis.employeesalary
group by jobtitle
having AVGSAL > 50000;