-- 외부 조인이 제일 많이 질문 들어옴 / 회사가면 조인 많이 씀
-- 왼쪽과 오른쪽의 차이


SELECT * FROM emp,dept ORDER BY empno; -- 나올 수 있는 모든 조합 조회
SELECT COUNT(*) FROM emp,dept ORDER BY empno;

SELECT * FROM dept; -- 4행
SELECT * FROM emp; -- 14행
-- 이렇게 만으로는 사용못함  (윗부분 전부)


--INNER JOIN 내부 조인(=등가조인,단순조인) : 같다면 찾아오는 것 / 제일 많이 사용
-- WHERE 문을 썻을 때
SELECT *
FROM emp, dept
WHERE emp.deptno = dept.deptno -- 조인의 기준이 되는 부분
ORDER BY empno;
--  emp.deptno = dept.deptno ==> emp의 deptno와 dept의 deptno가 같다면~

-- INNER JOIN ~ ON ~ 문을 썻을 때
SELECT *
FROM emp INNER JOIN dept
ON emp.deptno = dept.deptno -- 조인의 기준이 되는 부분
ORDER BY empno;
-- 위에 둘다 알고 있어야댐

-- 이렇게만 하기엔 불편하니 별칭을 붙인다 AS 필요없음
-- 자바 생성자 느낌..

SELECT *
FROM emp E, dept D
WHERE E.deptno = D.deptno -- 조인의 기준이 되는 부분
ORDER BY empno;

SELECT *
FROM emp E INNER JOIN dept D
ON E.deptno = D.deptno -- 조인의 기준이 되는 부분
ORDER BY empno;


-- 두 테이블에 같은 이름의 필드가 존재하는 경우
-- 어느 테이블에 있는 필드를 가지고 올 것인지 정확히 명시
SELECT empno, ename, job, deptno, dname
FROM emp E, dept D
WHERE E.deptno = D.deptno -- 조인의 기준이 되는 부분
ORDER BY empno;
-- 에러 왜? DEPTNO 때문에 왜? 누구의 DEPTNO인지 확실하게 하지 않았기 때문에
-- D.DEPTNO라고 한다면
SELECT empno, ename, job, D.deptno, dname
FROM emp E, dept D
WHERE E.deptno = D.deptno -- 조인의 기준이 되는 부분
ORDER BY empno;
-- 성공이다


-- emp테이블과 dept 테이블을 조인하여 enpno, ename, sal, deptno
-- dname, loc를 조회한다. 단, 급여가 3000 이상인 사원들만 출력
SELECT E.empno, E.ename, E.sal, D.deptno, D.dname, D.loc
FROM emp E, dept D
WHERE E.deptno = D.deptno AND sal >= 3000;

SELECT * FROM dept;
-- emp 테이블의 별칭을 e로 dept 테이블의 별칭을 d로 하여
-- 급여가 2500 이하이고 사원번호가 9999이하인 사원의 정보를 출력
SELECT *
FROM emp E, dept D
WHERE E.deptno = D.deptno 
AND sal<=2500 
AND empno<=9999;
-- emp 테이블의 별칭을 e로 salgrade 테이블의 별칭을 s로 하여
-- 각 사원의 정보와 더불어 사원의 등급 정보를 출력
SELECT *
FROM emp E, salgrade S
WHERE E.sal BETWEEN S.losal AND S.hisal;

-- 셀프 조인(자체 조인) : 조인 테이블이 자기 자신 테이블 일 때
SELECT * FROM emp;

SELECT E1.empno, E1.ename, E1.mgr, E2.empno AS MGR_ENPNO, E2.ename AS MGR_ENAME
FROM emp E1 ,emp E2
WHERE E1.mgr = E2.empno;

-- 외부조인(OUTER JOIN) : 조건이 만족하지 않는 데이터 추출
-- LEFT OUTER JOIN 이런 식으로 쓰는게 표준

-- 처리방식(1)  LEFT OUTER JOIN 을 쓴 방식
SELECT E1.empno, E1.ename, E1.mgr, E2.empno AS MGR_ENPNO, E2.ename AS MGR_ENAME
FROM emp E1 LEFT OUTER JOIN emp E2
ON E1.mgr = E2.empno;

