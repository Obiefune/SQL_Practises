select avg(avg_sal) from (SELECT gender, avg(salary) as avg_sal, max(salary) as max_sal, 
min(salary) as min_sal, count(salary) as count_sal FROM employee_demographics as dem
JOIN employee_salary as sal ON dem.employee_id = sal.employee_id
group by gender) as agg_avg;


select avg(`max(age)`) FROM (SELECT gender, avg(age), max(age), min(age), count(age) 
FROM employee_demographics GROUP BY gender) AS ag_table;