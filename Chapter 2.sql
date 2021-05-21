
SELECT * FROM employees;

SELECT * FROM employees WHERE salary < (1000*5);

SELECT employee_id, last_name, salary FROM employees WHERE salary BETWEEN 10000 AND 20000;

SELECT * FROM employees WHERE commission_pct IS NOT NULL ORDER BY last_name DESC;

SELECT * FROM employees WHERE last_name LIKE 'K%' OR first_name LIKE '___a';

SELECT * FROM employees WHERE salary IN ('&salary1','&salary2');

SET VERIFY OFF
SET VERIFY ON
--https://www.oreilly.com/library/view/oracle-sqlplus-the/0596007469/re106.html

SET ECHO OFF
SET ECHO ON

--Execute script using Path
@/home/moayad/Documents/SQL/SQL_Script/sql
