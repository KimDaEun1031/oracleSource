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


-- between A and b

-- 급여가 2000이상 3000이하인 사원정보 조회
SELECT * FROM emp WHERE sal>=2000 AND sal<=3000;
SELECT * FROM emp WHERE sal BETWEEN 2000 AND 3000;

-- 급여가 2000 이하 3000 이하가 아닌 사원 정보 조회
SELECT * FROM emp WHERE sal NOT BETWEEN 2000 AND 3000;

-- like : 문자열 검색을 할 때 사용(s로 시작하는 ~~ / h로 끝나는 ~~ /가운데에 t가 있다면~~)
-- %가 뒤에 붙으면 ~로 시작하는 %가 글자 사이에(%s%)이런식으로 붙으면 가운데에 ~이 있는
-- %가 앞에 붙으면 ~로 끝나는 것을 의미 /  _(언더바)를 쓰면 하나당 한자리

-- 사원 이름이 s로 시작하는 모든 사원정보 출력
SELECT * FROM emp WHERE ename LIKE 'S%';

-- 사원 이름이 두번째 글자 L인 사원만 조회
SELECT * FROM emp WHERE ename LIKE '_L%'

-- 사원 이름에 AM이 포함되어 있는 사원만 조회
SELECT * FROM emp WHERE ename LIKE '%AM%'
-- 사원 이름에 AM이 포함되어 있지 않은 사원만 조회
SELECT * FROM emp WHERE ename NOT LIKE '%AM%'


-- IS NULL
-- SELECT * FROM emp WHERE comm = null; 안됨
SELECT * FROM emp WHERE comm IS null;

-- MGR이 NULL 인 사원정보 조회
SELECT * FROM emp WHERE mgr IS null;
-- MGR이 NULL 아닌 사원정보 조회
SELECT * FROM emp WHERE mgr IS NOT null;

-- 집합 연산자 : 합집합(UNION), 교집합(INTERSECT) , 차집합(MINUS)

-- DEPTNO가 10인 테이블과 DEPTNO가 20인 결과를 구해서 합해서 조회
SELECT empno, ename, sal, deptno FROM emp WHERE deptno =10
UNION
SELECT empno, ename, sal, deptno FROM emp WHERE deptno =20;

SELECT empno, ename, sal, deptno FROM emp WHERE deptno =10
UNION ALL
SELECT empno, ename, sal, deptno FROM emp WHERE deptno =10;
-- 합집합 때 값이 같다면 중복은 제거 후 결과 출력 : 이 때 ALL을 붙이면 다 나옴

-- 부서번호가 10이 아닌 사원들의 정보 조회
SELECT * FROM emp 
MINUS 
SELECT * FROM emp WHERE deptno=10;

-- 부서번호가 10인 사원 정보를 조회
SELECT * FROM emp 
INTERSECT
SELECT * FROM emp WHERE deptno=10;

-- 20번 30번 부서에 근부하고 있는 사원 중 SAL이 2000초과인 사원을 다음 두가지
-- 방식의 SELECT 문을 사용하여 사원번호 이름 급여 부서번호를 출력하는  SQL문 작성

-- 집합 연산자 사용 안하는 방식
SELECT empno, ename, sal, deptno 
FROM emp 
WHERE sal>2000 AND deptno IN (20,30);

-- 집합 연산자를 사용하는 방식
SELECT empno, ename, sal, deptno FROM emp WHERE sal>2000 
INTERSECT
SELECT empno, ename, sal, deptno FROM emp WHERE deptno IN (20,30);

-- 이런식으로도 가능
SELECT empno, ename, sal, deptno 
FROM emp 
WHERE sal>2000 
MINUS
SELECT empno, ename, sal, deptno 
FROM emp 
WHERE deptno=10;


SELECT empno, ename, sal, deptno 
FROM emp 
WHERE sal>2000 AND deptno=20
UNION
SELECT empno, ename, sal, deptno 
FROM emp 
WHERE sal>2000 AND deptno=30;

-- 오라클 함수  
-- 1. 문자 함수 : upper, lower , initcap, LENGTH, LENGTHB
-- upper : 대문자 변경 / lower : 소문자 변경 / initcap : 처음만 대문자

-- ENAME을 UPPER와 LOWER, INITCAP으로 변환하여 조회
SELECT ename, UPPER(ename), LOWER(ename), INITCAP(ename) 
FROM emp;

-- LENGTH : 문자열 길이 / LENGTHB : 문자열 길이(b = 바이트크기)
SELECT LENGTH('한글'), LENGTHB('한글') FROM dual;
--dual 테이블  : sys가 소유하고 있는 테이블로 임시연산과 함수의 결과값을 확인하는 용도

-- 직책이 6글자 이상인 사원들의 정보 추출
SELECT * FROM emp WHERE LENGTH(job) >= 6;

-- 문자열 함수 : substr(문자열 데이터, 시작위치, 추출길이)
SELECT job, substr(job,1,2), substr(job,3,2), substr(job,5) FROM emp;

--   -LENGTH(job) = -5 출력할 땐 마이너스로도 가능하다
-- 두번째엔 -5부터시작 2번째 까지 니까 -5,-4 2개 출력해서 cl이 나온거

SELECT job, substr(job, -LENGTH(job)), substr(job, -LENGTH(job),2), substr(job,-3)
FROM emp;

-- 문자열 함수 : INSTR(특정 문자 위치 찾기)
SELECT INSTR('HELLO, ORACLE!', 'L') AS INSTR_1,
       INSTR('HELLO, ORACLE!', 'L',5) AS INSTR_2,
       INSTR('HELLO, ORACLE!', 'L',2,2) AS INSTR_3
FROM dual;

-- 문자열 함수 : REPLACE(문자 찾아서 바꾸기)
SELECT 


FROM 

