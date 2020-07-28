--Lab practise 5

/*4. Find the highest, lowest, sum, and average salary of all employees. Label the columns
as Maximum, Minimum, Sum, and Average, respectively. Round your results to the
nearest whole number.*/
select round(max(SALARY),0) Maximum, round(min(SALARY),0) Minimum, round(sum(SALARY),0) Sum, round(avg(SALARY),0) Average from employees;

/*
5. Modify the query in lab_05_04.sql to display the minimum, maximum, sum, and
average salary for each job type.
*/
select JOB_ID, round(max(SALARY),0) Maximum, round(min(SALARY),0) Minimum, round(sum(SALARY),0) Sum, round(avg(SALARY),0) Average from employees group by JOB_ID;

--6. Write a query to display the number of people with the same job.
select JOB_ID, count(JOB_ID) from employees group by JOB_ID;


--the types of group functions are avg, count, max and min
--for each use (group by)

--Find the total salary of employee from each department.
select sum(SALARY) from employees group by DEPARTMENT_ID;

/*Display the department number, job id and average salary of all employees. Display the result based on the job id.
Show the output based on the decending order of department id.*/
--select DEPARTMENT_ID, JOB_ID, avg(SALARY) from employees group by JOB_ID order by DEPARTMENT_ID desc;

--Find number of department from employees table
--select count(DEPARTMENT_ID) from employees;

select DEPARTMENT_ID, count(DEPARTMENT_ID) from employees group by DEPARTMENT_ID;

