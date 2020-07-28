--Lab practise 6

/*4. Create a report to display employees’ last name and employee number along with their
manager’s last name and manager number. Label the columns Employee, Emp#, Manager,
and Mgr#, respectively.*/
select emp.LAST_NAME Employee, emp.EMPLOYEE_ID Emp#, man.LAST_NAME Manager, man.MANAGER_ID Mgr#
from employees emp join employees man
on emp.EMPLOYEE_ID = man.MANAGER_ID;



--DISPLAY EMPLOYEEID, LASTNAME,DEPARTMENTID AND LOCATION ID USING ON / WHERE CLAUSE WHOSE MANAGER_ID = 149
--display employee id, last name, department id, and location id using ON/WHERE clause whose manager id = 149
select e.EMPLOYEE_ID, e.LAST_NAME, d.DEPARTMENT_ID, d.LOCATION_ID
from employees e join departments d
on d.DEPARTMENT_ID = e.DEPARTMENT_ID
where e.MANAGER_ID = 149;
--Second method (without JOIN)
select e.EMPLOYEE_ID, e.LAST_NAME, e.DEPARTMENT_ID, d.LOCATION_ID
from employees e, departments d
where e.DEPARTMENT_ID = d.DEPARTMENT_ID and e.MANAGER_ID = 149;

--Self join
SELECT worker.last_name emp, manager.last_name mgr
FROM employees worker JOIN employees manager
ON (worker.manager_id = manager.employee_id);

SELECT e.last_name, e.department_id, d.department_name
FROM employees e LEFT OUTER JOIN departments d
ON (e.department_id = d.department_id) ;

SELECT e.last_name, e.department_id, d.department_name
FROM employees e RIGHT OUTER JOIN departments d
ON (e.department_id = d.department_id) ;

SELECT e.last_name, d.department_id, d.department_name
FROM employees e FULL OUTER JOIN departments d
ON (e.department_id = d.department_id) ;


