--Chapter 8 page 29 and 46 (Describtion)

select * from MY_EMPLOYEE;
delete from MY_EMPLOYEE where ID = 1;
ROLLBACK;
COMMIT; --what ever you have done will be saved permenantly

TRUNCATE TABLE MY_EMPLOYEE; --delete the rows permenantly 'No Rollback'

--Delete employee  details, if the department name is IT
delete from employees where department_id = (select department_id from departments where department_name = 'IT');

--Check ==> e.g. check the limitation of number of marks (must not be more than 100 and less than 0)
--VARCHAR2 vs CHAR ==> e.g. if var size 10 and char size 10 in char will be fixed but in var is based on the data
--NUMBER(p,s) ==> e.g. NUMBER(10,2) ten number and two decimal places
--Unique ==> must not be repatd
--other name for foreign key is refrencial key
--structured dataebase (Oracle, MySql)
--unstructured database (Firebase)

/*Create a STAFF table with the following details. Use appropriate CONSTARINTS

Staffid

Staffname(cannot null)

Contactno(can not null)

Email(CAN NOT REPEAT, BUT CAN BE ACCEPTED NULL VALUES)

Studentid(foreignkey)

Salary(check constraints)*/
create table STAFF 
(staffId Number(6), 
staffName varchar2(30) not null, 
contactNo varchar2(20) not null, 
email varchar2(40), 
studentid Number(6), 
salary Number(20,4), 
CONSTRAINT staff_staffId_pk primary key(staffId), 
CONSTRAINT staff_email_uk UNIQUE(email), 
CONSTRAINT staff_studentid_fk FOREIGN KEY (studentid) REFERENCES students(studentid), 
CONSTRAINT staff_salary_min CHECK (salary > 0));

