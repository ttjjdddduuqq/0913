SELECT
job_id,
count(*)
FROM hr.employees
WHERE hire_date >= to_date('2008-01-01', 'yyyy-mm-dd')
AND hire_date <= to_date('2009-01-01', 'yyyy-mm-dd')
GROUP BY job_id
ORDER BY 2 desc;

SELECT
to_char(hire_date, 'yyyy'),
count(*)
FROM hr.employees
GROUP BY to_char(hire_date, 'yyyy');

SELECT
count(*) as TOTAL,
count(decode(to_char(hire_date, 'yyyy'), '2001',1)) as "2001년",
count(decode(to_char(hire_date, 'yyyy'), '2002',1)) as "2002년",
count(decode(to_char(hire_date, 'yyyy'), '2003',1)) as "2003년"
FROM hr.employees;

SELECT
count(*) as TOTAL,
sum(case when to_char(hire_date,'yyyy') = '2001' then 1 end) as "2001년",
sum(case when to_char(hire_date,'yyyy') = '2002' then 1 end) as "2002년",
sum(case when to_char(hire_date,'yyyy') = '2003' then 1 end) as "2003년"
FROM hr.employees;

SELECT e.employee_id, l.city
FROM hr.employees e, hr.departments d, hr.locations l
WHERE e.department_id = d.department_id  -- 조인 조건 술어
AND d.location_id = l.location_id;   -- 조인 조건 술어

SELECT e.employee_id, c.country_name
FROM hr.employees e, hr.departments d, hr.locations l, hr.countries c
WHERE e.department_id = d.department_id
AND d.location_id = l.location_id
AND l.country_id = c.country_id;

SELECT e.last_name, e.job_id, d.department_name, l.city
FROM hr.employees e, hr.departments d, hr.locations l
WHERE e.department_id = d.department_id
AND d.location_id = l.location_id
AND e.department_id = 80; -- 비조인 조건 술어
