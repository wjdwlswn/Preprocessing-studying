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

SELECT ORG_CD "부서",
COUNT(*) "인원수",
AVG( SALARY) "평균"
FROM cslee.TB_EMP
GROUP BY ORG_CD
HAVING COUNT(*) >= 4;

SELECT ORG_CD "부서",
MAX(SALARY) "최대"
FROM cslee.TB_EMP

SELECT ORG_CD, POSITION, AVG( SALARY)
FROM cslee.TB_EMP
WHERE POSITION IN ('과장','대리','사원')
GROUP BY ORG_CD, POSITION;

SELECT ORG_CD
, AVG(CASE POSITION WHEN '과장' THEN SALARY END) "과장"
, AVG(CASE POSITION WHEN '대리' THEN SALARY END) "대리"
, AVG(CASE POSITION WHEN '사원' THEN SALARY END) "사원"
FROM cslee.TB_EMP
WHERE POSITION IN ('과장','대리','사원')
GROUP BY ORG_CD;

SELECT ORG_CD,
sum(COALESCE((case position WHEN '팀장' THEN 1 ELSE 0 END),0)) "팀장",
SUM(COALESCE((case position WHEN '과장' THEN 1 ELSE 0 END),0)) "과장",
SUM(COALESCE((case position WHEN '대리' THEN 1 ELSE 0 END),0)) "대리",
SUM(COALESCE((case position WHEN '사원' THEN 1 ELSE 0 END),0)) "사원"
from cslee.tb_emp
group BY ORG_CD;

SELECT ORG_CD,
COALESCE (SUM(case position WHEN '팀장' THEN 1 END),0) “팀장”,
COALESCE (SUM(case position WHEN '과장' THEN 1 END),0) “과장”,
COALESCE (SUM(case position WHEN '대리' THEN 1 END),0) “대리”,
COALESCE (SUM(case position WHEN '사원' THEN 1 END),0) “사원”
from cslee.TB_EMP
GROUP BY ORG_CD;