
-- 다중행 함수 : SUM / COUNT / MAX / MIN / AVG
-- 여러 행을 바탕으로 하나의 결과값을 도출해내기 위한 함수

-- SELECT ename, SUM(sal) FROM emp; 오류
-- ename을 썼기에 ename을 빼면 잘 작동함

SELECT SUM(sal), SUM(DISTINCT sal), SUM(ALL sal) FROM emp;
-- distinct는 중복 제거이기때문에 sal의 값 중 같은 값이 있다면 제거 후 합한다.