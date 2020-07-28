--Chapter 2
--Restricting and Sorting Data
/*
-operators (>, <, +, -, *, /, =)
-and, between, not, in, null
-order by (acending, decending)
-like (%, ___)
-'&name'
*/
select * from employees;

select * from employees where salary < (1000*5);

select employee_id, last_name, salary from employees where salary between 10000 and 20000;

select * from employees where commission_pct is not null order by last_name desc;

select * from employees where last_name like 'K%' or first_name like '___a';

select * from employees where salary in ('&salary1','&salary2');