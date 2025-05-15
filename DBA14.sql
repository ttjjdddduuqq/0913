SELECT
last_name,
length(last_name) 
FROM hr.employees
WHERE last_name LIKE 'J%'
OR last_name LIKE 'A%'
OR last_name LIKE 'M%'
ORDER BY last_name desc;

SELECT
    salary,
    lpad('*', salary/1000 , '*') 
FROM hr.employees;

SELECT
    employee_id,
    last_name,
    salary,
    round(salary * 1.1, 1) as "New Salary" 
FROM hr.employees;

SELECT 
    employee_id,
    hire_date,
    months_between(sysdate,hire_date)
FROM hr.employees
WHERE months_between(sysdate,hire_date) >= 240;

SELECT
    last_name,
    hire_date,
    next_day(add_months(hire_date,6),'¿ù¿äÀÏ') as REVIEW
FROM hr.employees;

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










