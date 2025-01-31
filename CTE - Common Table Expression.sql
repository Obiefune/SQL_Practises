WITH CTE_example AS
(
SELECT gender, AVG(age) as average_age, MAX(age) as maximum_age, MIN(age) as minimum_age, COUNT(age) as count_of_age
FROM employee_demographics dem
JOIN employee_salary sal
ON dem.employee_id = sal.employee_id 
GROUP BY gender
)
Select maximum_age from CTE_example
;