select length('Juned');
-- string function
select first_name, LENGTH(first_name) Length
from
employee_demographics
order by first_name desc;

select first_name, left(first_name,2) First_two_character,
first_name, right(first_name,2) last_two_character
 from
employee_demographics
;

-- locate and replace function
select first_name, locate('A',first_name) where_is_A
from 
employee_demographics;

select first_name, replace(first_name, 'e','i')
from
employee_demographics;


-- substring function
select first_name, substring(first_name, '3','2')
from
employee_demographics;


-- concat
select first_name, Last_name, concat(first_name,' ', last_name)
from
employee_demographics;

