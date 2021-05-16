--Chapter 7
--Using Subqueries to Solve Queries
/*
- =, >, in
- <>  Exclude
- UNDEFINE
*/
SELECT * FROM employees WHERE manager_id = (SELECT manager_id FROM employees WHERE employee_id = 101);

SELECT * FROM employees WHERE salary > (SELECT avg(salary) FROM employees);

SELECT * FROM employees WHERE department_id IN (SELECT department_id FROM departments WHERE location_id = 1700);

UNDEFINE id;
SELECT * FROM employees WHERE manager_id = (SELECT manager_id FROM employees WHERE employee_id = '&&id') AND employee_id <> '&id';