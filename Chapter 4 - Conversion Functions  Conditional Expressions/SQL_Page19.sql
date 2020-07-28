--Chapter 4
select EMPLOYEE_ID, HIRE_DATE from employees;

--fm ==> unwanted space will be removed
SELECT last_name, TO_CHAR(hire_date, 'fmDD Month YYYY') HIREDATE FROM employees;

--DISPLAY EMPLOYEEID, LASTNAME , HIREDATE(can be shown as 'MM/YY' format) where lastname is Taylor
SELECT EMPLOYEE_ID, last_name, TO_CHAR(hire_date, 'MM/YY') HIREDATE FROM employees where LAST_NAME = 'Taylor';

SELECT last_name, TO_CHAR(hire_date, 'MM/YYYY') HIREDATE FROM employees;
SELECT last_name, TO_CHAR(hire_date, 'DD-Mon-YYYY') FROM employees WHERE hire_date < TO_DATE('01-Jan-07','DD-Mon-RR');

--Lab practise 4
/*1. Create a report that produces the following for each employee:
<employee last name> earns <salary> monthly but wants <3 times
salary.>. Label the column Dream Salaries.*/
select LAST_NAME || ' earns ' || SALARY || ' monthly but wants ' || SALARY*3 "Dream Salaries" from employees;
select LAST_NAME || ' earns ' || to_char(SALARY, 'fm$99,999.00') || ' monthly but wants ' || to_char(SALARY*3, 'fm$99,999.00') "Dream Salaries" from employees;

--Nesting Functions
SELECT last_name, UPPER(CONCAT(SUBSTR (LAST_NAME, 1, 8), '_US')) FROM employees WHERE department_id = 60;

--NVL --> Replace null with value
SELECT last_name, salary, NVL(commission_pct, 0), (salary*12) + (salary*12*NVL(commission_pct, 0)) AN_SAL FROM employees;

--NVL2 --> if not null replace with first else replace with second
SELECT last_name, salary, commission_pct, NVL2(commission_pct, 'SAL+COMM', 'SAL') income FROM employees WHERE department_id IN (50, 80);

--NULLIF --> if both are equal return null else return first value
SELECT first_name, LENGTH(first_name) "expr1", last_name, LENGTH(last_name) "expr2", NULLIF(LENGTH(first_name), LENGTH(last_name)) result FROM employees;

--COALESCE --> if both are null return the value else if first not null then return first else return second
SELECT last_name, employee_id, COALESCE(TO_CHAR(commission_pct),TO_CHAR(manager_id), 'No commission and no manager') FROM employees;

--CASE Expression
SELECT last_name, job_id, salary,
CASE job_id 
WHEN 'IT_PROG' THEN 1.10*salary
WHEN 'ST_CLERK' THEN 1.15*salary
WHEN 'SA_REP' THEN 1.20*salary
ELSE salary END "REVISED_SALARY"
FROM employees;

--DECODE Function
SELECT last_name, job_id, salary,
DECODE(job_id, 
'IT_PROG', 1.10*salary,
'ST_CLERK', 1.15*salary,
'SA_REP', 1.20*salary,
salary)
REVISED_SALARY
FROM employees;

SELECT last_name, salary,
DECODE (TRUNC(salary/2000, 0),
0, 0.00,
1, 0.09,
2, 0.20,
3, 0.30,
4, 0.40,
5, 0.42,
6, 0.44,
0.45) TAX_RATE
FROM employees
WHERE department_id = 80;