delimiter $$
create trigger employee_insert
after insert on employee_salary
for each row 
begin
insert into employee_demographics(employee_id, first_name, last_name)
values(New.employee_id, New.first_name, New.last_name);
end $$
delimiter ;


-- EVENT 
DELIMITER $$
CREATE EVENT update_delete_retirees
on schedule every 30 second
do 
begin
DELETE from employee_demographics
where age >= 60;
end $$
DELIMITER ;

SELECT * FROM employee_demographics;

SHOW VARIABLES LIKE 'event%';