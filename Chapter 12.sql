--Chapter 12
--Managing Schema Objects

CREATE TABLE customers (
customer_id INTEGER, 
name VARCHAR2(30), 
email VARCHAR2(30), 
age INTEGER, 
price NUMBER(8,2), 

CONSTRAINT customers_email_uk UNIQUE(email), 
CONSTRAINT customers_price_min CHECK(price > 0)
);
ALTER TABLE customers ADD CONSTRAINT customers_customer_id_pk primary key(customer_id); --alter table customer modify customer_id primary key;
ALTER TABLE customers DROP CONSTRAINT customers_customer_id_pk;
ALTER TABLE customers MODIFY price CHECK(price >= 0);

INSERT INTO customers SELECT employee_id, last_name, email, NULL, NULL FROM hr.employees; --insert data from other table

SELECT * FROM hr.employees;
SELECT * FROM customers;
SELECT * FROM address;

--Read & Write actions
ALTER TABLE customers READ ONLY;
ALTER TABLE customers READ WRITE;

--Manipulate table column
ALTER TABLE customers MODIFY (price NUMBER(8,3));
ALTER TABLE customers DROP COLUMN price;
ALTER TABLE customers ADD (price NUMBER(4,1));

--marks one or more columns as unused so that they can be dropped when the demand on system resources is lower
ALTER TABLE customers SET UNUSED COLUMN email;
ALTER TABLE customers DROP UNUSED COLUMNS;
SELECT * FROM USER_UNUSED_COL_TABS;

DROP TABLE customers;
DROP TABLE customers PURGE;
DROP TABLE customers CASCADE CONSTRAINTS; --Delete table if there are other tables refer to this table PK
ALTER TABLE customers DROP COLUMN customer_id CASCADE CONSTRAINTS;



CREATE TABLE address (
name VARCHAR2(50) NOT NULL, 
created_date DATE NOT NULL, 
customer_id INTEGER, 

CONSTRAINT address_customer_id_fk FOREIGN KEY(customer_id) REFERENCES customers(customer_id)
);
ALTER TABLE address ADD CONSTRAINT address_customer_id_fk FOREIGN KEY(customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE; --Delete child rows when a parent key is deleted
ALTER TABLE customers DROP PRIMARY KEY CASCADE; --Remove ON DELETE CASCADE in address table FK
ALTER TABLE address DROP CONSTRAINT address_customer_id_fk;
ALTER TABLE address DISABLE CONSTRAINT address_customer_id_fk;
ALTER TABLE address ENABLE CONSTRAINT address_customer_id_fk;

DROP TABLE address;

INSERT INTO customers VALUES(1,'Eyad','eyad@email',1,836.156);
INSERT INTO address VALUES('5664545454','15-JUNE-2020',1);

SELECT * FROM customers;
SELECT * FROM address;

DELETE FROM customers WHERE customer_id = 1;



ALTER TABLE customers ADD CONSTRAINT customers_customer_id_pk primary key(customer_id) DEFERRABLE INITIALLY DEFERRED; --validate constraints after commit transaction (rollback if constraint violated)
SET CONSTRAINTS customers_customer_id_pk IMMEDIATE; --validate constraints after end of statement 
ALTER SESSION SET CONSTRAINTS = IMMEDIATE; --changing all constraints for a session

INSERT INTO customers VALUES(1,'Eyad','eyad@email',1,836.156);
COMMIT;



ALTER TABLE address RENAME COLUMN name TO address_name;
ALTER TABLE address RENAME CONSTRAINT new_address_customer_id_fk TO address_customer_id_fk;

--Indexes
CREATE TABLE EMP_UNNAMED_INDEX
(employee_id NUMBER(6) PRIMARY KEY,
first_name VARCHAR2(20),
last_name VARCHAR2(25));
SELECT INDEX_NAME, TABLE_NAME FROM USER_INDEXES WHERE TABLE_NAME = 'EMP_UNNAMED_INDEX';

CREATE TABLE NEW_EMP
(employee_id NUMBER(6) PRIMARY KEY USING INDEX (CREATE INDEX emp_id_idx ON NEW_EMP(employee_id)),
first_name VARCHAR2(20),
last_name VARCHAR2(25));
SELECT INDEX_NAME, TABLE_NAME FROM USER_INDEXES WHERE TABLE_NAME = 'NEW_EMP';

--Step 1: Create the table:
CREATE TABLE NEW_EMP2
(employee_id NUMBER(6),
first_name VARCHAR2(20),
last_name VARCHAR2(25));

--Step 2: Create the index:
CREATE INDEX emp_id_idx2 ON new_emp2(employee_id);

--Step 3: Create the primary key:
ALTER TABLE new_emp2 ADD PRIMARY KEY (employee_id) USING INDEX emp_id_idx2;

SELECT INDEX_NAME, TABLE_NAME FROM USER_INDEXES WHERE TABLE_NAME = 'NEW_EMP2';

--Function-Based Indexes
INSERT INTO NEW_EMP2 VALUES(1,'Eyad','AL-Falahi');
SELECT * FROM NEW_EMP2 WHERE UPPER(last_name) = 'AL-FALAHI';
CREATE INDEX upper_emp_last_name_idx ON NEW_EMP2(UPPER(last_name));
DROP INDEX upper_emp_last_name_idx;

INSERT INTO NEW_EMP2 VALUES(2,'Eyad','AL-Falahii');
SELECT * FROM NEW_EMP2 WHERE LOWER(last_name) = 'al-falahii';
CREATE INDEX lower_emp_last_name_idx ON NEW_EMP2(LOWER(last_name));
DROP INDEX lower_emp_last_name_idx;

--Performing Flashback Operations
SELECT * FROM NEW_EMP2;
DROP TABLE NEW_EMP2;
SELECT original_name, operation, droptime FROM recyclebin;
FLASHBACK TABLE NEW_EMP2 TO BEFORE DROP;
PURGE RECYCLEBIN;

--Creating and using external tables

