--Chapter 3
--Using Single-Row Functions to Customize Output
/*
-lower, upper, initcap, round, length, count, sum, avg, max, min
-sysdate from dual
-months_between, trunc
-lpad (right-padded), rpad (left-padded)
*/
SELECT * FROM employees;

SELECT round(avg(salary),2) FROM employees;

SELECT SYSDATE FROM dual;
SELECT SYSDATE-hire_date FROM employees WHERE employee_id = 100; --Return number of days

SELECT last_name, round(months_between(SYSDATE, hire_date)) FROM employees;
SELECT last_name, trunc((SYSDATE-hire_date)/7) FROM employees;

SELECT lpad(last_name,3) FROM employees;
SELECT rpad(last_name,15, '*') FROM employees;
SELECT lpad(' ', salary/1000+1, '$') FROM employees;-- +1 is added to include one more symbol that hidden due to the space in the beginning