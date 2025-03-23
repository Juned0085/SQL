use mysql_for_data_analysis;


WITH Juned (Gender, AVG_SAL, MAX_SAL, MIN_SAL, COUNT_SAL) as
(
select gender, avg(salary), max(salary), min(salary), count(salary)
from employee_demographics dem
join employee_salary sal
	on dem.employee_id = sal.employee_id
group by gender
)
select *
from Juned;


with juned as
(
select * from 
employee_demographics
)
select * from juned;


WITH Juned1 as
(
select employee_id, gender, birth_date
from employee_demographics
),
Juned2 as
(
select employee_id, salary, occupation
from employee_salary
)

select *
from Juned1
Join
Juned2
	on Juned1.employee_id = Juned2.employee_id;