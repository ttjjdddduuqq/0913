SELECT
    last_name,
    length(last_name) 
FROM hr.employees
WHERE last_name LIKE 'J%'
OR last_name LIKE 'A%'
OR last_name LIKE 'M%'
ORDER BY last_name desc;

SELECT
    last_name,
    length(last_name) 
FROM hr.employees
WHERE substr(last_name,1,1) = 'J'
OR substr(last_name,1,1) = 'A'
OR substr(last_name,1,1) = 'M'
ORDER BY last_name desc;

SELECT
    last_name,
    length(last_name) 
FROM hr.employees
WHERE substr(last_name,1,1) IN ('J','A','M')
ORDER BY last_name desc;

SELECT
    last_name,
    length(last_name) 
FROM hr.employees
WHERE instr(last_name,'J',1,1) = 1
OR  instr(last_name,'A',1,1) = 1
OR  instr(last_name,'M',1,1) = 1
ORDER BY last_name desc;

SELECT
	trim('a' from 'aabbcaa')
FROM dual;

SELECT
	ltrim('aabbcaa','a')
FROM dual;

SELECT
	rtrim('aabbcaa','a')
FROM dual;

SELECT
    hire_date,
    ltrim(hire_date, 0)   -- -> 0도 가능 '0' 도 가능(숫자 , 문자 다 가능)
FROM hr.employees;

SELECT
hire_date,
trim(leading 0 from hire_date)
FROM hr.employees;

SELECT
    '   oracle  ',
    length('   oracle  '),
    trim('   oracle  '),
    length(trim('   oracle  '))
FROM dual;

SELECT
    replace('100-001', '-', '%'),
    replace('100-001', '-', ''),
    replace('100-001', '0', '*'),
    replace(	'100	001	', ' ', '')
FROM dual;

SELECT chr(39) from dual;

SELECT 
    'It''s',
    replace('It''s', chr (39), 'i') --아스키코드 확인해보자
FROM dual;

SELECT
	salary,
	lpad(salary, 10, '*'),
	rpad(salary, 10, '*')
FROM hr.employees;

SELECT
    salary,
    lpad('*', salary/1000 , '*') 
FROM hr.employees;


SELECT
    55.926,
    round(55.926, 2),
    round(55.926, 1),
    round(55.926, 0),
    round(55.926),
    round(55.926,-1),
    round(55.926,-2)
FROM dual;

SELECT
    55.926,
    trunc(55.926, 2),
    trunc(55.926, 1),
    trunc(55.926, 0),
    trunc(55.926),
    trunc(55.926,-1),
    trunc(55.926,-2)
FROM dual;


SELECT
	round(10.1),
	ceil(10.1),
	ceil(10.0),
	ceil(10.00000001)
FROM dual;

SELECT
	trunc(10.1),
	floor(10.1),
	floor(10.0),
	floor(10.00000001)
FROM dual;

SELECT
	12/5,
	mod(12,5)
FROM dual;

SELECT
	2*2*2,
	power(2,3)
FROM dual;


SELECT
	-10,
	abs(-10)
FROM dual;

SELECT
    employee_id,
    last_name,
    salary,
    round(salary * 1.1, 1) as "New Salary" 
FROM hr.employees;

SELECT
	sysdate,
	systimestamp,
	current_date,
	current_timestamp,
	localtimestamp
FROM dual;
