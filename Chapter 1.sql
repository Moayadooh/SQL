
SELECT * FROM employees;

DESC employees;
DESCRIBE employees;

SELECT DISTINCT manager_id FROM employees;

SELECT employee_id || ' ' || first_name || ' ' || last_name "Employee Details" FROM employees;
