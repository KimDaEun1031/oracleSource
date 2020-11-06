
-- 다중행 함수 : SUM / COUNT / MAX / MIN / AVG
-- 여러 행을 바탕으로 하나의 결과값을 도출해내기 위한 함수

-- SUM : 합계
-- SELECT ename, SUM(sal) FROM emp; 오류
-- ename을 썼기에 ename을 빼면 잘 작동함

SELECT SUM(sal), SUM(DISTINCT sal), SUM(ALL sal) FROM emp;
-- distinct는 중복 제거이기때문에 sal의 값 중 같은 값이 있다면 제거 후 합한다.

-- count : 개수
SELECT COUNT(*) FROM emp;
-- EMP에 몇 개의 데이터가 들어가 있나요? 14개가 들어있음

--부서 번호가 30번인 직원 수 구하기
SELECT COUNT(*) FROM emp WHERE depno=30;

-- MAX(최대값), MIN(최솟값)
SELECT MAX(SAL), MIN(SAL) FROM emp;

-- 부서 번호 20인 사원의 입사일 중 가장 최근 입사일 구하기
SELECT MAX(hiredate) FROM emp WHERE deptno=20;

-- AVG : 평균
SELECT AVG(SAL) FROM emp;
SELECT AVG(SAL) FROM emp WHERE deptno=30;
SELECT AVG(DISTINCT SAL) FROM emp;

-- =============== GROUP BY / HAVING - GROUP BY  ================
-- GROUP BY : 그룹을 (열로 묶음)지정해서 추출할 때 FROM 뒤에 옴

-- 부서 별로 연봉 평균을 구해보자
-- 지금까지 배운 걸로 했다면 노가다가 필수이지만 그룹 바이를 쓴다면 간단하게 가능
SELECT deptno,AVG(SAL) 
FROM emp 
GROUP BY deptno;

-- 부서번호 별 추가수당 평균 구하기
SELECT deptno, AVG(COMM)
FROM emp 
GROUP BY deptno;

-- 부서번호, 직책 별 급여 평균 구하기
SELECT deptno, AVG(SAL), job 
FROM emp 
GROUP BY deptno, job 
ORDER BY deptno, job;

-- 유의점 : group by 절에 포함 안되는 열을 select에 포함 하면 안됨
-- ename 때문에 오류
-- SELECT ename, deptno, AVG(sal)
SELECT deptno, AVG(sal)
FROM emp
GROUP BY deptno;


-- HAVING GROUP BY
-- 그룹 바이 출력 조건 / 조건줄 때 사용
-- 그룹의 조건은 WHERE 안댐 무조건

-- 각 부서의 직팩별 평균 급여를 구하 되 그 평균 급여가 2000인 이상의 그룹만
SELECT AVG(SAL), deptno, job
FROM emp
GROUP BY job, deptno
HAVING AVG(sal)>=2000
ORDER BY deptno,job;

-- EMP 테이블의 부서별 직책의 평균 급여가 500이상인 사원들의
-- 부서번호, 직책, 부서별 직책의 평균 급여 출력
SELECT  AVG(sal), deptno, job
FROM emp
GROUP BY deptno, job HAVING AVG(sal) >= 500;
-- ; 이거 안 붙여도 되긴 되는데 왜 됨?

-- EMP 테이블의 부서별 직책의 평균 급여가 2000이상이고 3000이하 사원들의
-- 부서번호, 직책, 부서별 직책의 평균 급여 출력
SELECT deptno, job, AVG(sal) --2.
FROM emp --1.
WHERE sal<=3000 --3.
GROUP BY deptno, job HAVING AVG(sal) >= 2000
ORDER BY deptno, job;
-- WHERE문만 있었을 때 프롬->셀렉트->웨어절 순으로 가지만
-- GROUP문과 섞여있을 때는 순서를 명확하게 웨어절이 뒤에 실행해야한다.
-- 위에 실행은 되지만 원하는 것이 나오지 않았음

SELECT *
FROM emp;

-- 부서번호(DEPTNO), 평균 급여(AVG_SAL), 최고 급여(MAX_SAL), 최저급여(MIN_SAL),
-- 사원수(CNT)를 출력 단. 평균 급여 출력 시 소수점 제외하고 각 부서번호 별로 출력
-- TRUNC(AVG(SAL),0) 대신에 FLOOR(AVG(SAL)) 도 가능
SELECT deptno, TRUNC(AVG(sal),0) AS AVG_SAL, MAX(sal) AS MAX_SAL, MIN(sal) AS MIN_SAL,
       COUNT(empno) AS CNT
FROM emp
GROUP BY deptno;

-- 같은 직책에 종사하는 사원이 3명 이상인 직책과 인원수를 출력
SELECT job, COUNT(job)
FROM emp
GROUP BY job HAVING COUNT(job) >= 3;

-- 사원들의 입사연도를 기준으로 부서별로 몇 명 입사했는지 출력 COUNT 안에 * 넣어도 됨
SELECT TO_CHAR(hiredate,'yyyy') AS HIRE_YEAR, deptno, COUNT(TO_CHAR(hiredate,'yyyy')) AS CNT
FROM emp
GROUP BY deptno, TO_CHAR(hiredate,'yyyy')
ORDER BY TO_CHAR(hiredate,'yyyy');

