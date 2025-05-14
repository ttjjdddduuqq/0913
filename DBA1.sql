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
    ltrim(hire_date, 0)  --  -> 0도 가능 '0' 도 가능(숫자 , 문자 다 가능)
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

ALTER SESSION SET TIME_ZONE = '+08:00';   

SELECT
	sysdate,
	systimestamp,
	current_date,
	current_timestamp,
	localtimestamp
FROM dual;

SELECT
	sysdate + 100,
	systimestamp - 100
FROM dual;


ALTER SESSION SET TIME_ZONE = '+09:00';   


SELECT
	systimestamp,
	to_char(systimestamp + 10/24, 'yyyy-mm-dd hh24:mi:ss'),
	to_char(localtimestamp + 10/24, 'yyyy-mm-dd hh24:mi:ss'),
	to_char(current_timestamp + 10/24, 'yyyy-mm-dd hh24:mi:ss')
FROM dual;

SELECT
	systimestamp,
	to_char(systimestamp + 10/24, 'yyyy-mm-dd hh24:mi:ss'),                  --10/24  -> 10시 24분
	to_char(localtimestamp + 10/(24*60), 'yyyy-mm-dd hh24:mi:ss'),         -- 10/(24*60) -> 분
	to_char(current_timestamp + 10/(24*60*60), 'yyyy-mm-dd hh24:mi:ss') --10/(24*60*60) -> 초
FROM dual;

SELECT
	employee_id,
	hire_date,
	sysdate - hire_date
FROM hr.employees;

SELECT
	employee_id,
	hire_date,
	trunc(sysdate - hire_date)
FROM hr.employees;

SELECT
	employee_id,
	hire_date,
	trunc(sysdate - hire_date) as 근무일수,
    months_between(sysdate,hire_date) as 근무달수
FROM hr.employees;

SELECT
	sysdate,
	add_months(sysdate,5),
	add_months(sysdate,-5)
FROM dual;

SELECT
	sysdate,
	next_day(sysdate, '금요일')
FROM dual;

SELECT * FROM nls_session_parameters;

SELECT
	last_day(sysdate)
FROM dual;

SELECT 
    employee_id,
    hire_date,
    months_between(sysdate,hire_date)
FROM hr.employees
WHERE months_between(sysdate,hire_date) >= 240;

SELECT
    last_name,
    hire_date,
    next_day(add_months(hire_date,6),'월요일') as REVIEW
FROM hr.employees;

SELECT
    to_char(sysdate + 3/24, 'yyyy-mm-dd hh24:mi:ss.sssss'),
    to_char(sysdate, ' yyyy year yyyy"년" '),
    to_char(sysdate, ' mm mon month '),
    to_char(sysdate, ' d dd ddd daydy '),
    to_char(sysdate +3/24, 'hh hh12 hh24 am pm' )
FROM dual;

SELECT
    to_char(sysdate, 'ww w'),
    to_char(sysdate, 'q"분기"'),
    to_char(sysdate, 'dd ddth ddsp ddthsp')
FROM dual;

SELECT
    employee_id,
    hire_date,
    to_char(hire_date, ' day ')
FROM hr.employees
ORDER BY to_char(hire_date, ' d ');

SELECT
    employee_id,
    hire_date,
    to_char(hire_date, ' day ')
FROM hr.employees
ORDER BY to_char(hire_date-1, ' d ');

SELECT
	employee_id,
	salary,
	to_char(salary,'$999,999.99'),
    to_char(salary,'l999,999.99'),
    to_char(salary,'999,999.99'),
    to_char(salary,'000,999.99'),
    to_char(salary,'999G999D99')
FROM hr.employees;

SELECT
    -1000,
    1000,
    to_char(-1000, '9999mi'),
    to_char(-1000, '9999pr'),
    to_char(1000, '9999'),
    to_char(1000, 's9999')
FROM dual;


ALTER SESSION SET nls_language = korean;
ALTER SESSION SET nls_territory = korea;
SELECT * FROM nls_session_parameters;
SELECT
    hire_date,
    to_char(hire_date, 'day month'),
    to_char(salary, 'L999G999D00')
FROM hr.employees;

ALTER SESSION SET nls_language = japanese;
ALTER SESSION SET nls_territory = japan;
SELECT * FROM nls_session_parameters;
SELECT
    hire_date,
    to_char(hire_date, 'day month'),
    to_char(salary, 'L999G999D00')
FROM hr.employees;

ALTER SESSION SET nls_language = 'simplified chinese';
ALTER SESSION SET nls_territory = china;
SELECT * FROM nls_session_parameters;
SELECT
    hire_date,
    to_char(hire_date, 'day month'),
    to_char(salary, 'L999G999D00')
FROM hr.employees;


