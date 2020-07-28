--Lab practise 3

--1. Write a query to display the system date. Label the column as Date
select sysdate "Date" from dual;

--Display employee details who joined after 25-JUN-05.
select * from employees where hire_date > '25-JUN-05';

/*2. Display the employee number, last name, salary, and salary increased by 15.5%
(expressed as a whole number) for each employee. Label the column New Salary.*/ 
select EMPLOYEE_ID, LAST_NAME, SALARY, round((SALARY * 1.155),0) "New Salary" from employees; --(SALARY*0.155+SALARY)

/*4. Modify your query lab_03_02.sql to add a column that subtracts the old salary from the
new salary. Label the column Increase.*/
select EMPLOYEE_ID, LAST_NAME, SALARY, round((SALARY * 1.155),0) "New Salary", round((SALARY * 1.155),0) - SALARY Increase from employees;

/*5. Write a query that displays the last name (with the first letter in uppercase and all the other
letters in lowercase) and the length of the last name for all employees whose name starts with
the letters “J,” “A,” or “M.” Give each column an appropriate label. Sort the results by the
employees’ last names.*/
select Initcap(LAST_NAME) Name, length(LAST_NAME) Length from employees where LAST_NAME like 'J%' or LAST_NAME like 'A%' or LAST_NAME like 'M%'
order by last_name;



/*Write a query that displays the last name for all employees (with the first letter only in uppercase).
If the user is prompted to enter a letter that the last name starts with, display the result accordingly.*/
select Initcap(LAST_NAME) Name, length(LAST_NAME) Length from employees where LAST_NAME like upper('&FirstLetter%') order by last_name;

--SYSDATE >> To display current datae and time

--LOWER >> function conver to lower case

--UPPER >> function conver to upper case

--INITCAP >> function convert first letter to capital letter

--LENGTH >> function display the length of the string

/*
SYSDATE is a date function that returns the current date and time.
It is customary to select SYSDATE from a dummy table called DUAL.
*/