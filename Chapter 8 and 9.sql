
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

--Creating Tables
CREATE TABLE customers (
customer_id INTEGER, 
name VARCHAR2(30), 
email VARCHAR2(30), 
age INTEGER, 
price NUMBER(8,2), 

CONSTRAINT customers_customer_id_pk PRIMARY KEY(customer_id), 
CONSTRAINT customers_email_uk UNIQUE(email), 
CONSTRAINT customers_price_min CHECK(price >= 0)
);

DROP TABLE customers;
SELECT * FROM customers;

--DEFAULT Option 
CREATE TABLE address (
name VARCHAR2(50) NOT NULL, 
created_date DATE DEFAULT sysdate NOT NULL,
customer_id INTEGER, 

CONSTRAINT address_customer_id_fk FOREIGN KEY(customer_id) REFERENCES customers(customer_id)
);

DROP TABLE address;
SELECT * FROM address;

--Creating a Table Using a Subquery
CREATE TABLE dept80 AS SELECT employee_id, last_name, salary*12 ANNUAL, hire_date FROM hr.employees WHERE department_id = 80;
SELECT * FROM dept80;

--Inserting New Rows
INSERT INTO customers VALUES(1,'Eyad','eyad@email',1,836.156);

--Creating a Script
INSERT INTO customers(customer_id,name,email,age,price) VALUES(&customer_id,'&name','&email',&age,&price);

--Copying Rows from Another Table
INSERT INTO customers SELECT employee_id, last_name, email, NULL, NULL FROM hr.employees;

--Updating Rows in a Table
UPDATE customers SET price = 65.238 WHERE customer_id = 1;

--Updating Column with Subquery
UPDATE customers SET price = (SELECT price FROM customers WHERE customer_id = 1) WHERE customer_id = 4;

--Updating Rows Based on Another Table
UPDATE customers SET price = (SELECT price FROM customers WHERE customer_id = 1) WHERE customer_id = (SELECT customer_id FROM customers WHERE name = 'salim');

--DELETE Statement
DELETE FROM customers WHERE customer_id = 1;

--TRUNCATE Statement
TRUNCATE TABLE customers;--delete the rows permenantly 'No Rollback'

--Referencing Another User’s Tables
SELECT * FROM hr.employees;

--Rolling Back Changes to a Marker
SAVEPOINT frstPoint;
ROLLBACK TO frstPoint; --all save points after this savepoint will be erased

ROLLBACK; --rollback to last commit (all savepoints after commit will be erased)
COMMIT; --Committing Data
