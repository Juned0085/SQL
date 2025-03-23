-- stored procedures
use mysql_for_data_analysis;

create procedure first_procedure()
select * from 
employee_demographics;

call first_procedure();

DELIMITER $$
create procedure Avg_sal_2()
begin
	select gender, Avg(salary) as Avg_sal
    from employee_demographics dem
    join employee_salary sal
		on dem.employee_id = sal.employee_id
    group by gender;
    select * from employee_salary;
end $$
delimiter $

call Avg_sal_2();

drop procedure if exists Avg_sal_3;

DELIMITER $$
create procedure Avg_sal_3(Salary_for_particular INT)
begin
	select salary 
    from employee_salary
    where employee_id = Salary_for_particular;
end $$
delimiter $

call Avg_sal_3(1);

