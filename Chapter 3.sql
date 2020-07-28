--Chapter 3
--Using Single-Row Functions to Customize Output
/*
-lower, upper, initcap, round, length, count, sum, avg, max, min
-sysdate from dual
-months_between, trunc
-lpad (right-padded), rpad (left-padded)
*/
select * from employees;

select round(avg(salary),2) from employees;

select sysdate from dual;
select sysdate-hire_date from employees where employee_id = 100; --Return number of days

select last_name, round(months_between(sysdate, hire_date)) from employees;
select last_name, trunc((sysdate-hire_date)/7) from employees;

select lpad(last_name,3) from employees;
select rpad(last_name,15, '*') from employees;
select lpad(' ', salary/1000+1, '$') from employees;-- +1 is added to include one more symbol that hidden due to the space in the beginning