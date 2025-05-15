SELECT
	sysdate,
	systimestamp,
	current_date,
	current_timestamp,
	localtimestamp
FROM dual;



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

SELECT
systimestamp,
	to_char(systimestamp + 10/24, 'yyyy-mm-dd hh24:mi:ss'),
	to_char(localtimestamp + 10/24, 'yyyy-mm-dd hh24:mi:ss'),
	to_char(current_timestamp + 10/24, 'yyyy-mm-dd hh24:mi:ss')
FROM dual;






