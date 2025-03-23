use mysql_for_data_analysis;

select first_name, birth_date, extract(year from birth_date) as salaried_employee
from employee_demographics;
