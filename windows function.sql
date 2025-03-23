use mysql_for_data_analysis;

select gender, avg(salary) as AVG_SAL
from employee_demographics dem
join employee_salary sal
	on dem.employee_id = sal.employee_id
group by gender;


select dem.first_name, dem.last_name, gender, salary, 
avg(salary)  over(partition by gender order by dem.employee_id) as sum_sal
from employee_demographics dem
join employee_salary sal
	on dem.employee_id = sal.employee_id;
    

select dem.first_name, dem.last_name, gender, salary, 
row_number() over(partition by gender order by sal.salary) as row_num,
rank() over(partition by gender order by sal.salary) as rank_num,
dense_rank() over(partition by gender order by sal.salary) as dens_rank_num
from employee_demographics dem
join employee_salary sal
	on dem.employee_id = sal.employee_id;
    