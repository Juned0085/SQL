select first_name, last_name, 'Old Man' as label
from employee_demographics
where age > 40 and gender = 'Male' 
union
select first_name, last_name, 'Old Lady' as label
from employee_demographics
where age > 40 and gender = 'FeMale' 
union 
select first_name, Last_name, 'Highly Paid employee' as label
from employee_salary
where salary > 70000
order by first_name;