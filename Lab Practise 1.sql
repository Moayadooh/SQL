--Lab Practise 1
--Retrieving Data using SELECT statement

/*4. Determine the structure of the DEPARTMENTS table and its contents.*/
describe departments;
describe employees;

/*7. The HR department wants a query to display all unique job codes from the EMPLOYEES table.*/
select distinct job_id from EMPLOYEES;

/*8. The HR department wants more descriptive column headings for its report on employees. Name the column headings
Emp #, Employee, Job, and Hire Date, respectively. Then run your query again.*/
select employee_id "Emp #", last_name Employee, job_id Job, hire_date "Hire Date" from employees;

/*9. The HR department has requested a report of all employees and their job IDs. Display the last
name concatenated with the job ID (separated by a comma and space) and name the column
Employee and Title.*/
select last_name || ', ' || job_id "Employee and Title" from employees;

/*10. To familiarize yourself with the data in the EMPLOYEES table, create a query to display all the
data from that table. Separate each column output by a comma. Name the column title
THE_OUTPUT.*/
select EMPLOYEE_ID || ',' || FIRST_NAME || ',' || LAST_NAME || ',' || EMAIL || ',' 
|| PHONE_NUMBER || ',' || HIRE_DATE || ',' || JOB_ID || ',' || SALARY || ',' 
|| COMMISSION_PCT || ',' || MANAGER_ID || ',' || DEPARTMENT_ID THE_OUTPUT from employees;

