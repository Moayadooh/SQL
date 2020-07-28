--Lab practise 2

--5. Display the last name and department number of all employees in departments 20 or 50 in ascending alphabetical order by name.
select last_name, department_id from employees where department_id = 20 or department_id = 50 order by last_name asc;

/*6. Display the last name and salary of employees who earn between
$5,000 and $12,000, and are in department 20 or 50. Label the columns Employee and
Monthly Salary, respectively.*/
select last_name as Employee, salary "Monthly Salary"  from employees where salary between 5000 and 12000 and department_id in (20,50);

--7. The HR department needs a report that displays the last name and hire date for all employees who were hired in 2002.
select last_name, hire_date from employees where hire_date like '%02'; --between '01-Jan-2002' and '31-dec-2002';

--8. Display the last name and job title of all employees who do not have a manager.
select LAST_NAME, JOB_ID from employees where manager_id is null;



--Display empno, Firstname, lastname where Jobid is IT_PROG and last name starting with A
select EMPLOYEE_ID, FIRST_NAME, LAST_NAME from employees where job_id = 'IT_PROG' and LAST_NAME like 'A%';

--Display the last name and job title of all employees who have a manager.
select LAST_NAME, JOB_ID from employees where manager_id is not null;

--Display employeedetails where hire date is given in June or Salary is greater than 10,000
select * from employees where HIRE_DATE like '%jun%' or SALARY > 10000;

