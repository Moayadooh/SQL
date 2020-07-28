--Lab practise 3
--Output Customisation

/*1. Write a query to display the system date. Label the column as Date.
Note: If your database is remotely located in a different time zone, the output will be the date
for the operating system on which the database resides.*/
select sysdate "Date" from dual;

/*2. The HR department needs a report to display the employee number, last name, salary, and
salary increased by 15.5% (expressed as a whole number) for each employee. Label the column
New Salary.*/
select DEPARTMENT_ID, LAST_NAME, SALARY, round(SALARY+(SALARY*0.155),0) "New Salary" from employees;

/*4. Modify your query lab_03_02.sql to add a column that subtracts the old salary from the
new salary. Label the column Increase.*/
select DEPARTMENT_ID, LAST_NAME, SALARY, round(SALARY+(SALARY*0.155),0) "New Salary", round(SALARY+(SALARY*0.155),0)-SALARY Increase from employees;

/*5. Write a query that displays the last name (with the first letter in uppercase and all the other
letters in lowercase) and the length of the last name for all employees whose name starts with
the letters “J,�? “A,�? or “M.�? Give each column an appropriate label. Sort the results by the
employees’ last names.*/
select initcap(LAST_NAME) Name, length(LAST_NAME) Length from employees where LAST_NAME like 'J%' or LAST_NAME like 'A%' or LAST_NAME like 'M%' order by LAST_NAME;
select initcap(LAST_NAME) Name, length(LAST_NAME) Length from employees where LAST_NAME like initcap('&letter%') order by LAST_NAME;

/*6. The HR department wants to find the duration of employment for each employee. For each
employee, display the last name and calculate the number of months between today and the
date on which the employee was hired. Label the column as MONTHS_WORKED. Order your
results by the number of months employed. Round the number of months up to the closest
whole number.*/
select last_name, ROUND(MONTHS_BETWEEN(SYSDATE, hire_date)) MONTHS_WORKED from employees order by MONTHS_WORKED;

/*7. Create a query to display the last name and salary for all employees. Format the salary to be 15
characters long, left-padded with the $ symbol. Label the column as SALARY.*/
select last_name, LPAD(salary, 15, '$') SALARY from employees;

/*8. Create a query that displays the first eight characters of the employees’ last names and indicates
the amounts of their salaries with asterisks. Each asterisk signifies a thousand dollars. Sort the
data in descending order of salary. Label the column as
EMPLOYEES_AND_THEIR_SALARIES.*/
SELECT rpad(last_name, 8)||' '|| rpad(' ', salary/1000+1, '*') EMPLOYEES_AND_THEIR_SALARIES FROM  employees ORDER BY salary DESC;

/*9. Create a query to display the last name and the number of weeks employed for all employees in
department 90. Label the number of weeks column as TENURE. Truncate the number of weeks
value to 0 decimal places. Show the records in descending order of the employee’s tenure.
Note: The TENURE value will differ as it depends on the date on which you run the query.*/
select last_name, round(trunc((sysdate-hire_date)/7)) TENURE from employees where department_id = 90 order by TENURE desc;

