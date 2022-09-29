SELECT EMP_NAME, to_char((current_timestamp - ENT_DATE),'W') WEEKS
FROM cslee.TB_EMP
WHERE ORG_CD = '10';

select emp_name, ent_date,
to_char(ent_date,'yyyy') 입사년,
to_char(ent_date,'MM') 입사월,
to_char(ent_date,'DD') 입사일
from cslee.tb_emp;

select emp_name, ent_date,
abs(extract('year' from ent_date))  입사년,
extract('month' from ent_date) 입사월,
extract('day' from ent_date) 입사일
from cslee.tb_emp;

select to_date('05 Dec 2000', 'DD Mon YYYY');
select to_number('12,454.8-', '99G999D9S');
select to_timestamp('05 Dec 2000', 'DD Mon YYYY');

SELECT CAST(123.4 AS VARCHAR(10))
, CAST('123.5' AS NUMERIC)
, CAST(1234.5678 AS DEC(6,2))
, CAST(CURRENT_TIMESTAMP AS DATE)
, TO_CHAR(CURRENT_TIMESTAMP, 'YYYY-MM-DD HH24:MI:SS')
, TO_CHAR(1234.56, 'L9,999.99')
, TO_NUMBER('$12,345', '$99,999')
, TO_DATE('2014/03/01 21:30:18','YYYY/MM/DD HH24:MI:SS')
, TO_TIMESTAMP('2014/03/01 21:30:18','YYYY/MM/DD HH24:MI:SS');

SELECT emp_name,
case when salary > 50000000
then salary
else 50000000
end as revised_salary
FROM cslee.tb_emp;

select org_name,
case org_name
when '영업1팀' then '지사'
when '영업2팀' then '지사'
when '영업3팀' then '지사'
when '경영관리팀' then '본사'
else '지점'
end as AREA
from cslee.tb_org;

SELECT EMP_NAME,
CASE WHEN SALARY >= 90000000 THEN 'HIGH'
WHEN SALARY >= 60000000 THEN 'MID'
ELSE 'LOW'
END AS SALARY_GRADE
FROM cslee.TB_EMP;

SELECT EMP_NAME, SALARY,
CASE WHEN SALARY >= 50000000
THEN 20000000
ELSE (CASE WHEN SALARY >= 20000000
THEN 10000000
ELSE SALARY * 0.5
END)
END as BONUS
FROM cslee.TB_EMP;

SELECT EMP_NAME, position,
       coalesce(POSITION,'없음')
from cslee.TB_EMP;

SELECT EMP_NAME, POSITION,
CASE WHEN POSITION IS NULL
THEN '없음'
ELSE POSITION
END AS 직책
FROM cslee.TB_EMP

select coalesce(salary, 0) SAL
from cslee.tb_emp
where emp_name='김태진';

SELECT MAX(salary) SAL
FROM cslee.tb_emp
WHERE emp_name='김태진';

SELECT coalesce(MAX(salary), 9999) SAL
FROM cslee.tb_emp
WHERE emp_name='김태진';

SELECT COUNT(*) "전체건수"
, COUNT(POSITION) "직책건수"
, COUNT(DISTINCT POSITION) "직책종류"
, MAX(SALARY) "최대"
, MIN(SALARY) "최소"
, AVG(SALARY) "평균"
FROM cslee.TB_EMP;

SELECT POSITION "직책",
COUNT(*) "인원수",
MIN(SALARY) "최소",
MAX(SALARY) "최대",
AVG(SALARY) "평균"
FROM cslee.TB_EMP
GROUP BY POSITION;