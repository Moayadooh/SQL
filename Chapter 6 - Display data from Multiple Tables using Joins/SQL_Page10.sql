
SELECT department_id, department_name, location_id, city FROM departments NATURAL JOIN locations;

SELECT department_id, department_name, location_id, city FROM departments NATURAL JOIN locations WHERE department_id IN (20, 50);

--Display employee id, employee name, department id and department name using natural join
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, DEPARTMENT_ID, DEPARTMENT_NAME FROM employees NATURAL JOIN departments;

--Display employee id, employee name, department id and department name using natural join.
--show the output for the first name starting with letter N.
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, DEPARTMENT_ID, DEPARTMENT_NAME FROM employees NATURAL JOIN departments WHERE FIRST_NAME like 'N%';

