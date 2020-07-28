
/*Display the employees whose job ID is the same as that of employee 141:*/
SELECT last_name, job_id
FROM employees
WHERE job_id =
(SELECT job_id
FROM employees
WHERE employee_id = 141);

/*Types of Subqueries
• Single-row subqueries: Queries that return only one row from the inner SELECT statement
• Multiple-row subqueries: Queries that return more than one row from the inner SELECT statement
Note: There are also multiple-column subqueries, which are queries that return more than one
column from the inner SELECT statement. These are covered in the Oracle Database 11g: SQL Fundamentals II course.*/

--Display last name, job id and salary of all employees who's job id is similar to Lee's job id and salary is greater than Lee's salary
SELECT last_name, job_id, salary 
FROM employees 
WHERE job_id = 
(SELECT job_id 
FROM employees 
WHERE last_name = 'Lee')
 AND salary > 
(SELECT salary 
FROM employees 
WHERE last_name = 'Lee');

SELECT last_name, job_id, salary
FROM employees 
WHERE salary =
(SELECT MIN(salary)
FROM employees);

SELECT department_id, MIN(salary)
FROM employees
GROUP BY department_id
HAVING MIN(salary) > 
(SELECT MIN(salary)
FROM employees
WHERE department_id = 50);

SELECT last_name, salary, department_id
FROM employees
WHERE salary IN
(SELECT MIN(salary) 
FROM employees
GROUP BY department_id);