--Lab practise 5

/*7. Determine the number of managers without listing them. Label the column as Number of
Managers. Hint: Use the MANAGER_ID column to determine the number of managers.*/
select count(distinct MANAGER_ID) "Number of Managers" from employees;

--8. Find the difference between the highest and lowest salaries. Label the column DIFFERENCE. 
select max(SALARY) - min(SALARY) "DIFFERENCE" from employees;

/*9. Display the manager number and the salary of the lowest-paid employee
for that manager. Exclude anyone whose manager is not known. Exclude any groups where
the minimum salary is $6,000 or less. Sort the output in descending order of salary. */
select MANAGER_ID, min(SALARY) from employees where MANAGER_ID is not null group by MANAGER_ID having min(SALARY) > 6000 order by min(SALARY) desc;
-- After a goup by you have to use hAVING key word to write a condition



--Find the maximum and the total salary of employees whose job id is like REP (if REP contains in the jobid)
select max(SALARY) "Maximum Salary", sum(SALARY) "Total Salary" from employees where JOB_ID like '%REP%';

--Find the total number of employees who have got commission
select count(EMPLOYEE_ID) "Number of employees" from employees where COMMISSION_PCT is not null;

--Find the number of sales representatives (job id is SA_REP)
select count(EMPLOYEE_ID) "sales representatives" from employees where JOB_ID = 'SA_REP';

