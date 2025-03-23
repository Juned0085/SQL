select FirstName, LastName, Age
from mysql_for_data_analysis.employeedemographic;

select JobTitle, Salary
from mysql_for_data_analysis.employeesalary;

select FirstName, LastName, 
age,
age+10,
age*10,
age/5
from mysql_for_data_analysis.employeedemographic;
# PEMDAS

select distinct 
age 
from
mysql_for_data_analysis.employeedemographic;

select distinct gender from mysql_for_data_analysis.employeedemographic;