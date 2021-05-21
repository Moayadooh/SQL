
SELECT AVG(salary), MAX(hire_date), MIN(last_name), SUM(salary) FROM employees;

SELECT COUNT(*) from employees where department_id > 80; --count null values
SELECT COUNT(commission_pct) from employees where department_id > 80; --count non-null values


SELECT manager_id, sum(salary) FROM employees WHERE manager_id IS NOT NULL GROUP BY manager_id HAVING sum(salary) > 20000;
