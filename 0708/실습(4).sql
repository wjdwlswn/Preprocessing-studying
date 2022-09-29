SELECT TB_EMP.EMP_NAME, TB_EMP.ORG_CD
, TB_ORG.ORG_CD, TB_ORG.ORG_NAME
FROM cslee.TB_EMP, cslee.TB_ORG
WHERE cslee.TB_EMP.ORG_CD = cslee.TB_ORG.ORG_CD;

SELECT TB_EMP.EMP_NO,
TB_EMP.EMP_NAME,
TB_EMP.ORG_CD,
TB_ORG.ORG_NAME,
TB_EMP.POSITION
FROM cslee.TB_EMP,
cslee.TB_ORG
WHERE cslee.TB_EMP.ORG_CD = cslee.TB_ORG.ORG_CD;

SELECT E.EMP_NO,
E.EMP_NAME,
E.ORG_CD,
O.ORG_NAME,
E.POSITION
FROM cslee.TB_EMP AS E,
cslee.TB_ORG AS O
WHERE E.ORG_CD = O.ORG_CD 
AND E.POSITION = '팀장'
ORDER BY O.ORG_NAME;

SELECT A.ACCNO,
C.CUST_NAME,
P.PROD_NAME,
A.CONT_AMT,
E.EMP_NAME
FROM cslee.TB_ACCNT A, cslee.TB_CUST C, cslee.TB_PROD P, cslee.TB_EMP E
WHERE A.CUST_NO = C.CUST_NO
AND A.PROD_CD = P.PROD_CD
AND A.MANAGER = E.EMP_NO;

SELECT E.EMP_NAME 사원명,
E.SALARY 연봉,
S.GRADE 급여등급
FROM cslee.TB_EMP E, cslee.TB_GRADE S
where E.SALARY
BETWEEN S.LOW_SAL AND S.HIGH_SAL;

SELECT EMP.EMP_NO, EMP.EMP_NAME, ORG.ORG_NAME
FROM cslee.TB_EMP EMP, cslee.TB_ORG ORG
WHERE EMP.ORG_CD = ORG.ORG_CD;

SELECT EMP.EMP_NO, EMP.EMP_NAME, ORG.ORG_NAME
FROM cslee.TB_EMP EMP
INNER JOIN cslee.TB_ORG ORG
ON EMP.ORG_CD = ORG.ORG_CD;

SELECT EMP.EMP_NO, EMP.EMP_NAME, ORG.ORG_NAME
FROM cslee.TB_EMP EMP
JOIN cslee.TB_ORG ORG
ON EMP.ORG_CD = ORG.ORG_CD;

SELECT ACC.ACCNO, ACC.CUST_NO, CUST.CUST_NAME
FROM cslee.TB_ACCNT ACC
INNER JOIN cslee.TB_CUST CUST
ON (CUST.CUST_NO = ACC.CUST_NO);

SELECT E.EMP_NAME, E.ORG_CD, O.ORG_CD, O.ORG_NAME
FROM cslee.TB_EMP E
JOIN cslee.TB_ORG O
ON (E.ORG_CD = O.ORG_CD)
WHERE E.ORG_CD = '10';

SELECT A.ACCNO 계좌번호, C.CUST_NAME 고객명, P.PROD_NAME 상품명
, A.CONT_AMT 계약금액, E.EMP_NAME 담당자명
FROM cslee.TB_ACCNT A, cslee.TB_CUST C, cslee.TB_PROD P, cslee.TB_EMP E
WHERE A.CUST_NO = C.CUST_NO
AND A.PROD_CD = P.PROD_CD
AND A.MANAGER = E.EMP_NO;

SELECT A.ACCNO 계좌번호, C.CUST_NAME 고객명, P.PROD_NAME 상품명
, A.CONT_AMT 계약번호, E.EMP_NAME 담당자명
FROM cslee.TB_ACCNT A
INNER JOIN cslee.TB_CUST C ON A.CUST_NO = C.CUST_NO
INNER JOIN cslee.TB_PROD P ON A.PROD_CD = P.PROD_CD
INNER JOIN cslee.TB_EMP E ON A.MANAGER = E.EMP_NO;

select count(emp_name) from cslee.tb_emp;

select count(org_name) from cslee.tb_org;

SELECT E.EMP_NAME, O.ORG_NAME
FROM cslee.TB_EMP E CROSS JOIN cslee.TB_ORG O
ORDER BY EMP_NAME;

select count(e.emp_name)
FROM cslee.TB_EMP E CROSS JOIN cslee.TB_ORG O;

SELECT E.EMP_NO 사번, E.EMP_NAME 사원명,
E.POSITION 직책, O.ORG_NAME 부서명
FROM cslee.TB_EMP E LEFT OUTER JOIN cslee.TB_ORG O
         ON E.ORG_CD = O.ORG_CD
WHERE E.POSITION = '사원';

SELECT E.EMP_NO 사번, E.EMP_NAME 사원명, E.POSITION 직책, O.ORG_NAME 부서명
FROM cslee.TB_ORG O RIGHT OUTER JOIN cslee.TB_EMP E
ON E.ORG_CD = O.ORG_CD
WHERE E.POSITION = '사원';

SELECT A.ORG_CD, A.ORG_NAME, B.ORG_CD, B.ORG_NAME
FROM cslee.TB_ORG A FULL OUTER JOIN cslee.TB_ORG B
ON A.ORG_CD=B.ORG_CD;

SELECT A.ORG_CD, A.ORG_NAME, B.ORG_CD, B.ORG_NAME
FROM cslee.TB_ORG A LEFT OUTER JOIN cslee.TB_ORG B
ON A.ORG_CD = B.ORG_CD
UNION
SELECT A.ORG_CD, A.ORG_NAME, B.ORG_CD, B.ORG_NAME
from cslee.TB_ORG A RIGHT OUTER JOIN cslee.TB_ORG B
ON A.ORG_CD = B.ORG_CD;