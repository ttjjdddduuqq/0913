SELECT level
FROM dual
CONNECT BY level <= 100;

SELECT '2 * '||level||' = '||2*level "2"
FROM dual
CONNECT BY level <= 9;

SELECT dan||'*'||num||' = '||dan*num
FROM (SELECT level+1 dan FROM dual CONNECT BY level <= 8),
      (SELECT level num FROM dual CONNECT BY level <= 9);
