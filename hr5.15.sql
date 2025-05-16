SELECT *
FROM hr.employees
WHERE hire_date >= to_date('2006-01-01', 'yyyy-mm-dd')
AND hire_date <= to_date('2006-12-31', 'yyyy-mm-dd')
AND mod(to_number(to_char(hire_date, 'mm')), 2) = 1;   --   = 1 대신에 <>0 사용가능

SELECT *
FROM hr.employees
WHERE hire_date >= to_date('2006-01-01', 'yyyy-mm-dd')
AND hire_date <= to_date('2006-12-31', 'yyyy-mm-dd')
AND mod(to_number(to_char(hire_date, 'mm')), 2) <> 0;

SELECT
    employee_id,
    salary,
    case 
        when salary < 5000 then 'low'
        when salary < 10000 then 'medium'
        when salary < 20000 then 'good'
        else 'excellent'
        end grade
FROM hr.employees;

SELECT keyword FROM v$reserved_words;
