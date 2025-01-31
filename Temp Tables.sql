

create temporary table salary_over_50k
select * from employee_salary where salary >= 50000;

select first_name, last_name, salary from salary_over_50k where salary >=70000;
