--Chapter 6
--Displaying Data from Multiple Tables
/*
-natural join
-using
-left outer join, right outer join, full outer join
-alies, on
-self join
*/
select * from employees;
select * from departments;

select * from employees natural join departments;
select * from employees join departments using (manager_id);

select * from employees left outer join departments using (manager_id);
select * from employees right outer join departments using (manager_id);
select * from employees full outer join departments using (manager_id);

select e.employee_id, e.last_name, e.department_id, d.department_name from employees e, departments d where e.department_id = d.department_id;
select e.employee_id, e.last_name, e.department_id, d.department_name from employees e join departments d on e.department_id = d.department_id;

select e.employee_id, e.last_name, e.manager_id, m.last_name from employees e, employees m where e.manager_id = m.employee_id;