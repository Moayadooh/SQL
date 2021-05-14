--Chapter 8 and 9
--DDL and DML

create table customer (
customer_id integer, 
name varchar2(30), 
email varchar2(30), 
age integer, 
price number(8,2), 

constraint customer_customer_id_pk primary key(customer_id), 
constraint customer_email_uk unique(email), 
constraint customer_price_min check(price >= 0)
);

drop table customer;
select * from customer;
insert into customer values(1,'Eyad','eyad@email',1,836.156);
insert into customer values(2,'Mohanned','mohanned@email',21,10.141);
update customer set price = 65.238 where customer_id = 1;
delete from customer where customer_id = 1;
truncate table customer;--delete the rows permenantly 'No Rollback'


create table address (
name varchar2(50) not null, 
created_date date not null, 
customer_id integer, 

constraint address_customer_id_fk foreign key(customer_id) references customer(customer_id)
);

drop table address;
select * from address;


savepoint frstPoint;
rollback to frstPoint; --all save points after this savepoint will be erased
rollback; --rollback to last commit (all savepoints after commit will be erased)
commit;

SET VERIFY OFF
SET VERIFY ON
--SET VERIFY
--https://www.oreilly.com/library/view/oracle-sqlplus-the/0596007469/re106.html

SET ECHO OFF
SET ECHO ON

@/home/moayad/Documents/SQL/SQL_Script/sql

/*
-VARCHAR store up to 2000 bytes of characters 
-VARCHAR2 store up to 4000 bytes of characters
 	 
-VARCHAR will occupy space for NULL values
-VARCHAR2 will not occupy any space.
 	 
-Varchar(10) - If you enter value less than 10, it utilize total 10 spaces.
-Varchar2(10) - If you enter value less than 10 then remaining space is not utilize.
http://interviewaskquestions.blogspot.com/2011/04/difference-between-varchar-and-varchar2.html


-INTEGER not accept decimal places
-NUMBER accept the specified number of places
-Decimal accept any number of decimal placess
*/