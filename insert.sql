-- 회원가입, 게시글 등록, 입금...

-- 기존의 dept 테이블을 복사해서 dept_temp 테이블 생성
CREATE TABLE DEPT_TEMP AS SELECT * FROM DEPT;

-- 현재 테이블 조회
SELECT * FROM DEPT_TEMP;

-- 데이터 추가하기(방법 1)
INSERT INTO dept_temp(DEPTNO, DNAME, LOC)
VALUES(50,'DATABASE','SEOUL');

-- 데이터 추가하기(방법 2)
INSERT INTO dept_temp VALUES(60,'NETWORK','BUSAN');

-- 데이터를 추가할 때 제일 많이 보는 에러
--INSERT INTO dept_temp(DEPTNO, DNAME, LOC) VALUES(50,'DATABASE'); 값의 수가 충분하지 않습니다. 
--INSERT INTO dept_temp(DEPTNO, DNAME, LOC) VALUES(500,'DATABASE','SEOUL'); 이 열에 대해 지정된 전체 자릿수보다 큰 값이 허용됩니다.

-- 데이터에 NULL 넣기
-- 명시적으로 NULL 삽입
INSERT INTO dept_temp(DEPTNO, DNAME, LOC) VALUES(70,'DATABASE',NULL);
INSERT INTO dept_temp(DEPTNO, DNAME, LOC) VALUES(80,'MOBLIE','');
-- 묵시적으로 NULL 삽입
INSERT INTO dept_temp(DEPTNO, LOC) VALUES(90,'INCHEON');
-- 회원가입 할 때 휴대폰 정보는 필수가 아닙니다.라고 하면 묵시적으로가고
-- 휴대폰 정보가 들어가기도 하고 안 들어가기도 해요 라고 한다면 명시적으로 

-- EMP 테이블을 복사하여 EMP_TEMP 테이블 생성
CREATE TABLE EMP_TEMP AS SELECT * FROM EMP;

-- 테이블 삭제
DROP TABLE EMP_TEMP;

-- EMP 테이블을 복사하여 EMP_TEMP 테이블 생성하되 구조만 복사하기(데이터가 없는 구조만)
CREATE TABLE EMP_TEMP AS SELECT * FROM EMP WHERE 1<>1;
SELECT * FROM EMP_TEMP;

DESC EMP_TEMP;
INSERT INTO emp_temp(empno,ename,job,mgr,hiredate,sal,comm,deptno)
VALUES(9999,'홍길동','PRESIDENT','','2020/11/09',4000,'',10);
INSERT INTO emp_temp(empno,ename,job,mgr,hiredate,sal,comm,deptno)
VALUES(9998,'성춘향','MANAGER',NULL,'2018-01-21',3000,NULL,20);
-- HIREDATE는 / 도 가능하고 - 도 가능

-- 최종 반영(마지막에 무조건 해야함.)
COMMIT;
--UPDATE,DELETE,INSERT는 무조건 COMMIT이 필요함

-- 날짜 집어 넣기 
INSERT INTO emp_temp(empno,ename,job,mgr,hiredate,sal,comm,deptno)
VALUES(9997,'성시경','SINGER',NULL,TO_DATE('21/01/2020','DD/MM/YYYY'),3000,NULL,40); -- 거꾸로 넣었을 경우
INSERT INTO emp_temp(empno,ename,job,mgr,hiredate,sal,comm,deptno)
VALUES(9996,'이순신','HERO',NULL,SYSDATE,1000,NULL,30); -- 시스템 상의 날짜 집어넣기(회원가입에 사용)

-- EMP 테이블에서 SALGRADE 테이블을 참조하여 급여 등급이 1등급인 사원만을 EMP_TEMP 테이블에 추가하고 싶다면
-- 서브 쿼리로 작성하기(데이터와 추가되는 테이블의 열 개수와 서브 쿼리의 열 개수가 일치) = 서브쿼리로 작성할 때 중요
INSERT INTO emp_temp(empno,ename,job,mgr,hiredate,sal,comm,deptno)
SELECT empno,ename,job,mgr,hiredate,sal,comm,deptno
FROM EMP E, SALGRADE S
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL AND S.GRADE = 1;
-- 범위 데이터를 만들 때 많이 사용





