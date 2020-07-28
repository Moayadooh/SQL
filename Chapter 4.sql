--Chapter 4
--Using Conversion Functions and Conditional Expressions
/*
-date fromat function
-salary format function
-concat, substr
-nvl(Replace null with value), nvl2(if not null replace with first else replace with second)
-nullif(if both are equal return null else return first value. "sort based on the second value")
-coalesce(if both are null return the value else if first not null then return first else return second)
-case expression (case, when, then, else, end)
*/
select to_char(hire_date, 'dd/MON/yyyy') from employees where employee_id = 100;
select to_char(salary, 'fm$99,999.00') from employees where employee_id = 100;

select concat(last_name,'000') from employees where employee_id = 100;
select substr(last_name,1,3) from employees where employee_id = 100;

select nvl(COMMISSION_PCT,0) from employees;
select nvl2(COMMISSION_PCT,'YES','NONE') from employees;

select nullif(length(first_name), length(last_name)) from employees;
select coalesce(COMMISSION_PCT,manager_id) from employees;
select * from employees;
select last_name, job_id, salary, 
case job_id 
when 'IT_PROG' then salary*2 
when 'ST_MAN' then salary*1.5 
else salary end from employees;