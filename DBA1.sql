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