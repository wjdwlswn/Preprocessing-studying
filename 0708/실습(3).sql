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

SELECT ORG_CD "�μ�",
COUNT(*) "�ο���",
AVG( SALARY) "���"
FROM cslee.TB_EMP
GROUP BY ORG_CD
HAVING COUNT(*) >= 4;

SELECT ORG_CD "�μ�",
MAX(SALARY) "�ִ�"
FROM cslee.TB_EMP

SELECT ORG_CD, POSITION, AVG( SALARY)
FROM cslee.TB_EMP
WHERE POSITION IN ('����','�븮','���')
GROUP BY ORG_CD, POSITION;

SELECT ORG_CD
, AVG(CASE POSITION WHEN '����' THEN SALARY END) "����"
, AVG(CASE POSITION WHEN '�븮' THEN SALARY END) "�븮"
, AVG(CASE POSITION WHEN '���' THEN SALARY END) "���"
FROM cslee.TB_EMP
WHERE POSITION IN ('����','�븮','���')
GROUP BY ORG_CD;

SELECT ORG_CD,
sum(COALESCE((case position WHEN '����' THEN 1 ELSE 0 END),0)) "����",
SUM(COALESCE((case position WHEN '����' THEN 1 ELSE 0 END),0)) "����",
SUM(COALESCE((case position WHEN '�븮' THEN 1 ELSE 0 END),0)) "�븮",
SUM(COALESCE((case position WHEN '���' THEN 1 ELSE 0 END),0)) "���"
from cslee.tb_emp
group BY ORG_CD;

SELECT ORG_CD,
COALESCE (SUM(case position WHEN '����' THEN 1 END),0) �����塱,
COALESCE (SUM(case position WHEN '����' THEN 1 END),0) �����塱,
COALESCE (SUM(case position WHEN '�븮' THEN 1 END),0) ���븮��,
COALESCE (SUM(case position WHEN '���' THEN 1 END),0) �������
from cslee.TB_EMP
GROUP BY ORG_CD;