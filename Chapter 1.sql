--Chapter 1
--Retrieving Data Using the SQL SELECT Statement
/*
-table structure
-unique data in column
-concatination
-column name
*/
select * from employees;

describe employees;

select distinct manager_id from employees;

select employee_id || ' ' || first_name || ' ' || last_name "Employee Details" from employees;