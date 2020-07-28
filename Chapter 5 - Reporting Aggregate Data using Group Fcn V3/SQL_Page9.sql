
--Display the department NO and maximum salary of each department. Exclude the maximum salary if it is less than 10000
select DEPARTMENT_ID, max(SALARY) from employees where DEPARTMENT_ID is not null group by DEPARTMENT_ID having max(SALARY) >= 10000;

--Display the job id and average salary for each job that has a average salary not exceeding 10,000.
--The example excludes sales representative and sort the list by the average salary
select JOB_ID, avg(SALARY) from employees where JOB_ID != 'SA_REP' group by JOB_ID having avg(SALARY) <= 10000 order by avg(SALARY);

--Find the average salary from each department, display the maximum of average salary
select max(avg(SALARY)) from employees group by DEPARTMENT_ID;



--Chapter 5 Q 1 to 9 important

