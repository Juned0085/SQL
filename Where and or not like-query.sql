use mysql_for_data_analysis;

select*from employeedemographic;

select*from employeedemographic
where FirstName = 'Jim';

select*from employeesalary
where salary<50000 and JobTitle = 'Accountant' or salary>50000;

select*from employeedemographic
where LastName like 'B%';

select*from employeedemographic
where LastName like 'S____';