--Chapter 11
--Controlling User Access

select * from customer;
insert into customer select employee_id, last_name, email from employees;
desc employees;

alter table customer read only;
delete from customer;
truncate table customer;
alter table customer read write;

create user c##md identified by md;
grant connect, resource to c##md;
--ALTER USER c##md DEFAULT TABLESPACE USERS;--changes default tablespace of the user
ALTER USER c##md QUOTA 4M ON USERS;--assigns 4MB of space to the user
--unlimited 

drop user c##md;
drop user c##md CASCADE;--drop a user whose schema contains objects

SELECT * FROM USER_SYS_PRIVS;
SELECT * FROM DBA_ROLE_PRIVS;
SELECT * FROM DBA_TAB_PRIVS;

GRANT select ON hr.employees TO c##md;
GRANT SELECT ANY TABLE TO c##md;
REVOKE select ON employees from c##md;

select * from hr.employees;