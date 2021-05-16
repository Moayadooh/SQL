--Chapter 11
--Controlling User Access

SELECT * FROM hr.employees;
SELECT * FROM hr.departments;

CREATE USER demo IDENTIFIED BY demo;
ALTER USER demo IDENTIFIED BY employ;

--Privileges
--Session privilege allow user to connect to database
GRANT CREATE SESSION, CREATE TABLE, CREATE SEQUENCE, CREATE view TO demo;


--Roles
CREATE ROLE manager;
DROP ROLE manager;


GRANT CREATE TABLE, CREATE view TO manager;
REVOKE CREATE TABLE, CREATE view FROM manager;

GRANT manager TO demo, testdb;
REVOKE manager FROM demo, testdb;

--Object Privileges
GRANT SELECT ON hr.employees TO testdb;
REVOKE SELECT ON hr.employees FROM testdb;

--Grant privileges to update specific columns to users and roles
GRANT UPDATE (department_name, location_id) ON departments TO demo, manager;
REVOKE UPDATE ON departments FROM demo, manager;

--Give a user authority to pass along privileges
GRANT SELECT, INSERT ON departments TO demo WITH GRANT OPTION;

--Allow all users on the system to query data from departments table
GRANT SELECT ON hr.departments TO PUBLIC;


--Confirming Granted Privileges
SELECT * FROM ROLE_SYS_PRIVS; --System privileges granted to roles
SELECT * FROM ROLE_TAB_PRIVS; --Table privileges granted to roles
SELECT * FROM USER_ROLE_PRIVS; --Roles accessible by the user
SELECT * FROM USER_SYS_PRIVS; --System privileges granted to the user
SELECT * FROM USER_TAB_PRIVS_MADE; --Object privileges granted on the user’s objects
SELECT * FROM USER_TAB_PRIVS_RECD; --Object privileges granted to the user
SELECT * FROM USER_COL_PRIVS_MADE; --Object privileges granted on the columns of the user’s objects
SELECT * FROM USER_COL_PRIVS_RECD; --Object privileges granted to the user on specific columns
