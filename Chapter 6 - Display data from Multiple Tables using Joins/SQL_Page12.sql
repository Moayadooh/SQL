--Lab practise 6

/*3. The HR department needs a report of employees in Toronto. Display the last name, job,
department number, and the department name for all employees who work in Toronto.*/
select LAST_NAME, JOB_ID, e.DEPARTMENT_ID, DEPARTMENT_NAME
from employees e join departments d
on (e.department_id = d.department_id)
JOIN locations l
ON (d.location_id = l.location_id)
WHERE city = 'Toronto';

/*SELECT e.last_name, e.job_id, e.department_id, d.department_name
FROM   employees e JOIN departments d 
ON     (e.department_id = d.department_id)
JOIN   locations l
ON     (d.location_id = l.location_id)
WHERE LOWER(l.city) = 'toronto';*/



--Alias --> another name
--The table alias is necessary to qualify the matching column_names.
--if column in both table you have to use alias

--qualify manager_id column
SELECT e.employee_id, e.last_name, e.department_id, d.department_id, d.location_id
FROM employees e
JOIN departments d
ON (e.department_id = d.department_id);

--join three tables
SELECT employee_id, city, department_name
FROM employees e
JOIN departments d
ON d.department_id = e.department_id
JOIN locations l
ON d.location_id = l.location_id;

