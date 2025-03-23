use mysql_for_data_analysis;

select * from
employee_demographics
where employee_id in 
		(select employee_id
        from employee_salary
        where dept_id =1);


select first_name, Last_name,
(select avg(salary) 
from employee_salary) as Avg_sal
from 
employee_demographics
;

select avg(Avg_sal)
from
(select avg(salary) as Avg_sal
from employee_salary) as agg_table
;



