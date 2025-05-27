CREATE OR REPLACE VIEW hr.dept_sum_sal_view
AS
SELECT department_name , sum(e.salary) sumsal, avg(e.salary) avgsal
FROM hr.employees e ,hr.departments d
WHERE e.department_id = d.department_id
GROUP BY department_name;

GRANT SELECT ON hr.dept_sum_sal_view TO insa;

SELECT * FROM hr.dept_sum_sal_view;

SELECT * FROM user_tab_privs WHERE grantee = 'INSA';

CREATE OR REPLACE VIEW hr.dept_sum_sal
AS
SELECT d.department_name, sumsal, avgsal
FROM (SELECT department_id, sum(salary) sumsal, avg(salary) avgsal
FROM hr.employees
GROUP BY department_id)e, hr.departments d
WHERE e.department_id = d.department_id;

GRANT SELECT ON hr.dept_sum_sal TO insa;

SELECT * FROM hr.dept_sum_sal;

SELECT * FROM user_tab_privs WHERE grantee = 'INSA';