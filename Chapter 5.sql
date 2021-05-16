--Chapter 5
--Reporting Aggregated Data Using the Group Functions
/*
-group by expression
*/
SELECT manager_id, sum(salary) FROM employees WHERE manager_id IS NOT NULL GROUP BY manager_id HAVING sum(salary) > 20000;