select *from hr.employees;

SELECT employee_id
FROM hr.employees;

SELECT * 
FROM hr.employees
WHERE employee_id = 100;

SELECT /*+ full(e) */ *
FROM hr.employees e
WHERE employee_id = 100;

SELECT 
/* 사원 정보 */
    last_name   --성
    first_name  -- 이름
    salary      --급여
FROM hr.employees;

desc hr.employees;

SELECT
	employee_id,
	salary,
	salary * 12
FROM hr.employees;

SELECT
	employee_id,
	hire_date,
	hire_date + 100,
	hire_date - 100
FROM hr.employees;

desc hr.employees

SELECT
	employee_id,
	salary,
	commission_pct,
	salary * 12 + salary * 12 * commission_pct
FROM hr.employees;

SELECT
	employee_id 사번,
	salary 급여,
	commission_pct 보너스,
	salary * 12 + salary * 12 * nvl(commission_pct, 0) as annual_salary
FROM hr.employees;


SELECT
	last_name||first_name name
FROM hr.employees;

SELECT
	last_name||' , '||first_name name
FROM hr.employees;


SELECT
	'MY name is '||last_name||' '||first_name "name"
FROM hr.employees;


SELECT
	'MY name''s  '||last_name||' '||first_name name
FROM hr.employees;

SELECT
	q'['MY name's]'||last_name||' '||first_name name
FROM hr.employees;

SELECT
    unique department_id
FROM hr.employees;

SELECT
    department_name, manager_id
FROM hr. departments;

SELECT
    last_name||' '||first_name
FROM hr.employees;

SELECT
	employee_id "Emp#",
    last_name||' '||first_name "Employee Name"
FROM hr.employees;

SELECT
     last_name||' , '||job_id "Employee and Title"
FROM hr.employees;

SELECT
    department_name||q'[ Department's manager Id:]'||manager_id "Department's Manager"
FROM hr.departments;

department_name||' Department"s Manager Id:'||manager_id " -- "

SELECT *
FROM hr.employees
WHERE last_name = 'King';

SELECT * FROM nls_session_parameters;

SELECT *
FROM hr.employees
WHERE hire_date = '01/01/13';  -- RR/MM/DD
-- WHERE hire_date = '13-JAN-01'; DD-MON-RR 미국

SELECT *
FROM hr.employees
WHERE hire_date = to_date('2001-01-13', 'YYYY-MM-DD'); 

SELECT *
FROM hr.employees
WHERE department_id = 50

SELECT *
FROM hr.employees
WHERE department_id = 50
AND salary >= 5000;

SELECT *
FROM hr.employees
WHERE department_id = 50
OR salary >= 5000;
