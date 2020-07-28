--Lab practise 6

/*8. The HR department wants to determine the names of all the employees who were hired after
Davies. Create a query to display the name and hire date of any employee hired after employee
Davies.*/
select * from employees where last_name = 'Davies';
select e.LAST_NAME, e.HIRE_DATE from employees e join employees d on d.last_name = 'Davies' where e.HIRE_DATE > d.HIRE_DATE;

/*9. The HR department needs to find the names and hire dates of all the employees who were hired
before their managers, along with their managers’ names and hire dates.*/
select e.last_name, e.hire_date, m.last_name, m.hire_date
from employees e join employees m
on e.manager_id = m.employee_id
where e.hire_date < m.hire_date;

