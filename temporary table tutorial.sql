create temporary table Temp_table
(First_name varchar(50),
last_name varchar(50),
gender varchar(10)
);

insert into  temp_table
values ('Juned','Mulla','Male');

select*from temp_table;


create temporary table Salary_40k
select * from
employee_salary 
where salary >= 40000;

select * from Salary_40k;

