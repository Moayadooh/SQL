
--Display from smaller to bigger >> asc "ascending order"
--Display from bigger to smaller >> desc "descending order"

select last_name, job_id, hire_date from employees order by hire_date asc;
select last_name, job_id, hire_date from employees order by last_name desc;

select last_name, job_id, hire_date from employees where last_name = 'Matos' or last_name = 'Taylor';
select last_name, job_id, hire_date from employees where last_name in ('Matos', 'Taylor');

select last_name, job_id, hire_date from employees where last_name in ('Matos', 'Taylor') order by hire_date asc;

