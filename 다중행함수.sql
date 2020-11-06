
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
