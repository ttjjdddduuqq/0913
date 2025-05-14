SELECT
    -1000,
    1000,
    to_char(-1000, '9999mi'),
    to_char(-1000, '9999pr'),
    to_char(1000, '9999'),
    to_char(1000, 's9999')
FROM dual;

SELECT
	employee_id,
	salary,
	to_char(salary,'$999,999.99'),
    to_char(salary,'l999,999.99'),
    to_char(salary,'999,999.99'),
    to_char(salary,'000,999.99'),
    to_char(salary,'999G999D99')
FROM hr.employees;

ALTER SESSION SET nls_language = korean;
ALTER SESSION SET nls_territory = korea;
SELECT * FROM nls_session_parameters;
SELECT
    hire_date,
    to_char(hire_date, 'day month'),
    to_char(salary, 'L999G999D00')
FROM hr.employees;