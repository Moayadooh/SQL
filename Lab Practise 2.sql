--Lab practise 2
--Restricting  Sorting Data

/*1. Because of budget issues, the HR department needs a report that displays the last name and
salary of employees who earn more than $12,000.*/
select last_name, salary from employees where salary > 12000;

/*2. Create a report that displays the last name and department number
for employee number 176. Run the query.*/
select last_name, department_id from employees where employee_id = 176;

/*3. The HR department needs to find high-salary and low-salary employees. Display the last name and salary
for any employee whose salary is not in the range of $5,000 to $12,000.*/
select last_name, salary from employees where salary not between 5000 and 12000;

/*4. Create a report to display the last name, job ID, and start date for the employees with the last
names of Matos and Taylor. Order the query in ascending order by the start date.*/
select last_name, job_id, hire_date from employees where last_name in ('Matos','Taylor');

/*5. Display the last name and department number of all employees in departments 20 or 50 in
ascending alphabetical order by name.*/
select last_name, department_id from employees where department_id in (20,50) order by last_name asc;

/*6. Display the last name and salary of employees who earn between
$5,000 and $12,000, and are in department 20 or 50. Label the columns Employee and
Monthly Salary, respectively.*/
select last_name Employee, salary "Monthly Salary" from employees where department_id in (20,50) order by last_name asc;

/*7. The HR department needs a report that displays the last name and hire date for all employees
who were hired in 2002.*/
select last_name, hire_date from employees where hire_date like '%02';

/*8. Create a report to display the last name and job title of all employees who do not have a manager.*/
select last_name, job_id from employees where manager_id is null;

/*9. Create a report to display the last name, salary, and commission of all employees who earn
commissions. Sort data in descending order of salary and commissions.
Use the columnâ€™s numeric position in the ORDER BY clause.*/
select LAST_NAME, SALARY, COMMISSION_PCT from employees where COMMISSION_PCT is not null order by 2 desc, 3 desc;

/*10. Members of the HR department want to have more flexibility with the queries that you are
writing. They would like a report that displays the last name and salary of employees who earn
more than an amount that the user specifies after a prompt.*/
select LAST_NAME, SALARY from employees where SALARY > '&amount';

/*11. The HR department wants to run reports based on a manager. Create a query that prompts the
user for a manager ID and generates the employee ID, last name, salary, and department for
that manager’s employees. The HR department wants the ability to sort the report on a selected
column.*/
select EMPLOYEE_ID, LAST_NAME, SALARY, DEPARTMENT_ID from employees where manager_id = '&manager_id' order by '&col_num';

/*12. Display all employee last names in which the third letter of the name is “a.”*/
select LAST_NAME from employees where LAST_NAME like '__a%';

/*13. Display the last names of all employees who have both an “a” and an “e” in their last name.*/
select LAST_NAME from employees where LAST_NAME like '%a%' and LAST_NAME like '%e%';

/*14. Display the last name, job, and salary for all employees whose jobs are either those of a sales
representative or of a stock clerk, and whose salaries are not equal to $2,500, $3,500, or $7,000.*/
select LAST_NAME, JOB_ID, SALARY from employees where JOB_ID in ('SA_REP','ST_CLERK') and SALARY not in (2500,3500,7000);

/*15. Modify lab_02_06.sql to display the last name, salary, and commission for all employees
whose commission is 20%.*/
select LAST_NAME, SALARY, COMMISSION_PCT from employees where COMMISSION_PCT = 0.2;

