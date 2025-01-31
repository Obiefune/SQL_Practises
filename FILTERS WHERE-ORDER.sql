select * from employee_demographics order by last_name asc;

select * from employee_demographics where age = 40;

select occupation, sum(salary) from employee_salary group by occupation order by occupation asc;