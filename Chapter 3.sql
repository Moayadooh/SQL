
SELECT * FROM employees;

SELECT LOWER(first_name), UPPER(last_name), INITCAP(email), LENGTH(first_name|| '' ||last_name) FROM employees;

SELECT ROUND(AVG(salary),2) FROM employees;
SELECT last_name, ROUND(MONTHS_BETWEEN(SYSDATE, hire_date)) FROM employees;

SELECT last_name, TRUNC((SYSDATE-hire_date)/7) FROM employees;
SELECT MOD(MAX(salary),MIN(salary)) FROM employees;

SELECT sysdate FROM dual;
SELECT sysdate-hire_date FROM employees WHERE employee_id = 100; --return number of days

SELECT LPAD(last_name,3) FROM employees;
SELECT RPAD(last_name,15, '*') FROM employees;
SELECT LPAD(' ', salary/1000+1, '$') FROM employees; -- +1 is added to include one more symbol that hidden due to the space in the beginning
