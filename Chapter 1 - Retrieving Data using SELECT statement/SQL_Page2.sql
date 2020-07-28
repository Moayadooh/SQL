
--select JOB_ID || ',' || JOB_ID as aaa from JOBS;
select JOB_ID "code", JOB_TITLE "title" from JOBS;

--1. Based on the HR Table, display all unique jobid.
select distinct JOB_ID from JOBS;

/*2. Display the following columns from Employee table.
Employee_id, First_name, Job_id and Hire_date
Name the column headings Emp#, Employeename, jobcode and joiningdate.*/
select EMPLOYEE_ID "Emp#", LAST_NAME "Employeename", JOB_ID "jobcode", HIRE_DATE "joiningdate" from EMPLOYEES;

--3. Display the last name concatenated with the job ID (seprated by a comma) and name the column Employee and Title.
select LAST_NAME || ', ' || JOB_ID "Employee and Title" from EMPLOYEES;

/*4. Display the following concatenated result.
EMPID, FIRSTNAME, LASTNAME, EMAIL, salary (seprated by a comma) and name the column as Salary Report.*/
select EMPLOYEE_ID || ',' || FIRST_NAME || ',' || LAST_NAME || ',' || EMAIL || ',' || SALARY "Salary Report" from EMPLOYEES;

--5. Display the last name and salary for any employee whose salary is in the range of RO 5,000 to RO 12,000.
--select LAST_NAME, SALARY from EMPLOYEES where SALARY > 5000 and SALARY < 12000;
select LAST_NAME, SALARY from EMPLOYEES where SALARY between 5000 and 12000;

--6. Display the last name and salary for any employee whose salary is NOT in the range of RO 5,000 to RO 12,000.
select LAST_NAME, SALARY from EMPLOYEES where SALARY not between 5000 and 12000;

