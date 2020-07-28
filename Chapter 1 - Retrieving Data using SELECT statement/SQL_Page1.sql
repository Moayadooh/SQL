CREATE TABLE EMPLOYEE (Name VARCHAR2(20), E_Number INTEGER, DOB DATE, Salary DOUBLE precision, Full_Time INTEGER);
INSERT INTO EMPLOYEE (Name, E_Number, DOB, Salary, Full_Time) VALUES ('John Jones', 234621, TO_DATE('1972/07/04', 'YYYY/MM/DD'), 45444.9, 100);
INSERT INTO EMPLOYEE (Name, E_Number, DOB, Salary, Full_Time) VALUES ('Sam Smith', 374837, TO_DATE('1970/08/23', 'YYYY/MM/DD'), 44000.50, 50);

--Display employee details
SELECT * FROM EMPLOYEE;

--Display Sam Smith details
SELECT * FROM EMPLOYEE WHERE Name = 'Sam Smith';

--Display the employee details where salary > 4000
SELECT * FROM EMPLOYEE WHERE Salary > 4000;

--Display employee number, DOB, Salary, Salary+25
SELECT E_Number, DOB, Salary, Salary+25 FROM EMPLOYEE;

--Display the department table structure.
describe Departments;

/*
DDL - Data Definition Language >> create, drop....

DML - Data Manipulation Language >> select, insert, update....

distinct >> key word to avoid repatation
*/
