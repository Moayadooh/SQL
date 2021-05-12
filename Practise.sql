select * from employees;

select * from departments;

--Group By
select department_id, sum(salary) from employees group by department_id having sum(salary) > 100000;

--Natural Join
select * from employees natural join departments;

--Using
select * from employees join departments using (manager_id,department_id);

--Inner Join
select e.MANAGER_ID, e.DEPARTMENT_ID, e.EMPLOYEE_ID, e.FIRST_NAME, e.LAST_NAME, e.EMAIL, d.DEPARTMENT_NAME, d.LOCATION_ID from employees e join departments d on e.manager_id = d.manager_id and e.department_id = d.department_id;

--Self Join
select e.employee_id, e.last_name, e.manager_id, m.last_name from employees e join employees m on e.manager_id = m.employee_id;