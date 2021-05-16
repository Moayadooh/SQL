--Chapter 8 and 9
--DDL and DML

CREATE TABLE customer (
customer_id INTEGER, 
name VARCHAR2(30), 
email VARCHAR2(30), 
age INTEGER, 
price NUMBER(8,2), 

CONSTRAINT customer_customer_id_pk PRIMARY KEY(customer_id), 
CONSTRAINT customer_email_uk UNIQUE(email), 
CONSTRAINT customer_price_min CHECK(price >= 0)
);

DROP TABLE customer;
SELECT * FROM customer;
INSERT INTO customer VALUES(1,'Eyad','eyad@email',1,836.156);
INSERT INTO customer VALUES(2,'Mohanned','mohanned@email',21,10.141);
UPDATE customer SET price = 65.238 WHERE customer_id = 1;

DELETE FROM customer WHERE customer_id = 1;
TRUNCATE TABLE customer;--delete the rows permenantly 'No Rollback'


CREATE TABLE address (
name VARCHAR2(50) NOT NULL, 
created_date DATE NOT NULL, 
customer_id INTEGER, 

CONSTRAINT address_customer_id_fk FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);

DROP TABLE address;
SELECT * FROM address;


SAVEPOINT frstPoint;
ROLLBACK TO frstPoint; --all save points after this savepoint will be erased
ROLLBACK; --rollback to last commit (all savepoints after commit will be erased)
COMMIT;

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
-VARCHAR2(10) - If you enter value less than 10 then remaining space is not utilize.
http://interviewaskquestions.blogspot.com/2011/04/difference-between-varchar-and-VARCHAR2.html


-INTEGER not accept decimal places
-NUMBER accept the specified number of places
-Decimal accept any number of decimal placess
*/