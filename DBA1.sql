SELECT e.employee_id, e.salary, e.department_id, c.num_emp, e.salary/c.num_emp
FROM ( SELECT department_id, COUNT(*) num_emp
FROM hr.employees
GROUP BY department_id) c, hr.employees e
WHERE e.department_id = c.department_id
ORDER BY 1;



WITH
    CNT_DEPT AS(
                SELECT department_id, count(*) num_emp
                FROM employees
                GROUP BY department_id
                )
SELECT  e.employee_id, e.salary, e.department_id, c.num_emp, e.salary/c.num_emp
FROM hr.employees e, CNT_DEPT c
WHERE e.department_id = c.department_id
ORDER BY 1;



CREATE GLOBAL TEMPORARY TABLE cnt_dept
(department_id number, num_emp number)
ON COMMIT DELETE ROWS;

desc cnt_dept;

INSERT INTO cnt_dept
SELECT department_id, count(*) num_emp
FROM employees
GROUP BY department_id;

SELECT * FROM cnt_dept;

SELECT e.employee_id, e.salary, e.department_id, c.num_emp, e.salary/c.num_emp
FROM hr.employees e, cnt_dept c
WHERE e.department_id = c.department_id
ORDER BY 1;




SELECT d.department_name, e.employee_id, e.salary, e.department_id, sum(salary)
FROM (SELECT department_id, sum(salary)
FROM hr.employees
GROUP BY department_id) e, hr.departments d
WHERE e.department_id = d.department_id
ORDER BY 1;


SELECT e2.employee_id, e2.salary, e2.department_id, e1.sum_sal
FROM (SELECT department_id, sum(salary) sum_sal
        FROM hr.employees
        GROUP BY department_id) e1, hr.employees e2
WHERE e1.department_id = e2.department_id
ORDER BY 1;





SELECT
e.employee_id,
e.salary,
d.department_name
FROM hr.employees e, hr.departments d
WHERE e.department_id = d.department_id
AND e.salary > (SELECT avg(salary) FROM hr.employees
WHERE department_id = e.department_id);




SELECT e.employee_id, e.salary,(SELECT department_name
FROM hr.departments
WHERE department_id = e.department_id) dept_name
FROM employees e
WHERE e.salary > (SELECT avg(salary)
FROM employees
WHERE department_id = e.department_id);



SELECT e2.employee_id, e2.salary, d.department_name
FROM (SELECT department_id, avg(salary) avg_sal
FROM hr.employees
GROUP BY department_id) e1, hr.employees e2, hr.departments d
WHERE e1.department_id = d.department_id
AND e2.department_id = d.department_id
AND e2.salary > e1.avg_sal;






WITH
    emp AS (SELECT employee_id, salary, department_id
            FROM hr.employees),
    dept_avg AS (SELECT department_id, avg(salary) avg_sal
                FROM emp
                GROUP BY department_id)
    SELECT e1.employee_id, e1.salary, d.department_name
    FROM emp e1, dept_avg e2, hr.departments d
    WHERE e1.department_id = e2.department_id
    AND e1.salary > e2.avg_sal
    AND e1.department_id = d.department_id;

SELECT
    employee_id, salary, (SELECT department_name
                            FROM hr.departments
                            WHERE department_id = e.department_id) dept_name
FROM(
SELECT 
        employee_id, 
        salary, 
        department_id, 
        avg(salary) over(partition by department_id) avg_sal,
        case when salary > avg(salary) over(partition by department_id) then 1 end case_sal
FROM hr.employees) e
WHERE case_sal = 1;

SELECT
    *
FROM(
        SELECT 
            employee_id,
            salary,
            department_id,
            dense_rank() over(partition by department_id order by salary desc) 순위 --rank
        FROM hr.employees)
WHERE "순위" <= to_char(2);
--WHERE rank <= 2;

        







