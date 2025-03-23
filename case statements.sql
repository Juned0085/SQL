use mysql_for_data_analysis;

select * ,
case
	When age <= 30 then 'Young'
    when age <= 50 then 'old'
    when age > 50 then 'Oldest'
end as age_track
from
employee_demographics;

select first_name, last_name,
salary,
case
	when salary < 50000 then salary +(salary * 0.05)
    when salary > 50000 then salary + (salary * 0.07)
end as salary_hike,
case
	when dept_id = 6 then salary * 0.10
end as bonus 
from 
employee_salary;

select * from parks_departments;