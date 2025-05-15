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
