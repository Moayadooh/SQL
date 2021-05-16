--Chapter 1
--Retrieving Data Using the SQL SELECT Statement
/*
-table structure
-unique data in column
-concatination
-column name
*/
SELECT * FROM employees;

DESCRIBE employees;

SELECT DISTINCT manager_id FROM employees;

SELECT employee_id || ' ' || first_name || ' ' || last_name "Employee Details" FROM employees;