--Chapter 7
--Using Subqueries to Solve Queries
/*
- =, >, in
- <>  Exclude
- UNDEFINE
*/
select * from employees where manager_id = (select manager_id from employees where employee_id = 101);

select * from employees where salary > (select avg(salary) from employees);

select * from employees where department_id in (select department_id from departments where location_id = 1700);

UNDEFINE id;
select * from employees where manager_id = (select manager_id from employees where employee_id = '&&id') and employee_id <> '&id';