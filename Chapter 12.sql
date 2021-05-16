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
ALTER TABLE customers MODIFY price CHECK(price >= 0);
ALTER TABLE customers ADD CONSTRAINT customers_customer_id_pk primary key(customer_id); --alter table customer modify customer_id primary key;

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



CREATE TABLE address (
name VARCHAR2(50) NOT NULL, 
created_date DATE NOT NULL, 
customer_id INTEGER, 

CONSTRAINT address_customer_id_fk FOREIGN KEY(customer_id) REFERENCES customers(customer_id)
);
ALTER TABLE address DROP CONSTRAINT address_customer_id_fk;
ALTER TABLE address ADD CONSTRAINT address_customer_id_fk FOREIGN KEY(customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE; --Delete child rows when a parent key is deleted

DROP TABLE address;

INSERT INTO customers VALUES(1,'Eyad','eyad@email',1,836.156);
INSERT INTO address VALUES('5664545454','15-JUNE-2020',1);

SELECT * FROM customers;
SELECT * FROM address;

DELETE FROM customers WHERE customer_id = 1;
