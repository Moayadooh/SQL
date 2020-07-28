--Lab practise 5
--Reporting Aggregate Data using Group Fcn V3

/*1. Group functions work across many rows to produce one result per
group. True/False*/ --==> true

/*2. Group functions include nulls in
calculations. True/False*/ --==> false

/*3. The WHERE clause restricts rows before inclusion in a group
calculation. True/False*/ --==> true    ?

/*4. Find the highest, lowest, sum, and average salary of all employees. Label the columns
as Maximum, Minimum, Sum, and Average, respectively. Round your results to the
nearest whole number.*/
select max(SALARY) Maximum, min(SALARY) Minimum, sum(SALARY) Sum, round(avg(SALARY),0) Average from employees;

/*5. Modify the query in lab_05_04.sql to display the minimum, maximum, sum, and
average salary for each job type.*/
select job_id, max(SALARY) Maximum, min(SALARY) Minimum, sum(SALARY) Sum, round(avg(SALARY),0) Average from employees group by job_id;

/*6. Write a query to display the number of people with the same job.*/
select job_id, count(*) from employees group by job_id;
select job_id, count(*) from employees where job_id like '&job' group by job_id;

/*7. Determine the number of managers without listing them. Label the column as Number of
Managers. Hint: Use the MANAGER_ID column to determine the number of managers.*/
select count(distinct manager_id) "Number of Managers" from employees;

/*8. Find the difference between the highest and lowest salaries. Label the column DIFFERENCE.*/
select max(salary)-min(salary) DIFFERENCE from employees;

/*9. Create a report to display the manager number and the salary of the lowest-paid employee
for that manager. Exclude anyone whose manager is not known. Exclude any groups where
the minimum salary is $6,000 or less. Sort the output in descending order of salary.*/
select MANAGER_ID, min(SALARY) from employees where manager_id is not null group by manager_id having min(SALARY) > 6000 order by min(SALARY) desc;

/*10. Create a query to display the total number of employees and, of that total, the number of
employees hired in 2003, 2004, 2005, and 2006. Create appropriate column headings.*/
select count(employee_id) Total,
SUM(DECODE(TO_CHAR(hire_date, 'YYYY'),2003,1,0))"2003",
SUM(DECODE(TO_CHAR(hire_date, 'YYYY'),2004,1,0))"2004",
SUM(DECODE(TO_CHAR(hire_date, 'YYYY'),2005,1,0))"2005",
SUM(DECODE(TO_CHAR(hire_date, 'YYYY'),2006,1,0))"2006"
from employees;

/*11. Create a matrix query to display the job, the salary for that job based on department
number, and the total salary for that job, for departments 20, 50, 80, and 90, giving each
column an appropriate heading.*/
select job_id,
SUM(DECODE(department_id , 20, salary)) "Dept 20",
SUM(DECODE(department_id , 50, salary)) "Dept 50",
SUM(DECODE(department_id , 80, salary)) "Dept 80",
SUM(DECODE(department_id , 90, salary)) "Dept 90",
sum(salary) total
from employees
group by job_id;