-- 처리방식(2)  (+) 을 쓴 방식
SELECT E1.empno, E1.ename, E1.mgr, E2.empno AS MGR_ENPNO, E2.ename AS MGR_ENAME
FROM emp E1 ,emp E2
WHERE E1.mgr = E2.empno(+); -- 왼쪽이 기준이라서

-- 처리방식(1)  RIGHT OUTER JOIN
SELECT E1.empno, E1.ename, E1.mgr, E2.empno AS MGR_ENPNO, E2.ename AS MGR_ENAME
FROM emp E1 RIGHT OUTER JOIN emp E2
ON E1.mgr = E2.empno;


-- 처리방식(2)  (+)
SELECT E1.empno, E1.ename, E1.mgr, E2.empno AS MGR_ENPNO, E2.ename AS MGR_ENAME
FROM emp E1 , emp E2
WHERE E1.mgr(+) = E2.empno; --오른쪽 기준

-- 실습

-- 급여가 2000초과인 사원들의 부서정보, 사원정보를 출력
SELECT d.deptno, d.dname, e.empno, e.ename, e.sal
FROM EMP E INNER JOIN DEPT D
ON E.deptno = D.deptno AND E.SAL>2000;
-- 각 부서별 평균 급여,최대 급여, 최소 급여, 사원수를 출력 
SELECT E.deptno , D.dname ,ROUND(AVG(SAL)) AS AVG_SAL, MAX(SAL) AS MAX_SAL,
       MIN(SAL) AS MIN_SAL, COUNT(empno) AS CNT
FROM EMP E, DEPT D
WHERE  E.deptno = d.deptno
GROUP BY E.deptno, d.dname;


-- 모든 부서정보와 사원정보를 부서번호, 사원이름 순으로 정렬하여 출력
SELECT d.deptno, d.dname, e.empno, e.ename, e.job, e.sal
FROM EMP E INNER JOIN DEPT D
ON e.deptno = d.deptno ORDER BY deptno,ename;

SELECT d.deptno, d.dname, e.empno, e.ename, e.job, e.sal
FROM EMP E RIGHT OUTER JOIN DEPT D
ON e.deptno = d.deptno ORDER BY deptno,ename;
-- 모든 부서정보와 사원정보, 급여등급 정보, 각 사원의 직속상관의 정보 부서번호, 사원번호 순으로 정렬

SELECT D1.DEPTNO, D1.DNAME, E1.EMPNO, E1.ENAME, E1.MGR, E1.SAL, E1.DEPTNO,
       S.LOSAL, S.HISAL,S.GRADE,E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_ENAME
FROM EMP E1 
RIGHT OUTER JOIN DEPT D1 ON E1.DEPTNO = D1.DEPTNO
LEFT OUTER JOIN SALGRADE S ON E1.SAL BETWEEN S.LOSAL AND S.HISAL
LEFT OUTER JOIN EMP E2 ON E1.MGR = E2.EMPNO
ORDER BY D1.DEPTNO, E1.EMPNO;

SELECT D1.DEPTNO, D1.DNAME, E1.EMPNO, E1.ENAME, E1.MGR, E1.SAL, E1.DEPTNO,
       S.LOSAL, S.HISAL,S.GRADE,E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_ENAME
FROM EMP E1 ,DEPT D1,SALGRADE S,EMP E2
WHERE E1.DEPTNO(+) = D1.DEPTNO AND E1.SAL BETWEEN S.LOSAL AND S.HISAL(+) AND
     E1.MGR = E2.EMPNO(+)
ORDER BY E1.DEPTNO;

-- 서브 쿼리 예습
-- 단일행 쿼리 : 왜 실행결과가 단 하나의 행? 무슨 소린지 모르겠다.. 설명 필요
SELECT * FROM emp WHERE sal >
(SELECT sal FROM emp WHERE ename = 'JONES');

SELECT * FROM emp WHERE hiredate >
(SELECT hiredate FROM emp WHERE ename = 'SCOTT');

