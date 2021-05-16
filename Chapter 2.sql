--Chapter 2
--Restricting and Sorting Data
/*
-operators (>, <, +, -, *, /, =)
-and, between, not, in, null
-order by (acending, decending)
-like (%, ___)
-'&name'
*/
SELECT * FROM employees;

SELECT * FROM employees WHERE salary < (1000*5);

SELECT employee_id, last_name, salary FROM employees WHERE salary BETWEEN 10000 AND 20000;

SELECT * FROM employees WHERE commission_pct IS NOT NULL ORDER BY last_name DESC;

SELECT * FROM employees WHERE last_name LIKE 'K%' OR first_name LIKE '___a';

SELECT * FROM employees WHERE salary IN ('&salary1','&salary2');