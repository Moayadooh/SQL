--Lab practise 7
--Using Subqueries to Solve Queries

/*1. The HR department needs a query that prompts the user for an employee last name. The query
then displays the last name and hire date of any employee in the same department as the
employee whose name they supply (excluding that employee). For example, if the user enters
Zlotkey, find all employees who work with Zlotkey (excluding Zlotkey).*/
UNDEFINE name;
select LAST_NAME, HIRE_DATE from employees where department_id = 
(select department_id from employees where last_name = '&&name') and last_name <> '&name';

/*2. Create a report that displays the employee number, last name, and salary of all employees who
earn more than the average salary. Sort the results in order of ascending salary.*/
select employee_id, last_name, salary from employees where salary > 
(select avg(salary) from employees) order by salary asc;

/*3. Write a query that displays the employee number and last name of all employees who work in a
department with any employee whose last name contains the letter "u".*/
select employee_id, last_name from employees where department_id in 
(select department_id from employees where last_name like '%u%');

/*4. The HR department needs a report that displays the last name, department number, and job ID
of all employees whose department location ID is 1700.*/
select last_name, department_id, job_id from employees where department_id in
(select department_id from departments where location_id = 1700);

/*5. Create a report for HR that displays the last name and salary of every employee who reports to
King.*/
select last_name, salary from employees where manager_id in
(select employee_id from employees where last_name = 'King');

/*6. Create a report for HR that displays the department number, last name, and job ID for every
employee in the Executive department.*/
select DEPARTMENT_ID, LAST_NAME, JOB_ID from employees where department_id =
(select department_id from departments where department_name = 'Executive');

/*7. Modify the query in lab_07_03.sql to display the employee number, last name, and salary
of all employees who earn more than the average salary, and who work in a department with
any employee whose last name contains a "u".*/
select employee_id, last_name, salary from employees where salary > 
(select avg(salary) from employees)
and department_id in
(select department_id FROM employees where last_name like '%u%');