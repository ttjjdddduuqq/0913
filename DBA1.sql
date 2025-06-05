DECLARE
    v_name employees.last_name%TYPE;
    v_sal employees.salary%TYPE;
    v_date employees.hire_date%TYPE;
BEGIN
    SELECT last_name, salary, hire_date
    INTO v_name, v_sal, v_date 
    FROM hr.employees
    WHERE employee_id = :b_id;
    DBMS_OUTPUT.PUT_LINE('이름 : '||upper(v_name));
    DBMS_OUTPUT.PUT_LINE('급여 : '||to_char(v_sal, 'fmL999,999.00'));
    DBMS_OUTPUT.PUT_LINE('입사일 : '||to_char(v_date,'yyyy"년"fmmm"월"dd"일"'));
END;
/

DECLARE
    v_day employees.hire_date%type;
    v_sal_before employees.salary%type;
    v_sal_after employees.salary%type;
    v_years number;
BEGIN
    SELECT hire_date, salary
    INTO v_day, v_sal_before
    FROM hr.employees
    WHERE employee_id = :b_id;
    
    v_years := trunc(months_between(sysdate,v_day) / 12);
    dbms_output.put_line(:b_id||'사원의 입사일은 '||v_day||' 근속연수는 '||v_years||'년 입니다');
    
    IF v_years >= 20 THEN
        UPDATE hr.employees
        SET salary = salary*1.1
        WHERE employee_id = :b_id;
        
        SELECT salary
        INTO v_sal_after
        FROM hr.employees
        WHERE employee_id = :b_id;
        dbms_output.put_line(:b_id||'사원의 이전 급여는 '||v_sal_before||', 수정된 급연는 '||v_sal_after);
    ELSE
         dbms_output.put_line(:b_id||'사원의 급여는 수정할 수 없습니다');
    END IF;

    ROLLBACK;
END;
/