SELECT 
last_name, salary
FROM hr.employees
WHERE salary >= 2500
AND salary <= 3500;


SELECT 
last_name, salary
FROM hr.employees
WHERE salary < 2500 
OR salary > 3500;

desc hr.employees

SELECT * FROM nls_session_parameters;

SELECT *
FROM hr.employees
WHERE hire_date >= '01/01/01'
AND hire_date <= '02/12/31';

SELECT 
last_name, salary
FROM hr.employees
WHERE salary BETWEEN 2500 AND 3500;

SELECT 
last_name, salary
FROM hr.employees
WHERE salary NOT BETWEEN 2500 AND 3500;

SELECT *
FROM hr.employees
WHERE hire_date BETWEEN '01/01/01'AND '02/12/31';

SELECT *
FROM hr.employees
WHERE last_name BETWEEN 'Abel' AND 'Austin';

SELECT *
FROM hr.employees
WHERE employee_id = 100
OR employee_id = 101
OR employee_id = 200;

SELECT *
FROM hr.employees
WHERE employee_id IN (100,101,200);

SELECT *
FROM hr.employees
WHERE employee_id <> 100
AND employee_id <> 101
AND employee_id <> 200;

SELECT *
FROM hr.employees
WHERE employee_id NOT IN (100,101,200);

SELECT *
FROM hr.employees
WHERE department_id = 30
OR department_id = 50 
OR department_id = 60
AND salary > 5000;

SELECT *
FROM hr.employees
WHERE department_id = 30
OR department_id = 50 
OR (department_id = 60
AND salary > 5000);


SELECT *
FROM hr.employees
WHERE (department_id = 30
OR department_id = 50 
OR department_id = 60)
AND salary > 5000;

SELECT *
FROM hr.employees
WHERE department_id IN(30,50,60)
AND salary > 5000;


SELECT * 
FROM hr.employees
WHERE commission_pct IS NULL;

employees[~employees['COMMISSION_PCT'].isnull()]

SELECT * 
FROM hr.employees
WHERE department_id IN (30,50,60)
AND salary > 500;

SELECT *
FROM hr.employees
WHERE last_name LIKE 'K%';

SELECT *
FROM hr.employees
WHERE last_name LIKE '__e%';

SELECT
    job_id
FROM hr.employees;

SELECT *
FROM hr.employees
WHERE hire_date LIKE '02%';

SELECT *
FROM hr.employees
WHERE hire_date >= to_date('01/01/01', 'rr/mm/dd')
AND hire_date <= to_date('02/12/31', 'rr/mm/dd');


SELECT *
FROM hr.employees
WHERE job_id LIKE 'SA%'
AND salary >= 10000;

SELECT *
FROM hr.employees
WHERE last_name LIKE '__a%'
OR last_name LIKE '__e%';

SELECT *
FROM hr.employees
WHERE job_id LIKE 'SA%'
AND salary >= 10000
AND hire_date >= to_date ('2005-01-01','yyyy-mm-dd')
AND hire_date <= to_date ('2005-12-31','yyyy-mm-dd');

SELECT *
FROM hr.employees
WHERE job_id LIKE 'SA%'
AND salary >= 10000
AND hire_date BETWEEN to_date('2005-01-01','yyyy-mm-dd')
AND to_date('2005-12-31','yyyy-mm-dd');


SELECT *
FROM hr.employees
WHERE (job_id = 'SA_REP'
OR job_id = 'AD_PRES')
AND salary > 10000;

SELECT *
FROM hr.employees
WHERE job_id IN ('SA_REP','AD_PRES')
AND salary > 10000;

SELECT
	employee_id,
	salary
FROM hr.employees;

SELECT
	employee_id,
	salary
FROM hr.employees
ORDER BY salary;

SELECT
	employee_id,
	salary
FROM hr.employees
ORDER BY salary desc;

SELECT
	employee_id,
	salary * 12 "aunnul_salary"
FROM hr.employees
ORDER BY "aunnul_salary" asc; 

SELECT
	employee_id,
	salary * 12 "aunnul_salary"
FROM hr.employees
ORDER BY 2  asc;    --위치 표기법

SELECT
	employee_id,
	salary,
    department_id
FROM hr.employees
ORDER BY department_id, salary desc;

SELECT 
    employee_id,
    last_name,
    hire_date
FROM hr.employees
WHERE hire_date >= to_date('2006-01-01','yyyy-mm-dd')
AND hire_date <= to_date('2006-12-31','yyyy-mm-dd')
ORDER BY last_name asc;


SELECT 
    employee_id,
    last_name,
    salary
FROM hr.employees
WHERE department_id = 80 
AND (commission_pct = 0.2
AND job_id = 'SA_MAN')
ORDER BY last_name;


SELECT
    last_name,
    salary
FROM hr.employees
WHERE salary < 5000
OR salary > 12000
ORDER BY salary desc;

desc hr.employees

SELECT
    last_name,
    salary
FROM hr.employees
WHERE salary NOT BETWEEN 5000 AND 12000
ORDER BY salary desc;

SELECT
	last_name,
	upper(last_name)
FROM hr.employees;

SELECT
	last_name,
	upper(last_name),
	lower(last_name),
	initcap(last_name)
FROM hr.employees;

SELECT *
FROM hr.employees 
WHERE lower(last_name) = 'king'

SELECT
	last_name||first_name,
	concat(last_name,first_name)
FROM hr.employees;

SELECT
	last_name||' '||first_name,
	concat(last_name||'',first_name)
FROM hr.employees;

SELECT
	last_name||first_name||job_id,
	concat(concat(last_name,first_name),job_id)
FROM hr.employees;

SELECT
	lower(last_name||first_name||job_id),
	lower(concat(concat(last_name,first_name),job_id))
FROM hr.employees;

SELECT
    concat(concat(last_name,' '),first_name)
FROM hr.employees;

SELECT
	last_name,
	length(last_name)
FROM hr.employees;

SELECT
	last_name,
	length(last_name),
	lengthb(last_name)
FROM hr.employees;

SELECT * FROM nls_session_parameters;
SELECT * FROM nls_database_parameters;

SELECT
    length('오라클'),
    lengthb('오라클')
FROM dual;   -- dummy table ( 가상테이블 )

SELECT
	last_name,
	instr(last_name,'a'),
    instr(last_name, 'a',1,1),
    instr(last_name, 'a',1,2),
    instr(last_name, 'a',3,1)
FROM hr.employees;

SELECT *
FROM hr.employees
WHERE instr(last_name,'a',3,1) = 3
OR instr(last_name,'e',3,1) = 3;

SELECT *
	last_name,
	substr(last_name,1,2,),
    substr(last_name,3),
    substr(last_name,length(last_name),1),
    substr(last_name,-1,1),
    substr(last_name,-2,-2)
FROM hr.employees;

SELECT
	last_name,
	substr(last_name,-1,2)
FROM hr.employees;

SELECT
	substr('abcde',1,2),
	substrb('abcde',1,2)
FROM DUAL;

SELECT
	substr('가나다라마',1,2),
	substrb('가나다라마',1,2),
    substrb('가나다라마',1,6)
FROM DUAL;

SELECT
    last_name,
    substr(last_name,1,2),                                 
    substr(last_name,3),                                    
    substr(last_name,length(last_name),1),           
    substr(last_name,-1,1),                          
    substr(last_name,-2,-2)
FROM hr.employees;






