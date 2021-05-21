--Chapter 7
--Subqueries
/*
- =, >, in
- <>  Exclude
- UNDEFINE
- ALL
- ANY
*/
SELECT * FROM employees WHERE manager_id = (SELECT manager_id FROM employees WHERE employee_id = 101);

SELECT * FROM employees WHERE salary > (SELECT avg(salary) FROM employees);

SELECT * FROM employees WHERE department_id IN (SELECT department_id FROM departments WHERE location_id = 1700);

UNDEFINE id;
SELECT * FROM employees WHERE manager_id = (SELECT manager_id FROM employees WHERE employee_id = '&&id') AND employee_id <> '&id';

--ALL key word
SELECT employee_id, last_name, job_id, salary FROM employees WHERE salary < ALL (SELECT salary FROM employees WHERE job_id = 'IT_PROG') AND job_id <> 'IT _PROG';
SELECT MIN(salary) FROM employees WHERE job_id = 'IT_PROG';

SELECT employee_id, last_name, job_id, salary FROM employees WHERE salary < ANY (SELECT salary FROM employees WHERE job_id = 'IT_PROG') AND job_id <> 'IT _PROG';
