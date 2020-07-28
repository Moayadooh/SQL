--Chapter 11

--Create new user
CREATE USER demo IDENTIFIED BY demo;

--Changing the password
ALTER USER demo IDENTIFIED BY employ;

--Grant query privileges on the EMPLOYEES table: (give permission to do select statement for employees table)
GRANT select ON employees TO demo;

--Revoke the SELECT and INSERT privileges given to the demo user on the DEPARTMENTS table (Remove the privileges from demo user)
REVOKE select, insert ON departments FROM demo;

--Granting System Privileges
GRANT create session, create table,
create sequence, create view
TO demo;

--Create a role
CREATE ROLE manager;
--Grant privileges to a role
GRANT create table, create view
TO manager;
--Grant a role to users
GRANT manager TO BELL, KOCHHAR;


--Chapter 12

--add new columns to the table
ALTER TABLE dept80 ADD (job_id VARCHAR2(9));

--modify columns in the table
ALTER TABLE dept80 MODIFY (last_name VARCHAR2(30));

--remove columns from the table
ALTER TABLE dept80 DROP COLUMN job_id;

--set column name as a primary key
ALTER TABLE emp2 modify employee_id Primary Key;

--Delete child rows when a parent key is deleted
ALTER TABLE Emp2 ADD CONSTRAINT emp_dt_fk
FOREIGN KEY (Department_id)
REFERENCES departments(department_id) ON DELETE CASCADE;








