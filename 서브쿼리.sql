-- 존스의 급여보다 높은 급여를 받는 사원들 출력

-- 존스의 급여 알아내기   =  2975
SELECT SAL FROM emp WHERE ename = 'JONES';  

-- 높은 급여 사원 출력하기 = scott, king, ford
SELECT * FROM emp WHERE sal > 2975;

-- 서브 쿼리 : 쿼리 문 안에 다른 쿼리문을 포함하고 있는 상태
-- 단일행 서브 쿼리 = 서브 쿼리의 결과가 하나만 나오는 경우(중복이 되지 않는 오로지 하나의 결과만)
-- >,<,=,<=,>=  / (같지 않음) <>,^=,!=
SELECT * 
FROM emp 
WHERE sal > (SELECT SAL FROM emp WHERE ename = 'JONES');

-- 사원이름이 allen인 사원의 추가수당보다 많이 받는 사원을 출력
SELECT *
FROM emp
WHERE comm > (SELECT comm  FROM emp WHERE ename='ALLEN');

-- 사원 이름이  ward인 사원의 입사일보다 빨리 입사한 사원을 출력
SELECT *
FROM emp
WHERE hiredate < (SELECT hiredate FROM emp WHERE ename='WARD');

-- 20번 부서에 속한 사원 중 전체 사원의 평균 급여보다 높은 급여를 받는 사원 출력
SELECT *
FROM emp 
WHERE deptno = 20 AND sal > (SELECT AVG(SAL) FROM emp);

-- 20번 부서에 속한 사원 중 전체 사원의 평균 급여보다 높은 급여를 받는 사원의 정보 출력
-- 부서명, 지역위치 출력 추가
SELECT *
FROM DEPT;

SELECT E.ENAME, E.DEPTNO, E.SAL, D.DEPTNO, D.DNAME, D.LOC
FROM emp E, dept D 
WHERE E.DEPTNO = D.DEPTNO AND D.deptno = 20 AND E.sal > (SELECT AVG(SAL) FROM emp);

-- 다중행 서브 쿼리 : 결과가 여러 행이 나옴
-- IN /ANY / ALL / EXISTS

-- SELECT * FROM emp WHERE sal >= (SELECT MAX(SAL) FROM emp GROUP BY deptno); -- 에러
-- 왜? 그룹을 잡아버렸기에
-- 서브 쿼리 결과가 2개 이상 나오는 경우라면 단일행서브쿼리의 연산자는 사용 불가
SELECT * FROM emp WHERE sal IN (SELECT MAX(SAL) FROM emp GROUP BY deptno); -- 4행 출력
-- IN ~이거나 ~ 이거나 뭐든 하나만 맞으면 TRUE

-- ANY(=SOME) : 연산자 기호와 같이 사용 / MAX나 MIN 사용할 필요 없음
-- =ANY : IN의 수행결과와 같게 나옴 , 단 IN을 더 많이 사용함
SELECT * FROM emp WHERE sal = ANY (SELECT MAX(SAL) FROM emp GROUP BY deptno);

SELECT * FROM emp WHERE sal = SOME (SELECT MAX(SAL) FROM emp GROUP BY deptno);

-- 30번 부서 사원들의 최대 급여보다 적은 급여를 받는 사원 출력
SELECT * FROM emp WHERE sal < ANY (SELECT MAX(SAL) FROM emp WHERE deptno = 30);

SELECT * FROM emp WHERE sal < ANY (SELECT SAL FROM emp WHERE deptno = 30);

-- 30번 부서 사원들의 최소 급여보다 많은 급여를 받는 사원 출력
SELECT * FROM emp WHERE sal > ANY (SELECT SAL FROM emp WHERE deptno = 30);

-- ALL : 서브 쿼리를 모두 만족하는 메인 쿼리를 추출 할 때 / 연산자 사용 / MAX나 MIN 사용할 필요 없음
-- 부서번호가 30번인 사원들의 최소 급여보다 더 적은 급여를 받는 사원 출력
SELECT * FROM emp WHERE sal < ALL (SELECT SAL FROM emp WHERE deptno = 30);

-- EXISTS : IN과 비슷한 개념, 단 IN보다 성능 우수
-- 서브 쿼리 결과가 존재하면 메인 쿼리 결과도 출력
SELECT * FROM emp WHERE EXISTS (SELECT dname FROM dept WHERE deptno=20);
SELECT * FROM emp WHERE NOT EXISTS (SELECT dname FROM dept WHERE deptno=20);

