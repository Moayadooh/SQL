--Chapter 11
--Controlling User Access
/*
-Creating User & Changing User Password
-Granting System Privileges (DDL)
-Creating and Granting Privileges to a Role
-Granting Object Privileges (DML)
-Revoking Object Privileges
-Passing On Privileges
-Confirming Granted Privileges
*/

SELECT * FROM hr.employees;
SELECT * FROM hr.departments;

--Creating User
CREATE USER demo IDENTIFIED BY demo;
ALTER USER demo IDENTIFIED BY employ; --changing user password
DROP USER demo CASCADE; --drop a user whose schema contains objects

--Granting System Privileges (DDL)
GRANT CREATE SESSION, CREATE TABLE, CREATE SEQUENCE, CREATE VIEW TO demo; --session privilege allow user to connect to database
GRANT CREATE TRIGGER TO demo;
GRANT CREATE PROCEDURE TO demo;
GRANT CREATE SYNONYM TO demo;
GRANT CREATE PUBLIC SYNONYM TO demo;
GRANT CREATE USER TO demo;
GRANT DROP ANY INDEX TO demo;
GRANT CREATE ANY DIRECTORY TO demo;
GRANT SELECT, INSERT, UPDATE, DELETE ON tableName TO demo;
GRANT CONNECT, RESOURCE TO demo; --https://chartio.com/resources/tutorials/how-to-create-a-user-and-grant-permissions-in-oracle/

SELECT username, account_status FROM dba_users; --check database status
SELECT username, account_status FROM dba_users WHERE username = 'DEMO';

--Creating and Granting Privileges to a Role
CREATE ROLE manager;
DROP ROLE manager;

GRANT CREATE TABLE, CREATE view TO manager;
REVOKE CREATE TABLE, CREATE view FROM manager;

GRANT manager TO demo, testdb;
REVOKE manager FROM demo, testdb;

--Granting Object Privileges (DML) | Revoking Object Privileges
GRANT SELECT ON hr.employees TO testdb;
REVOKE SELECT ON hr.employees FROM testdb;

GRANT UPDATE (department_name, location_id) ON departments TO demo, manager; --grant privileges to update specific columns to users and roles
REVOKE UPDATE ON departments FROM demo, manager;

GRANT SELECT, INSERT ON departments TO demo WITH GRANT OPTION; --give a user authority to pass along privileges

--Passing On Privileges
GRANT SELECT ON hr.departments TO PUBLIC; --allow all users on the system to query data from departments table

--Confirming Granted Privileges
SELECT * FROM ROLE_SYS_PRIVS; --System privileges granted to roles
SELECT * FROM ROLE_TAB_PRIVS; --Table privileges granted to roles
SELECT * FROM USER_ROLE_PRIVS; --Roles accessible by the user
SELECT * FROM USER_SYS_PRIVS; --System privileges granted to the user
SELECT * FROM USER_TAB_PRIVS_MADE; --Object privileges granted on the user’s objects
SELECT * FROM USER_TAB_PRIVS_RECD; --Object privileges granted to the user
SELECT * FROM USER_COL_PRIVS_MADE; --Object privileges granted on the columns of the user’s objects
SELECT * FROM USER_COL_PRIVS_RECD; --Object privileges granted to the user on specific columns

ALTER USER demo DEFAULT TABLESPACE USERS; --changes default tablespace of the user
ALTER USER demo QUOTA UNLIMITED ON system;
ALTER USER demo QUOTA 4M ON USERS; --set 4MB of space to user
