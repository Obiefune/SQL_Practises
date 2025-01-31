SELECT gender, avg(salary) over () FROM employee_demographics  as dem
JOIN employee_salary as sal
ON dem.employee_id = sal.employee_id;


SELECT gender, avg(salary) over (partition by gender) FROM employee_demographics  as dem
JOIN employee_salary as sal
ON dem.employee_id = sal.employee_id;

