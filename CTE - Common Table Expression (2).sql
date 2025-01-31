WITH cta_exmp as(
SELECT gender, avg(salary) as avg_sal, max(salary), min(salary), count(salary) FROM employee_demographics as dem
JOIN employee_salary as sal ON dem.employee_id = sal.employee_id
group by gender)

select gender, avg_sal from cta_exmp;

-- using subqauries to get the same result---
select gender, avg_sal from (select gender, avg(salary) as avg_sal from employee_demographics as dem
join employee_salary as sal on dem.employee_id = sal.employee_id
group by gender) as agg_tb_ex;


with ce_mx_exm as 
(select employee_id, first_name, last_name, gender, birth_date 
from employee_demographics where birth_date > '1985-05-01'),
ce_mx_exm2 as 
(select employee_id, salary from employee_salary where salary > 50000)

select * from ce_mx_exm
join ce_mx_exm2 on ce_mx_exm.employee_id = ce_mx_exm2.employee_id;