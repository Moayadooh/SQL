--Lab practise 2

/*9. Display the last name, salary, and commission of all employees who earn commissions. Sort data in descending order of salary
and commissions. Use the column’s numeric position in the ORDER BY clause.*/
select LAST_NAME, SALARY, COMMISSION_PCT from employees where COMMISSION_PCT is not null order by 2 desc;

--10. Displays the last name and salary of employees who earn more than an amount that the user specifies after a prompt.
select LAST_NAME, SALARY from employees where SALARY > &amount;

/*11. Create a query that prompts the user for a manager ID and generates the employee ID, last name, salary, and department for
that manager’s employees. The HR department wants the ability to sort the report on a selected column.*/
select EMPLOYEE_ID, LAST_NAME, SALARY, DEPARTMENT_ID from employees where MANAGER_ID = &ID order by &Column;--order by 3  >>  display based on third column

--12. Display all employee last names in which the third letter of the name is “a.”
select LAST_NAME from employees where LAST_NAME like '__a%';

--13. Display the last names of all employees who have both an “a” and an “e” in their last name
select LAST_NAME from employees where LAST_NAME like '%a%' or LAST_NAME like '%e%';

/*14. Display the last name, job, and salary for all employees whose jobs are either those of a sales
representative or of a stock clerk, and whose salaries are not equal to $2,500, $3,500, or $7,000.*/
select LAST_NAME, JOB_ID, SALARY from employees where JOB_ID in('SA_REP','ST_CLERK') or SALARY not in(2500,3500,7000);

--15. Display the last name, salary, and commission for all employees whose commission is 20%.
select LAST_NAME, SALARY, COMMISSION_PCT from employees where COMMISSION_PCT = 0.2;

