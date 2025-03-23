-- triggers

create temporary table trigger_s
(employee_id int not null, first_name varchar(50), last_name varchar(50), age int, gender varchar(10), birth_date date);


drop table if exists employee_salary;

drop trigger if exists insert_new_employee_1;

delimiter $$
create trigger insert_new_employee
after insert on employee_demographics
for each row 
begin
	insert into trigger_s (employee_id, first_name, last_name, age, gender, birth_date)
    values(new.employee_id, new.first_name, new.last_name, new.age, new.gender, new.birth_date);
end $$
delimiter ;


insert into employee_demographics(employee_id, first_name, last_name, age, gender, birth_date)
values(4, 'Juned','Mulla', 25, 'Male', null);





drop event if exists delete_young_age;

-- events
delimiter $$
create event delete_young_age
on schedule every 30 second
do
begin
	delete from employee_demographics
    where age <= 30;
end $$
delimiter ; 

select * from employee_demographics;

select * from trigger_s;