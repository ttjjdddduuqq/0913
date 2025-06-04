DECLARE
    v_cnt number := 1;
BEGIN
    LOOP
        IF v_cnt = 4 OR v_cnt = 8 THEN
            NULL;
        ELSE
            dbms_output.put_line(v_cnt);
        END IF;
        v_cnt := v_cnt + 1;
        IF v_cnt > 10 then
            EXIT;
        END IF;
    END LOOP;
END;
/

DECLARE
    v_cnt number := 1;
BEGIN
    LOOP
        IF v_cnt <> 4 AND v_cnt <> 8 THEN
            dbms_output.put_line(v_cnt);
        END IF;
        v_cnt := v_cnt + 1;
        IF v_cnt > 10 then
            EXIT;
        END IF;
    END LOOP;
END;
/

DECLARE
    v_cnt number := 0;
BEGIN
    LOOP
        v_cnt := v_cnt + 1;
        CONTINUE WHEN mod(v_cnt,2) = 0;
        dbms_output.put_line(v_cnt);
        EXIT WHEN v_cnt = 9;
    END LOOP;
END;
/

DECLARE
    i number := 1;
BEGIN
    LOOP
        dbms_output.put_line('2 * '||i||' = '||2*i);
        i := i + 1;
        EXIT WHEN i = 10;
    END LOOP;
END;
/

DECLARE
    i number := 0;
BEGIN
    LOOP
        IF mod(i,2) <> 0 THEN
            dbms_output.put_line(i);
        END IF;
        i := i + 1;
        EXIT WHEN i > 10;
    END LOOP;
END;
/

DECLARE
    i number := 1;
BEGIN
    LOOP
        dbms_output.put_line(i);
        i := i + 2;
        EXIT WHEN i > 10;
    END LOOP;
END;
/


DECLARE
    dan number := 2;
    i number;
BEGIN
    LOOP
        i := 1;
        LOOP
            dbms_output.put_line(dan||' * '||i||' = '||dan*i);
            EXIT WHEN i =9;
            i := i + 1;
        END LOOP;
        EXIT WHEN dan = 9;
        dan := dan + 1;
    END LOOP;
END;
/

DECLARE
dan number := 2;
i number;
BEGIN
WHILE TRUE LOOP
i := 1;
WHILE TRUE LOOP
dbms_output.put_line(dan||' * '||i||' = '||dan*i);
EXIT WHEN i =9;
i := i + 1;
END LOOP;
EXIT WHEN dan = 9;
dan := dan + 1;
END LOOP;
END;
/


DECLARE
dan number := 2;
i number;
BEGIN
WHILE dan <= 9 LOOP
i := 1;
WHILE i <= 9 LOOP
dbms_output.put_line(dan||' * '||i||' = '||dan*i);
i := i + 1;
END LOOP;
dan := dan + 1;
END LOOP;
END;
/

BEGIN
    FOR dan IN 2..9 LOOP
        FOR i IN 1..9 LOOP
            dbms_output.put_line(dan||' * '||i|| ' = '||dan*i);
        END LOOP;
    END LOOP;
END;
/



DECLARE
    i number := 1;
    v_string varchar2(10);
BEGIN
    LOOP
        v_string := v_string ||i;
        EXIT WHEN i = 5;
        i := i + 1;
    END LOOP;
    dbms_output.put_line(v_string);
END;
/

DECLARE
i number := 1;
BEGIN
LOOP
dbms_output.put(i);
EXIT WHEN i = 5;
i := i + 1;
END LOOP;
dbms_output.new_line();
END;
/

DECLARE
i number := 10;
BEGIN
WHILE i <= 10 LOOP
dbms_output.put_line(i);
i := i - 1;
EXIT WHEN i = 0;
END LOOP;
END;
/

DECLARE
i number := 10;
BEGIN
WHILE i > 0 LOOP
dbms_output.put_line(i);
i := i - 1;
END LOOP;
END;
/

















































































































