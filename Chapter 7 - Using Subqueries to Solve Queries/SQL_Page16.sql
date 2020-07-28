--Lab practise 7

/*2. Create a report that displays the employee number, last name, and salary of all employees who
earn more than the average salary. Sort the results in order of ascending salary.*/
select employee_id, last_name, salary from employees where salary > 
(select avg(salary) from employees) order by salary asc;

/*3. Write a query that displays the employee number and last name of all employees who work in a
department with any employee whose last name contains the letter "u".*/
select EMPLOYEE_ID, LAST_NAME from employees where DEPARTMENT_ID in  --use in when the statement return multiple rows
(select DEPARTMENT_ID from employees where LAST_NAME like '%u%');

/*4. The HR department needs a report that displays the last name, department number, and job ID
of all employees whose department location ID is 1700.*/
select LAST_NAME, DEPARTMENT_ID, JOB_ID from employees where DEPARTMENT_ID in --use in when the statement return multiple rows
(select DEPARTMENT_ID from departments where LOCATION_ID = 1700);

/*5. Create a report for HR that displays the last name and salary of every employee who reports to
King.*/
select LAST_NAME, SALARY from employees where manager_id in  --use in when the statement return multiple rows
(select employee_id from employees where LAST_NAME = 'King');

/*6. Create a report for HR that displays the department number, last name, and job ID for every
employee in the Executive department.*/
select DEPARTMENT_ID, LAST_NAME, JOB_ID from employees where department_id = 
(select department_id from departments where department_name = 'Executive');

/*7. Modify the query in lab_07_03.sql to display the employee number, last name, and salary
of all employees who earn more than the average salary, and who work in a department with
any employee whose last name contains a "u".*/
select EMPLOYEE_ID, LAST_NAME, SALARY from employees where salary > 
(select avg(salary) from employees) and department_id in
(select DEPARTMENT_ID from employees where LAST_NAME like '%u%');

