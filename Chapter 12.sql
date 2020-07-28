--Chapter 12
--Managing Schema Objects

--CUSTOMER TABLE
create table customer (
customer_id integer, 
name varchar2(30), 
email varchar2(30), 
age integer, 
price number(8,2), 

constraint customer_email_uk unique(email), 
constraint customer_email_min check(price >= 0)
);

describe customer;
alter table customer modify (price Number(8,3));
alter table customer drop column price;
alter table customer add (price Number(4,1));

--alter table customer modify customer_id primary key;
alter table customer add constraint customer_customer_id_pk primary key(customer_id);
drop table customer;

--ADDRESS TABLE
create table address (
name varchar2(50) not null, 
created_date date not null, 
customer_id integer, 

constraint address_customer_id_fk foreign key(customer_id) references customer(customer_id)
);

alter table address drop constraint address_customer_id_fk;
alter table address add constraint address_customer_id_pk foreign key(customer_id) references customer(customer_id) on delete cascade;--Delete child rows when a parent key is deleted
drop table address;

--INSERT STATEMENT
insert into customer values(1,'Eyad','eyad@email',1,836.156);
insert into address values('5664545454','15-JUNE-2020',1);

select * from customer;
select * from address;

delete from customer where customer_id = 1;
