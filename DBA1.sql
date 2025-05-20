SELECT
e.employee_id, e.last_name, e.job_id
FROM
hr.employees e, hr.departments d
WHERE
e.department_id = d.department_id
AND department_name = 'Executive';

SELECT
e.employee_id, e.last_name, e.job_id
FROM
hr.employees e join hr.departments d
ON
e.department_id = d.department_id
WHERE department_name = 'Executive';

SELECT
employee_id, last_name, job_id
FROM hr.employees
WHERE department_id = (SELECT department_id FROM hr.departments
WHERE department_name = 'Executive');

SELECT
*
FROM hr.departments
WHERE department_id IN (SELECT department_id FROM hr.employees);

SELECT
*
FROM hr.departments d
WHERE EXISTS (SELECT 'x' FROM hr.employees
WHERE department_id = d.department_id);

SELECT
*
FROM hr.departments
WHERE department_id NOT IN (SELECT department_id FROM hr.employees
WHERE department_id IS NOT NULL);


SELECT
*
FROM hr.departments d
WHERE NOT EXISTS (SELECT 'X' FROM hr.employees
WHERE department_id = d.department_id);

SELECT to_char(hire_date, 'yyyy'), count(*)
FROM hr.employees
GROUP BY to_char(hire_date, 'yyyy');

SELECT
*
FROM(SELECT to_char(hire_date, 'yyyy') as year
FROM hr.employees)
PIVOT(count(*) FOR year
IN ('2001' "2001",2002,2003,2004,2005,2006,2007,2008));

SELECT
*
FROM(SELECT to_char(hire_date, 'yyyy')as year, count(*) as cnt
FROM hr.employees
GROUP BY to_char(hire_date, 'yyyy'))
PIVOT(max(cnt)FOR year
IN ('2001' "2001",2002,2003,2004,2005,2006,2007,2008));

SELECT *
FROM(SELECT to_char(hire_date, 'yyyy') year, count(*) cnt
FROM hr.employees
GROUP BY to_char(hire_date, 'yyyy'))
PIVOT(max(cnt) FOR year
IN (2001,2002,2003,2004,2005,2006,2007,2008)),
(SELECT count(*) 총인원수 FROM hr.employees),
(SELECT to_char(sum(salary),'999,999,00') 총급여 FROM hr.employees);

SELECT *
FROM(SELECT to_char(hire_date, 'dy') as day
FROM hr.employees)
PIVOT(count(*) FOR day IN ('월' "월",'화' "화",'수' "수",'목' "목",'금' "금",'토' "토",'일' "일"));

SELECT *
FROM(SELECT to_char(hire_date, 'dy') as day, count(*) as cnt
FROM hr.employees
GROUP BY to_char(hire_date,'dy'))
PIVOT(
max(cnt) FOR day IN ('월' "월",'화' "화",'수' "수",'목' "목",'금' "금",'토' "토",'일' "일"));

SELECT to_char(hire_date, 'yyyy') as 년도
FROM hr.employees
GROUP BY to_char(hire_date, 'yyyy')
ORDER BY 1;

SELECT to_char(hire_date, 'yyyy') as 년도,
sum(decode(to_char(hire_date,'q'),1,salary)) as "1분기"
FROM hr.employees
GROUP BY to_char(hire_date, 'yyyy')
ORDER BY 1;

SELECT to_char(hire_date, 'yyyy') as 년도,
sum(decode(to_char(hire_date,'q'),1,salary)) as "1분기",
sum(decode(to_char(hire_date,'q'),2,salary)) as "2분기",
sum(decode(to_char(hire_date,'q'),3,salary)) as "3분기",
sum(decode(to_char(hire_date,'q'),4,salary)) as "4분기"
FROM hr.employees
GROUP BY to_char(hire_date, 'yyyy')
ORDER BY 1;

SELECT *
FROM (
SELECT to_char(hire_date, 'yyyy') as 년도, to_char(hire_date,'q') as 분기, salary
FROM hr.employees)
PIVOT(sum(salary) FOR 분기 IN(1 "1분기",2 "2분기",3 "3분기",4 "4분기"))
ORDER BY 1;

SELECT *
FROM hr.employees
WHERE (department_id, salary) IN (SELECT department_id, salary
FROM hr.employees
WHERE commission_pct IS NOT NULL);

SELECT *
FROM hr.employees
WHERE department_id IN (SELECT department_id
FROM hr.employees
WHERE commission_pct IS NOT NULL)
AND salary IN (SELECT salary
FROM hr.employees
WHERE commission_pct IS NOT NULL);

SELECT *
FROM hr.employees
WHERE (salary, nvl(commission_pct,0)) IN (SELECT e.salary, nvl(e.commission_pct,0)
FROM hr.employees e, hr.departments d
WHERE e.department_id = d.department_id
AND d.location_id = 1700);

SELECT *
FROM hr.employees
WHERE salary IN (SELECT e.salary
                FROM hr.employees e, hr.departments d
                WHERE e.department_id = d.department_id
                AND d.location_id = 1700)
AND nvl(commission_pct,0) IN (SELECT nvl(e.commission_pct,0)
                                FROM hr.employees e, hr.departments d
                                WHERE e.department_id = d.department_id
                                AND d.location_id = 1700);


SELECT d.department_name, sum(e.salary), avg(salary)
FROM hr.employees e, hr.departments d
WHERE e.department_id = d.department_id
GROUP BY d.department_name;

SELECT d.department_name, sum_sal, avg_sal
FROM(SELECT department_id, sum(salary) as sum_sal, avg(salary) as avg_sal
FROM hr.employees
GROUP BY department_id) e, hr.departments d
WHERE e.department_id = d.department_id;

SELECT d.department_name, sum_sal, avg_sal
FROM(SELECT department_id, sum(salary) as sum_sal, avg(salary) as avg_sal
FROM hr.employees
GROUP BY department_id)e LEFT OUTER JOIN hr.departments d
ON e.department_id = d.department_id;

SELECT *
FROM(
SELECT department_name, (SELECT sum(salary)
FROM hr.employees
WHERE department_id = d.department_id) as sum_sal,
(SELECT avg(salary)
FROM hr.employees
WHERE department_id = d.department_id) as avg_sal
FROM hr.departments d)
WHERE sum_sal IS NOT NULL;

SELECT department_name, (SELECT sum(salary) ||' '||avg(salary)
FROM hr.employees
WHERE department_id = d.department_id) sum_avg_sal
FROM hr.departments d;





























