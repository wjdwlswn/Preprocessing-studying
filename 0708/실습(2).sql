SELECT EMP_NAME, to_char((current_timestamp - ENT_DATE),'W') WEEKS
FROM cslee.TB_EMP
WHERE ORG_CD = '10';

select emp_name, ent_date,
to_char(ent_date,'yyyy') �Ի��,
to_char(ent_date,'MM') �Ի��,
to_char(ent_date,'DD') �Ի���
from cslee.tb_emp;

select emp_name, ent_date,
abs(extract('year' from ent_date))  �Ի��,
extract('month' from ent_date) �Ի��,
extract('day' from ent_date) �Ի���
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
when '����1��' then '����'
when '����2��' then '����'
when '����3��' then '����'
when '�濵������' then '����'
else '����'
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
       coalesce(POSITION,'����')
from cslee.TB_EMP;

SELECT EMP_NAME, POSITION,
CASE WHEN POSITION IS NULL
THEN '����'
ELSE POSITION
END AS ��å
FROM cslee.TB_EMP

select coalesce(salary, 0) SAL
from cslee.tb_emp
where emp_name='������';

SELECT MAX(salary) SAL
FROM cslee.tb_emp
WHERE emp_name='������';

SELECT coalesce(MAX(salary), 9999) SAL
FROM cslee.tb_emp
WHERE emp_name='������';

SELECT COUNT(*) "��ü�Ǽ�"
, COUNT(POSITION) "��å�Ǽ�"
, COUNT(DISTINCT POSITION) "��å����"
, MAX(SALARY) "�ִ�"
, MIN(SALARY) "�ּ�"
, AVG(SALARY) "���"
FROM cslee.TB_EMP;

SELECT POSITION "��å",
COUNT(*) "�ο���",
MIN(SALARY) "�ּ�",
MAX(SALARY) "�ִ�",
AVG(SALARY) "���"
FROM cslee.TB_EMP
GROUP BY POSITION;