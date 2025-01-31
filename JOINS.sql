select *
from employee_demographics as demo
inner join employee_salary as sal 
on demo.employee_id = sal.employee_id;

-- outter Joins

select *
from employee_demographics as demo
right join employee_salary as sal 
on demo.employee_id = sal.employee_id;

-- self join

Select emp1.employee_id , emp1.first_name as santa, 
emp1.last_name as santa, emp2.employee_id, 
emp2.first_name as emp_first_name, emp2.last_name as emp_last_name
from employee_salary emp1
join employee_salary emp2
on emp1.employee_id +1 = emp2.employee_id;

-- multiple join 

Select * from employee_demographics as dem
Inner join employee_salary as sal
on dem.employee_id = sal.employee_id
Inner join parks_departments as par
on sal.dept_id = par.department_id;

Select * from parks_departments