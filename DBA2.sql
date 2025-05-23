UPDATE hr.emp e
SET dept_name = (SELECT department_name
                FROM hr.departments
                WHERE department_id = e.dept_id);
                
                
                
                
                
SELECT *
FROM hr.emp e
WHERE EXISTS (SELECT 'x' FROM job_history
WHERE employee_id = e.id);

SELECT *
FROM hr.emp e
WHERE id IN (SELECT employee_id FROM job_history);


DELETE
FROM hr.emp e
WHERE EXISTS (SELECT 'x' FROM job_history
WHERE employee_id = e.id);


SELECT * FROM hr.emp;





CREATE TABLE hr.emp_1(id number, name varchar2(30), day date, years number, sal number)
TABLESPACE users;

CREATE TABLE hr.emp_2(id number, name varchar2(30), day date, years number, sal number)
TABLESPACE users;

INSERT ALL
WHEN year >= 15 AND sal >= 10000 THEN
INTO hr.emp_1(id,name,day,years,sal) VALUES(id,name,day,year,sal)
WHEN year >= 15 AND sal < 10000 THEN
INTO hr.emp_2(id,name,day,years,sal) VALUES(id,name,day,year,sal)
SELECT employee_id id, last_name name, hire_date day,
months_between(sysdate,hire_date) / 12 year, salary sal
FROM hr.employees;

SELECT * FROM hr.emp_1;
SELECT * FROM hr.emp_2;

SELECT * FROM hr.oltp_emp o
WHERE EXISTS (SELECT 'X' FROM hr.dw_emp
WHERE employee_id = o.employee_id);

SELECT * FROM hr.dw_emp d
WHERE EXISTS (SELECT 'X' FROM hr.oltp_emp
WHERE employee_id = d.employee_id);

UPDATE hr.dw_emp d
SET salary =(SELECT salary*1.1 FROM hr.oltp_emp
WHERE employee_id = d.employee_id);

SELECT * FROM hr.dw_emp;

DELETE FROM hr.dw_emp d
WHERE EXISTS (SELECT 'X' FROM hr.oltp_emp
WHERE employee_id = d.employee_id
AND flag = 'd');

SELECT * FROM hr.dw_emp;

SELECT * FROM hr.oltp_emp o
WHERE NOT EXISTS (SELECT 'X' FROM hr.dw_emp
WHERE employee_id = o.employee_id);

INSERT INTO hr.dw_emp(employee_id, last_name, salary, department_id)
SELECT employee_id, last_name, salary, department_id
FROM hr.oltp_emp o
WHERE NOT EXISTS (SELECT 'X' FROM hr.dw_emp
WHERE employee_id = o.employee_id);

SELECT * FROM hr.dw_emp;

UPDATE hr.emp_copy c
SET department_name = (SELECT department_name
FROM hr.departments
WHERE department_id = c.department_id);

SELECT * FROM hr.emp_copy;

MERGE INTO hr.emp_copy c
USING hr.departments d
ON (c.department_id = d.department_id)
WHEN MATCHED THEN
UPDATE SET c.department_name = d.department_name;

SELECT * FROM hr.emp_copy;




