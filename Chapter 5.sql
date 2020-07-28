--Chapter 5
--Reporting Aggregated Data Using the Group Functions
/*
-group by expression
*/
select manager_id, sum(salary) from employees where manager_id is not null group by manager_id having sum(salary) > 20000;