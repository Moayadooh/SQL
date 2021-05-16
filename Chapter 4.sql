--Chapter 4
--Using Conversion Functions and Conditional Expressions
/*
-date format function
-salary format function
-concat, substr
-nvl(Replace null with value), nvl2(if not null replace with first else replace with second)
-nullif(if both are equal return null else return first value. "sort based on the second value")
-coalesce(if both are null return the value else if first not null then return first else return second)
-case expression (case, when, then, else, end)
*/
SELECT to_char(hire_date, 'dd/MON/yyyy') FROM employees WHERE employee_id = 100;
SELECT to_char(salary, 'fm$99,999.00') FROM employees WHERE employee_id = 100;

SELECT concat(last_name,'000') FROM employees WHERE employee_id = 100;
SELECT substr(last_name,1,3) FROM employees WHERE employee_id = 100;

SELECT nvl(COMMISSION_PCT,0) FROM employees;
SELECT nvl2(COMMISSION_PCT,'YES','NONE') FROM employees;

SELECT nullif(LENGTH(first_name), LENGTH(last_name)) FROM employees;
SELECT coalesce(COMMISSION_PCT,manager_id) FROM employees;
SELECT * FROM employees;
SELECT last_name, job_id, salary, 
CASE job_id 
WHEN 'IT_PROG' THEN salary*2 
WHEN 'ST_MAN' THEN salary*1.5 
ELSE salary END FROM employees;