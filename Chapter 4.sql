
SELECT TO_CHAR(hire_date, 'dd/MON/yyyy') FROM employees WHERE employee_id = 100;

SELECT TO_CHAR(salary, 'fm$99,999.00') FROM employees WHERE employee_id = 100;

SELECT last_name, TO_CHAR(hire_date, 'DD-Mon-YYYY') FROM employees WHERE hire_date < TO_DATE('01-Jan-2012','DD-Mon-RR');

SELECT CONCAT(last_name,'000') FROM employees WHERE employee_id = 100;

SELECT SUBSTR(last_name,1,3) FROM employees WHERE employee_id = 100;

SELECT NVL(COMMISSION_PCT,0) FROM employees;

SELECT NVL2(COMMISSION_PCT,'YES','NONE') FROM employees;

SELECT NULLIF(LENGTH(first_name), LENGTH(last_name)) FROM employees;

SELECT COALESCE(COMMISSION_PCT,manager_id) FROM employees;

SELECT last_name, job_id, salary, 
CASE job_id 
WHEN 'IT_PROG' THEN salary * 2 
WHEN 'ST_MAN' THEN salary * 1.5 
ELSE salary END FROM employees;
