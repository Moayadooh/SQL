--Lab practise 6
--Display data from Multiple Tables using Joins

/*1. Write a query for the HR department to produce the addresses of all the departments. Use the
LOCATIONS and COUNTRIES tables. Show the location ID, street address, city, state or
province, and country in the output. Use a NATURAL JOIN to produce the results.*/
select LOCATION_ID, STREET_ADDRESS, CITY, STATE_PROVINCE, COUNTRY_NAME from locations natural join countries;

/*2. The HR department needs a report of all employees. Write a query to display the last name,
department number, and department name for all the employees.*/
select last_name, department_id, department_name from employees left outer join departments using (department_id);

/*3. The HR department needs a report of employees in Toronto. Display the last name, job,
department number, and the department name for all employees who work in Toronto.*/
select last_name, job_id, department_id, department_name from employees join departments using (department_id)
join locations using (LOCATION_ID) where CITY = 'Toronto';

/*4. Create a report to display employees’ last name and employee number along with their
manager’s last name and manager number. Label the columns Employee, Emp#, Manager,
and Mgr#, respectively. Save your SQL statement as lab_06_04.sql. Run the query.*/
select e.last_name Employee, e.employee_id Emp#, m.last_name Manager, m.manager_id Mgr#
from employees e join employees m
on e.employee_id = m.manager_id;

/*5. Modify lab_06_04.sql to display all employees including King, who has no manager.
Order the results by the employee number.*/
select e.last_name Employee, e.employee_id Emp#, m.last_name Manager, m.manager_id Mgr#
from employees e left outer join employees m
on e.employee_id = m.manager_id order by e.employee_id;

/*6. Create a report for the HR department that displays employee last names, department numbers,
and all the employees who work in the same department as a given employee. Give each
column an appropriate label.*/
select e.DEPARTMENT_ID department, e.LAST_NAME employee, c.LAST_NAME colleague
from employees e join employees c
on e.DEPARTMENT_ID = c.DEPARTMENT_ID
WHERE  e.employee_id <> c.employee_id
ORDER BY e.department_id, e.last_name, c.last_name;

/*8. The HR department wants to determine the names of all the employees who were hired after
Davies. Create a query to display the name and hire date of any employee hired after employee
Davies.*/
select e.last_name, e.hire_date from employees e join employees d
on e.hire_date > d.hire_date
where d.last_name = 'Davies';

/*9. The HR department needs to find the names and hire dates of all the employees who were hired
before their managers, along with their managers’ names and hire dates.*/
select e.last_name, e.hire_date, m.last_name, m.hire_date
from employees e join employees m
on e.manager_id = m.employee_id
where e.hire_date < m.hire_date;

