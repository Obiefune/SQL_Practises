Select first_name, last_name
from employee_demographics where age > 40 AND gender = 'Male'
Union All
Select first_name, last_name
from employee_demographics where age > 40 AND gender = 'Female'
Union All
Select first_name, last_name from employee_salary
where salary > 70000;


