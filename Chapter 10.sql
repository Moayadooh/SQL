--Chapter 10
--Creating Other Schema Objects
/*
-Views
-Sequences
-Triggers
-Stored Procedures
-Indexes
-Synonyms
*/

--Views
CREATE view emp_vw AS SELECT id, first_name, last_name, mobileno, salary FROM employees WHERE id IN (1,2,3);
CREATE OR REPLACE view emp_vw AS SELECT id, first_name, last_name, mobileno, salary FROM employees WHERE id IN (1,3,4);
SELECT * FROM emp_vw;

CREATE OR REPLACE view emp_vw AS SELECT id, first_name, last_name, mobileno, salary FROM employees WHERE id IN (1,3,4) WITH READ only;--prevent DML
CREATE OR REPLACE view emp_vw AS SELECT id, first_name, last_name, mobileno, salary FROM employees WHERE id IN (1,3,4) WITH CHECK OPTION CONSTRAINT emp_vw;--prevent violation during DML

DESC emp_vw;
DROP view emp_vw;
SELECT * FROM emp_vw;



--Sequences
--NOCYCLE --> will not start from the begining after reaching the max value
--NOCACHE --> Prevent values of the sequence to be preallocated https://docs.oracle.com/cd/B14117_01/server.101/b10759/statements_6014.htm

DROP SEQUENCE emp_seq;
CREATE SEQUENCE emp_seq INCREMENT BY 10 START WITH 100 MAXVALUE 10000 CACHE 20 NOCYCLE; --oracle server will prallocate 20 values in cache for faster access
CREATE SEQUENCE emp_seq INCREMENT BY 10 START WITH 100 MAXVALUE 10000 NOCACHE NOCYCLE;

--Without Trigger
INSERT INTO employees(id, first_name, last_name, mobileno, salary) VALUES (emp_seq.NEXTVAL, 'Laith', 'AL-Falahi', 12345678, 542.12);

--Move to next sequence value
SELECT emp_seq.NEXTVAL FROM dual;

--Current sequence value
SELECT emp_seq.CURRVAL FROM dual;

ALTER SEQUENCE emp_seq INCREMENT BY 50 MAXVALUE 1000000 NOCACHE NOCYCLE;



--Triggers
--Code that is automatically executed
CREATE OR REPLACE TRIGGER emp_trig 
BEFORE INSERT ON EMPLOYEES 
FOR EACH ROW
BEGIN
  SELECT emp_seq.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;

DROP TRIGGER emp_trig;

--With Trigger
INSERT INTO employees(first_name, last_name, mobileno, salary) VALUES ('Laith', 'AL-Falahi', 12345678, 542.12);



--Stored Procedures
CREATE OR REPLACE PROCEDURE sp_getEmpById 
   (EMP_ID IN NUMBER, EMP_First_Name OUT VARCHAR2, EMP_Last_Name OUT VARCHAR2, EMP_MobileNo OUT NUMBER, EMP_Salary OUT NUMBER) AS
BEGIN
   SELECT First_Name, Last_Name, MobileNo, Salary INTO EMP_First_Name, EMP_Last_Name, EMP_MobileNo, EMP_Salary
   FROM EMPLOYEES
   WHERE ID = EMP_ID;
END;

CREATE OR REPLACE PROCEDURE sp_addEmp 
   (EMP_First_Name IN VARCHAR2, EMP_Last_Name IN VARCHAR2, EMP_MobileNo IN NUMBER, EMP_Salary IN NUMBER) AS
BEGIN
   INSERT INTO EMPLOYEES (First_Name,Last_Name,MobileNo,Salary) VALUES (EMP_First_Name,EMP_Last_Name,EMP_MobileNo,EMP_Salary);
END;

CREATE OR REPLACE PROCEDURE sp_updateEmp 
   (EMP_ID IN NUMBER, EMP_First_Name IN VARCHAR2, EMP_Last_Name IN VARCHAR2, EMP_MobileNo IN NUMBER, EMP_Salary IN NUMBER) AS
BEGIN
   UPDATE EMPLOYEES SET First_Name = EMP_FIRST_NAME, Last_Name = EMP_LAST_NAME, MobileNo = EMP_MobileNo, Salary = EMP_SALARY WHERE ID = EMP_ID;
END;

CREATE OR REPLACE PROCEDURE sp_deleteEmp 
   (EMP_ID IN NUMBER) AS
BEGIN
   DELETE FROM EMPLOYEES WHERE ID = EMP_ID;
END;



--Synonyms
CREATE SYNONYM d_emp FOR emp_vw;
DROP SYNONYM d_emp;

--Public Synonym
CREATE PUBLIC SYNONYM dd_emp FOR emp_vw; --Can be accessed by any  user
DROP PUBLIC SYNONYM d_emp; --Can be dropped by administrator only

--Set privilege for user to access the synonym
GRANT SELECT ON d_emp TO hr;
REVOKE SELECT ON d_emp FROM hr;

SELECT * FROM testdb.d_emp; --Access private synonym after grant privilege
SELECT * FROM d_emp; --Access public synonym
