
describe departments;

insert into departments (DEPARTMENT_ID, DEPARTMENT_NAME) values (300,'Moayad');

insert into departments values (301,'Eyad',200,1700);


INSERT INTO departments
(department_id, department_name, location_id)
VALUES (&department_id, '&department_name',&location);

UPDATE departments
SET location_id = 1000
WHERE department_id = 302;

delete from departments where department_id = 302;


SET VERIFY OFF --Don't display query with variable and with value after the execution
SET VERIFY ON

SET ECHO OFF
SET ECHO ON
@c:\SQL_Script\sql

