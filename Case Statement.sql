Select first_name, last_name, age,
Case
when age <=30 then 'Young' 
when age between 31 and 50 then 'Old'
when age >= 51 then 'Very Old'
End as Age_Bracket
from employee_demographics;


Select first_name, last_name, 
case
when salary < 50000 then salary + (salary * 0.05)
when salary > 50000 then salary + (salary * 0.07)
End as new_salary_increase,
case
when dept_id = 6 then salary + (salary * 0.1)
end as new_salary_bouns
from employee_salary;

select * from employee_salary