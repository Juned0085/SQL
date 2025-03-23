select JobTitle, avg(Salary), max(salary), min(salary), count(salary) from employeesalary
group by JobTitle;

select*from employeedemographic
order by Gender, age;