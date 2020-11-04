-- scott 계정이 가지고 있는 모든 테이블 보기
select * from tab;

-- DESC는 디스크 라이브러리의 약자 / EMP 테이블의 구조
-- 이름 : EMP의 필드 부분 /유형 : 자바의 타입같은 구조
-- number = int / varchar = 가변형 문자열 타입 = string들을 넣으면 됨 
-- (7) 가로 안에 숫자는 자리수 인데 만약(7,2)라면 7자리 수중 2...
DESC emp;

-- emp 테이블의 모든 내용 조회
SELECT * FROM emp;

-- emp 테이블의 특정 필드만 조회
SELECT ename, job, sal FROM emp;

-- 중복 레코드 제거한 후 조회
-- deptno에 있는 중복을 제거해 달란 소리 DISTINCT 중복 제거
SELECT DISTINCT deptno FROM emp;



-- 별칭 alais : AS
SELECT empno AS 사원번호 FROM emp;
SELECT ename, sal, sal*12+comm, comm FROM emp;
SELECT ename, sal, sal*12+comm AS 연봉, comm FROM emp;

-- 별칭을 공백을 넣고 싶다면 쌍따옴표를 사용
SELECT ename AS 사원이름 , job as "직 책" FROM emp;

-- order by : 정렬하여 조회
-- 하나의 열로 기준을 주어 오름차순(ASC) 조회
SELECT ename,sal FROM emp ORDER BY sal; -- 작은 것부터 순서대로 정리하여 조회(오름차순)
-- 내림차순
SELECT ename,sal FROM emp ORDER BY sal DESC;

--전체 데이터를 조회(사원번호 오름차순으로)
-- 전체 데이터니까 * 이거 사용 
SELECT * FROM emp ORDER BY empno;

-- 부서 번호의 오름차순이고 부서번호가 동일하다면 급여의 내림차순
SELECT * FROM emp ORDER BY deptno ASC, sal DESC;

-- 조회할 테이블은 emp 테이블이며 모든열을 출력한다.
-- 출력되는 열의 별칭은 다음과 같이 지정한다.
-- 아래와 같음
-- 부서번호를 기준으로 내림차순으로 정렬하되 부서번호가 같다면 사원이름을 기준으로 
-- 오름차순으로 정렬한다
SELECT empno As EMPLOYEE_NO,ename As EMPLOYEE_NAME, mgr As MANAGER,
        hiredate, sal As SALARY, comm As COMMISSION, deptno As DEPARTMENT_NO
FROM emp ORDER BY deptno DESC, ename ASC; -- 모든 열을 출력하니까 hiredate도 

-- where : 조회를 할 때 기준 주기

-- 부서번호가 30번인 사원들을 조회
SELECT * FROM emp WHERE deptno = 30;

-- 사원번호가 7782인 사원 조회
SELECT * FROM emp WHERE empno = 7782;

-- 부서번호가 30이고 사원의 직책이 salseman인 사원 조회
SELECT * FROM emp WHERE deptno=30 AND job='SALESMAN';

--사원번호가 7499이고 부서번호가 30인 정보 조회
SELECT * FROM emp WHERE empno=7499 AND deptno=30;

--부서번호가 30이거나 사원직책이 clerk 정보조회
SELECT * FROM emp WHERE  deptno=30 OR job='clerk';

--부서번호가 20이거나 사원직책이 salesman 정보조회
SELECT * FROM emp WHERE  deptno=20 OR job='salesman';


-- ==========================연산자 =========================
-- 산술 :sal*12 한 금액이 36000인 데이터 조회
SELECT * FROM emp WHERE sal*12 = 36000; 

-- 관계 : =, <, >, >=,<=
SELECT * FROM emp WHERE sal>3000; 
SELECT * FROM emp WHERE sal>=3000;

-- F보다 뒤에 있는 이름들 
SELECT * FROM emp WHERE ename >= 'F';

-- 논리연산자 : AND OR 

-- 급여가 2500이상이고 직업이 ANALYST인 사원 정보 조회
SELECT * FROM emp WHERE sal>=2500 AND job='ANALYST';

-- 직무가 MANAGER, SALESMAN,CLERK인 사원 정보 조회
SELECT * FROM emp WHERE job='MANAGER' OR job='SALESMAN' OR job='CLERK'; 
-- job='MANAGER' OR job='SALESMAN' OR job='CLERK' - 다르게도 가능

-- 등가 연산자 : 양쪽 항목이 같은지 검사 

-- sal이 3000이 아닌 사원정보 출력
SELECT * FROM emp WHERE sal != 3000;
SELECT * FROM emp WHERE sal <> 3000;
SELECT * FROM emp WHERE sal ^= 3000;

-- in 연산자

-- 위에 OR 쓴거 
SELECT * FROM emp WHERE job IN ('CLERK','MANAGER','SALESMAN'); 

SELECT * FROM emp WHERE job!='MANAGER' AND job!='SALESMAN' AND job!='CLERK'; 
-- => 바꾸기 위와 아래 둘다 같은 거임 (아닌거)
SELECT * FROM emp WHERE job NOT IN ('CLERK','MANAGER','SALESMAN'); 

--IN 을 사용해서 부서번호가 10,20번인 사원정보 조회
SELECT * FROM emp WHERE deptno IN (10,20); 







