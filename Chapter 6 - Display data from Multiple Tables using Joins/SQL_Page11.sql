--Lab practise 6

/*1. Write a query for the HR department to produce the addresses of all the departments. Use the
LOCATIONS and COUNTRIES tables. Show the location ID, street address, city, state or
province, and country in the output. Use a NATURAL JOIN to produce the results.*/
select LOCATION_ID, STREET_ADDRESS, CITY, STATE_PROVINCE, COUNTRY_NAME from locations NATURAL JOIN countries;

/*2. The HR department needs a report of all employees. Write a query to display the last name,
department number, and department name for all the employees.*/
select LAST_NAME, DEPARTMENT_ID, DEPARTMENT_NAME from employees JOIN departments USING (department_id);


--equijoin -->equivalent join
--equijoins are also called simple joins or inner joins
SELECT employee_id, last_name, location_id, department_id FROM employees JOIN departments USING (department_id);
SELECT employee_id, last_name, job_id, department_id FROM employees JOIN jobs USING (job_id);

select department_id, department_name, location_id, city from departments natural join locations;--LOCATION_ID is common in both tables
select LAST_NAME, DEPARTMENT_ID, DEPARTMENT_NAME from employees NATURAL JOIN departments;--DEPARTMENT_ID and MANAGER_ID are common in both tables