--Chapter 10
--Creating Other Schema Objects
/*
-View
-Sequences
-Index
-Synonym
*/

--View
create view vw_emp as select id, first_name, last_name, mobileno, salary from employees where id in (1,2,3);
create or replace view vw_emp as select id, first_name, last_name, mobileno, salary from employees where id in (1,3,4);
select * from vw_emp;

create or replace view vw_emp as select id, first_name, last_name, mobileno, salary from employees where id in (1,3,4) with read only;--prevent DML
create or replace view vw_emp as select id, first_name, last_name, mobileno, salary from employees where id in (1,3,4) with check option constraint vw_emp;--prevent violation during DML

desc vw_emp;
drop view vw_emp;
select * from vw_emp;



--Sequences
select * from employees;
--NOCYCLE --> will not start from the begining after reaching the max value
--NOCACHE --> 

DROP SEQUENCE emp_seq;
CREATE SEQUENCE emp_seq INCREMENT BY 10 START WITH 100 MAXVALUE 10000 NOCACHE NOCYCLE;

--Without Trigger
INSERT INTO employees(id, first_name, last_name, mobileno, salary) VALUES (emp_seq.NEXTVAL, 'Laith', 'AL-Falahi', 12345678, 542.12);

--With Trigger
INSERT INTO employees(first_name, last_name, mobileno, salary) VALUES ('Laith', 'AL-Falahi', 12345678, 542.12);

--Last inserted id
SELECT emp_seq.CURRVAL FROM dual;

ALTER SEQUENCE emp_seq INCREMENT BY 50 MAXVALUE 1000000 NOCACHE NOCYCLE;



--Trigger
DROP TRIGGER emp_bir;
CREATE OR REPLACE TRIGGER emp_bir 
BEFORE INSERT ON EMPLOYEES 
FOR EACH ROW
BEGIN
  SELECT emp_seq.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;
  
SELECT emp_seq.NEXTVAL FROM dual;
