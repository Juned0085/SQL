use mysql_for_data_analysis;
 select*from employeedemographic;
 
 select*from employeesalary;
 
 select * from employeedemographic dem
 inner join employeesalary sal
 on dem.EmployeeID = sal.EmployeeID;
 
-- inner join 
 select dem.EmployeeID, firstname, lastname, salary, JobTitle from employeedemographic dem
 inner join employeesalary sal
 on dem.EmployeeID = sal.EmployeeID;

-- outer join
 select * from employeedemographic dem
 right join employeesalary sal
 on dem.EmployeeID = sal.EmployeeID;
 
 -- self join
 
 select emp1.employeeid as emp_santa,
 emp1.firstname as first_name_santa,
emp1.lastname as last_name_santa,
emp2.employeeid as emp_id
 from
 employeedemographic emp1
 join employeesalary emp2
on emp1.employeeid + 1 = emp2.employeeid;

-- multiple joint

create table parks_departments
(department_id int primary key auto_increment not null,
department_name varchar(20) not null);

insert into parks_departments
(department_id, department_name)
values
(1, 'Receptionist'),
(2, 'Salesman'),
(3, 'Accountant'),
(4, 'HR'),
(5, 'Regional Manager'),
(6, 'Supplier Relations');

select*from parks_departments;

select * from
employeesalary sal
inner join parks_departments as par
on sal.JobTitle = par.department_name;