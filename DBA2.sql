SELECT e.employee_id, e.salary, j.grade_level
FROM hr.employees e, hr.job_grades j
WHERE e.salary BETWEEN j.lowest_sal AND j.highest_sal;

SELECT e.employee_id, e.salary,
(SELECT grade_level
FROM hr.job_grades
WHERE e.salary BETWEEN lowest_sal AND highest_sal) as g_level
FROM hr.employees e
ORDER BY 2;

SELECT e.employee_id, e.last_name
FROM hr.employees e, hr.departments d
WHERE e.department_id = d.department_id
ORDER BY d.department_name;

SELECT employee_id, last_name
FROM hr.employees e
ORDER BY(SELECT department_name
         FROM hr.departments
         WHERE department_id = e.department_id);
         
SELECT *
FROM hr.employees
WHERE employee_id IN( SELECT employee_id
                      FROM hr.employees
                      INTERSECT
                      SELECT employee_id
                      FROM hr.job_history );
                      
SELECT *
FROM hr.employees e
WHERE EXISTS (SELECT 'X'
                FROM hr.job_history
                WHERE employee_id = e.employee_id);
                
SELECT *
FROM hr.employees
WHERE employee_id IN( SELECT employee_id
                      FROM hr.employees
                      MINUS
                      SELECT employee_id
                      FROM hr.job_history );
                      
SELECT *
FROM hr.employees e
WHERE NOT EXISTS (SELECT 'X'
                FROM hr.job_history
                WHERE employee_id = e.employee_id);
                
SELECT *
FROM hr.departments d
WHERE NOT EXISTS ( SELECT 'X'
                    FROM hr.employees
                    WHERE department_id = d.department_id);
                    
SELECT e.employee_id, d.department_name
FROM hr.employees e, hr.departments d
WHERE e.department_id = d.department_id(+)
UNION ALL
SELECT null, department_name
FROM hr.departments d
WHERE NOT EXISTS ( SELECT 'X'
                    FROM hr.employees
                    WHERE department_id = d.department_id);
                    
SELECT e.employee_id, d.department_name
FROM hr.employees e FULL OUTER JOIN hr.departments d
ON e.department_id = d.department_id(+)
UNION ALL
SELECT null, department_name
FROM hr.departments d
WHERE not EXISTS ( SELECT 'X'
                    FROM hr.employees
                    WHERE department_id = d.department_id);
                    


SELECT department_id, job_id, manager_id, sum(salary)
FROM hr.employees
GROUP BY department_id, job_id, manager_id ;

SELECT department_id, job_id, sum(salary)
FROM hr.employees
GROUP BY department_id, job_id ;

SELECT department_id, sum(salary)
FROM hr.employees
GROUP BY department_id ;

SELECT sum(salary)
FROM hr.employees ;



SELECT department_id, job_id, manager_id, sum(salary)
FROM hr.employees
GROUP BY department_id, job_id, manager_id 
UNION ALL
SELECT department_id, job_id, null, sum(salary)
FROM hr.employees
GROUP BY department_id, job_id 
UNION ALL
SELECT department_id, null, null, sum(salary)
FROM hr.employees
GROUP BY department_id 
UNION ALL
SELECT null, null, null, sum(salary)
FROM hr.employees ;

SELECT to_char(hire_date, 'yyyy') year,
to_char(hire_date,'q') quarter,
sum(salary) sum_sal
FROM hr.employees
GROUP BY CUBE(to_char(hire_date, 'yyyy'), to_char(hire_date,'q' ));

SELECT year,
max(decode(quarter, 1, sum_sal)) Q1,
max(decode(quarter, 2, sum_sal)) Q2,
max(decode(quarter, 3, sum_sal)) Q3,
max(decode(quarter, 4, sum_sal)) Q4
FROM( SELECT to_char(hire_date, 'yyyy') year,
to_char(hire_date,'q') quarter,
sum(salary) sum_sal
FROM hr.employees
GROUP BY CUBE(to_char(hire_date, 'yyyy'), to_char(hire_date,'q')))
GROUP BY year
ORDER BY 1;
               
SELECT year,
max(decode(quarter, 1, sum_sal)) Q1,
max(decode(quarter, 2, sum_sal)) Q2,
max(decode(quarter, 3, sum_sal)) Q3,
max(decode(quarter, 4, sum_sal)) Q4,
max(decode(quarter, null, sum_sal)) гу
FROM(SELECT to_char(hire_date, 'yyyy') year,
to_char(hire_date,'q') quarter,
sum(salary) sum_sal
FROM hr.employees
GROUP BY CUBE(to_char(hire_date, 'yyyy'), to_char(hire_date,'q' )))
GROUP BY year
ORDER BY 1;

SELECT *
FROM( SELECT to_char(hire_date, 'yyyy') year,
to_char(hire_date,'q') quarter,
sum(salary) sum_sal
FROM hr.employees
GROUP BY CUBE(to_char(hire_date, 'yyyy'), to_char(hire_date,'q' )))
PIVOT(max(sum_sal) FOR quarter IN (1,2,3,4, null))
ORDER BY 1;

SELECT
*
FROM(
SELECT year, nvl(quarter,0) quarter, sum_sal
FROM( SELECT to_char(hire_date, 'yyyy') year,
to_char(hire_date,'q') quarter,
sum(salary) sum_sal
FROM hr.employees
GROUP BY CUBE(to_char(hire_date, 'yyyy'), to_char(hire_date,'q' ))))
PIVOT(max(sum_sal) FOR quarter IN (1,2,3,4,0 гу))
ORDER BY 1;
