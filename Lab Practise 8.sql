--Lab practise 8

--1.Run the statement in the lab 09 01 . sq1 script to build the MY EMPLOYEE table used in this practice.
create table MY_EMPLOYEE (ID NUMBER(4) not null, LAST_NAME VARCHAR2(25), FIRST_NAME VARCHAR2(25), USERID VARCHAR2(8), SALARY NUMBER(9,2));

--2. Describe the structure ofthe MY EMPLOYEE table to identify the column names.
DESC MY_EMPLOYEE;

/*3. Create an INSERT statement to add the first row of data to the MY_EMPLOYEE table from the following sample data.
Do not list the columns in the INSERT clause. Do not enter all rows yet.*/
--insert into MY_EMPLOYEE (ID,LAST_NAME,FIRST_NAME,USERID,SALARY) values (1,'Patel','Ralph','rpatel',895);
insert into MY_EMPLOYEE values (1,'Patel','Ralph','rpatel',895);

/*4. Populate the MY EMPLOYEE table with the second row of the sample data from the preceding list. 
This time list the columns explicitly in the INSERT clause.*/
insert into MY_EMPLOYEE values (2,'Dancs','Betty','bdancs',860);

--5. Confirm your addition to the table.
select * from MY_EMPLOYEE;

/*6. Write an INSERT statement in a dynamic reusable script file to load the remaining rows into the MY_EMPLOYEE table. 
The script should prompt for all the columns (ID, LAST NAME, FIRST NAME, USERID, and SALARY).*/
--insert into MY_EMPLOYEE (ID,LAST_NAME,FIRST_NAME,USERID,SALARY) values (&ID,'&LAST_NAME','&FIRST_NAME','&USERID',&SALARY);
insert into MY_EMPLOYEE values (&ID,'&LAST_NAME','&FIRST_NAME','&USERID',&SALARY);
insert into MY_EMPLOYEE values (3,'Biri','Ben','bbiri',1100);

/*7. Populate the table with the next two rows of the sample data listed in step 3 by running the INSERT statement in the script that you created. 
Confirm your additions to the table.*/
insert into MY_EMPLOYEE values (&ID,'&LAST_NAME','&FIRST_NAME','&USERID',&SALARY);
insert into MY_EMPLOYEE values (4,'Newman','Chad','cnewman',750);

--8. Confirm your additions to the table.
select * from MY_EMPLOYEE;

--9. Make the data additions permanent.
COMMIT;

--10. Change the last name of employee 3 to Drexler.
update MY_EMPLOYEE set LAST_NAME = 'Drexler' where ID = 3;

--11. Change the salary to 1,000 for all employees who have a salaty less than 900.
update MY_EMPLOYEE set SALARY = 1000 where SALARY < 900;

--12. Verify your changes to the table.
select * from MY_EMPLOYEE;

--13. Delete Betty Dancs from the MY_EMPLOYEE table.
delete from MY_EMPLOYEE where first_name = 'Betty' and last_name = 'Dancs';

--14. Confirm your changes to the table.
select * from MY_EMPLOYEE;

--15. Commit all pending changes.
COMMIT;

/*16. Populate the table with the last row of the sample data listed in step 3 by using the statements in the script that you created in step 6.
Run the statements in the script.*/
insert into MY_EMPLOYEE values (&ID,'&LAST_NAME','&FIRST_NAME','&USERID',&SALARY);
insert into MY_EMPLOYEE values (5,'Ropeburn','Audrey','aropebur',1550);

--17. Confirm your addition to the table.
select * from MY_EMPLOYEE;

--18. Mark an intermediate point in the processing of the transaction.
SAVEPOINT MY_EMPLOYEE;

--19. Delete all the rows from the MY_EMPLOYEE table.
--delete MY_EMPLOYEE;
delete from MY_EMPLOYEE;

--20. Confirm that the table is empty.
select * from MY_EMPLOYEE;

--21. Discard the most recent DELETE operation without discarding the earlier INSERT operation.
ROLLBACK TO MY_EMPLOYEE;

--22. Confirm that the new row is still intact.
select * from MY_EMPLOYEE;

--23. Make the data addition permanent.
COMMIT;

/*24. Create sq1 script such that the USERID is generated automatically by concatenating the first letter of the first name and 
the first seven characters of the last name. The generated JSERID must be in lowercase. 
Hence, the script should not prompt for the USERID.*/
insert into MY_EMPLOYEE values (&ID,'&&LAST_NAME','&&FIRST_NAME',lower(substr('&FIRST_NAME',1,1) || substr('&LAST_NAME',1,7)),&SALARY);

UNDEFINE LAST_NAME;
UNDEFINE FIRST_NAME;
delete from MY_EMPLOYEE where id = 6;

--26. Confirm that the new row was added with correct USERID.
select * from MY_EMPLOYEE;

