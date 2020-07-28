--Chapter 10
--Creating Other Schema Objects
/*
-View
-Sequences
-Index
-Synonym
*/

--View
create view mydata as select employee_id, last_name, salary, department_id from employees where department_id = 80;
create or replace view mydata as select * from employees where department_id = 80;


create or replace view mydata as select * from employees where department_id = 20 with check option constraint mydata;--prevent violation during DML
create or replace view mydata as select * from employees where department_id = 20 with read only;--prevent DML

insert into mydata values (1000, 'Eyad', 'AL-Falahi', 'moayadsalin97@gmail.com', '+968 96430801', '7-July-2020', 'IT_PROG', 10000, null, 100, 20);
update mydata set email = 'moayadsalim97@gmail.com' where employee_id = 1000;

insert into mydata values (1000, 'Eyad', 'AL-Falahi', 'moayadsalin97@gmail.com', '+968 96430801', '7-July-2020', 'IT_PROG', 10000, null, 100, 230);--Not allow to insert different department id
update mydata set department_id = 10 where employee_id = 1000;--Not allow to change the department id

desc mydata;
drop view mydata;
select * from mydata;


--Sequences
select * from departments;
--NOCYCLE --> will not start from the begining after reaching the max value
--NOCACHE --> 
CREATE SEQUENCE dept_deptid_seq INCREMENT BY 10 START WITH 120 MAXVALUE 10000 NOCACHE NOCYCLE;
INSERT INTO departments(department_id, department_name, location_id) VALUES (dept_deptid_seq.NEXTVAL, 'Support', 2500);
SELECT dept_deptid_seq.CURRVAL FROM dual;
ALTER SEQUENCE dept_deptid_seq INCREMENT BY 20 MAXVALUE 1000000 NOCACHE NOCYCLE;
DROP SEQUENCE dept_deptid_seq;