SELECT empno, deptno
FROM emp
WHERE EXISTS (SELECT deptno 
              FROM dept 
              WHERE deptno IN(20.30) AND emp.deptno = dept.deptno);

SELECT empno, deptno
FROM emp
WHERE EXISTS (SELECT 1
              FROM dept 
              WHERE deptno IN(20.30) AND emp.deptno = dept.deptno);
              
-- exists 뒤에 오는 서브 쿼리의 셀레트에서 뭘 뽑아내도 상관이 없음 / exists는 서브 쿼리의 조건이 중요


-- ppt 서브 쿼리 실습
-- 전체 사원 중 allen과 같은 직책인 사원들의 사원 정보, 부서정보를 출력 4행
SELECT E.empno, E.ename, E.sal, E.job, D.deptno, D.dname
FROM emp E, dept D
WHERE E.DEPTNO = D.DEPTNO AND E.job IN (SELECT job FROM emp WHERE ename='ALLEN'); 

-- 전체 사원의 평균 급여 보다 높은 급여를 받는 사원들의 사원들의 사원정보, 부서정보, 급여등급 정보
-- 단 출력시 급여가 많은순으로 정렬하되 급여가 같은 경우 사원번호를 기준을 오름차순 정렬  6행
SELECT E.empno, E.ename,D.dname, E.hiredate, D.loc, E.sal ,S.grade
FROM emp E, salgrade S, dept D
WHERE E.DEPTNO = D.DEPTNO AND E.sal BETWEEN S.losal AND S.hisal AND E.sal > (SELECT AVG(SAL) FROM emp)
ORDER BY E.SAL DESC, E.EMPNO ASC; 

-- 다중 열 서브 쿼리 : 서브 쿼리의 SELECT 문에 비교할 컬럼이 여러 개 나오는 방식
SELECT * FROM emp WHERE (DEPTNO,SAL) IN
          (SELECT DEPTNO, MAX(SAL) FROM emp GROUP BY DEPTNO);  --4행
          
-- FROM 절 서브 쿼리(=INLINE VIEW[인라인 뷰])
SELECT E.EMPNO, E.ENAME, D.DEPTNO, D.DNAME,D.LOC
FROM (SELECT * FROM EMP WHERE DEPTNO=10) E, (SELECT * FROM DEPT) D
WHERE E.DEPTNO = D.DEPTNO;  --3행

-- SELECT 절 서브 쿼리(=SCALAR SUBQUERY[스칼라 서브쿼리])
-- 가독성이 떨어지기에 굳이 하지 않음 / PPT예제만 넣어놓겠음
SELECT EMPNO, ENAME, JOB, SAL,
(SELECT GRADE FROM SALGRADE WHERE E.SAL BETWEEN LOSAL AND HISAL) AS SALGRADE,
DEPTNO, (SELECT DNAME FROM DEPT WHERE E.DEPTNO = DEPT.DEPTNO) AS DNAME FROM EMP E;

-- 실습
-- 10번 부서에 근무하는 사원 중 30번 부서에는 존재하지 않는 직책을 가진 사원들의 사원정보, 부서정보를 출력 1행
SELECT E.empno, E.ename, E.job, E.sal, D.deptno, D.dname, D.loc
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO AND E.JOB NOT IN (SELECT DISTINCT JOB FROM EMP WHERE DEPTNO=30)
AND E.DEPTNO=10;


-- 직책이 SALESMAN인 사람들의 최고 급여보다 높은 급여를 받는 사원들의 사원정보, 급여 등급 정보를 출력
-- 단 다중행 함수를 사용하는 방법과 사용하지 않는 방법을 통해 사원번호를 기준으로 오름차순 정렬
SELECT * FROM salgrade;

SELECT E.empno, E.ename, E.job, E.sal, S.HISAL, S.LOSAL, S.GRADE
FROM EMP E, SALGRADE S
WHERE E.sal BETWEEN S.losal AND S.hisal AND SAL > (SELECT MAX(SAL) FROM emp WHERE JOB='SALESMAN')
ORDER BY E.empno;

SELECT E.empno, E.ename, E.job, E.sal, S.HISAL, S.LOSAL, S.GRADE
FROM EMP E, SALGRADE S
WHERE E.sal BETWEEN S.losal AND S.hisal AND SAL > ALL (SELECT MAX(SAL) FROM emp WHERE JOB='SALESMAN')
ORDER BY E.empno;
