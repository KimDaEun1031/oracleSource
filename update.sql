-- UPDATE : 데이터 수정 

CREATE TABLE DEPT_TEMP2 AS SELECT * FROM DEPT;

-- DEPT_TEMP2에있는 LOC 모두 수정
SELECT * FROM DEPT_TEMP2;

UPDATE dept_temp2     -- 테이블 명
SET LOC='SEOUL';      -- 수정할 내용

ROLLBACK; -- 되돌아가기 CTRL+Z

UPDATE dept_temp2    -- 테이블 명 
SET LOC='SEOUL'      -- 수정할 내용 
WHERE DEPTNO=10;     -- 업데이트 조건

-- EMP_TEMP 테이블 사원들 중에서 급여가 3000 이하인 사원만 추가 수당을 50으로 수정
SELECT * FROM EMP_TEMP;

UPDATE emp_temp
SET comm = 50
WHERE sal <= 3000;

-- 기존에 데이터가 존재한다면 
UPDATE emp_temp
SET comm = COMM+50
WHERE sal <= 3000;
-- 저런식으로 원래의 값에 더해주든지 빼주든지 해야함

-- 서브 쿼리를 이용한 데이터 수정
-- 40번 부서의 부서명과 지역 수정
UPDATE dept_temp2
SET (DNAME, LOC) = (SELECT DNAME, LOC FROM DEPT WHERE DEPTNO=30)
WHERE DEPTNO=40;


UPDATE dept_temp2
SET LOC = 'SEOUL'
WHERE DEPTNO=(SELECT DEPTNO FROM DEPT WHERE DNAME='OPERATIONS');

COMMIT;