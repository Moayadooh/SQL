--Chapter 6
--Displaying Data from Multiple Tables
/*
-natural join
-using
-left outer join, right outer join, full outer join
-alies, on
-self join
*/
SELECT * FROM employees;
SELECT * FROM departments;

SELECT * FROM employees NATURAL JOIN departments;
SELECT * FROM employees JOIN departments using (manager_id);

SELECT * FROM employees LEFT OUTER JOIN departments using (manager_id);
SELECT * FROM employees RIGHT OUTER JOIN departments using (manager_id);
SELECT * FROM employees FULL OUTER JOIN departments using (manager_id);

SELECT e.employee_id, e.last_name, e.department_id, d.department_name FROM employees e, departments d WHERE e.department_id = d.department_id;
SELECT e.employee_id, e.last_name, e.department_id, d.department_name FROM employees e JOIN departments d ON e.department_id = d.department_id;

SELECT e.employee_id, e.last_name, e.manager_id, m.last_name FROM employees e, employees m WHERE e.manager_id = m.employee_id;

SELECT last_name, department_name
FROM
employees
CROSS JOIN departments ;

select * from employees;
select * from departments;