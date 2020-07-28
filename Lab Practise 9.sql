--Lab practise 9

/*1. Create the DEPT table based on the following table instance chart. 
Execute the statement in the script to create the table.*/
create table DEPT (ID NUMBER(7) primary key, Name VARCHAR2(25));

--2. Populate the DEPT table with data from the DEPARTMENTS table. Include only columns that you need.
insert into DEPT select DEPARTMENT_ID, DEPARTMENT_NAME from departments;

/*3. Create the EMP table based on the following table instance chart. 
Execute the statement in the script to create the table. Confirm that the table is created.*/
create table EMP (ID NUMBER(7), last_name VARCHAR2(25), first_name VARCHAR2(25), DEPT_ID NUMBER(7) references DEPT(ID));
desc EMP;

/*4. Create the EMPLOYEES2 table based on the structure of the EMPLOYEES table. Include only the EMPLOYEE_ID, FIRST_NAME, 
LAST_NAME, SALARY, and DEPARTMENT_ID columns. Name the columns in your new table ID, FIRST NAME, LAST NAME, SALARY, and DEPT ID, respectively.*/
create table EMPLOYEES2 as select EMPLOYEE_ID ID, FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID dept_id from employees;

--5. Alter the EMPLOYEES2 table status to read-only.
ALTER TABLE employees2 READ ONLY;

--6. Try to insert data in the EMPLOYEES 2 table.
insert into employees2 values(1,'dvdz', 'ac', 456, 5);

--7. Revert the EMPLOYEES 2 table to the read/write status. Now, try to insert data again.
ALTER TABLE employees2 READ WRITE;

--8. Drop the EMPLOYEES2 table.
drop table EMPLOYEES2;

