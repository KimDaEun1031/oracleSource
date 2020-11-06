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

-- =========================== 오라클 함수 ==========================

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
SELECT REPLACE('이것이 oracle이다','이것이','This is')
FROM dual;

SELECT '010-1234-1234' AS REPLACE_BEFFORE, 
       REPLACE('010-1234-1234', '-', ' ') AS REPLACE_1,
       REPLACE('010-1234-1234', '-') AS REPLACE_2
FROM dual;

-- 문자열 함수 : commcat(문자열 연결)
SELECT CONCAT(empno,ename),  CONCAT(empno,CONCAT(':',ename))
FROM emp
WHERE ename='SCOTT';

-- || 연결의 의미로 사용

SELECT empno || ename, empno || ':' || ename
FROM emp
WHERE ename='SCOTT';

-- 문자열 함수 : TRIM(공백제거), LTRIM(왼쪽 공백 제거), RTRIM(오른쪽 공백 제거)
SELECT '    이것이     ', TRIM('    이것이     ')
FROM dual;
-- LEADING : 왼쪽에 있는 글자 지우기 / TRAILING : 오른쪽에 있는 글자 지우기
-- BOTH : 양쪽에 있는 글자 지우기
SELECT TRIM(LEADING FROM '__ORACLE__') AS TRIM_LEADING,
       TRIM(TRAILING FROM '__ORACLE__') AS TRIM_TRAILING,
       TRIM(BOTH FROM '__ORACLE__') AS TRIM_BOTH,
FROM dual;

-- 문자열 함수 : REVERSE(거꾸로)
SELECT REVERSE('Oracle') FROM dual;


-- 2. 숫자함수 : ROUND, TRUNC, CEIL, FLOOR, MOD
-- ROUND : 반올림 / TRUNC : 버림 / CEIL : 입력된 숫자와 가까운 큰 정수
-- FLOOR : 입력된 숫자와 가까운 작은 정수 / MOD : 나머지

SELECT ROUND(1234.5678) AS ROUND,
       ROUND(1234.5678,0) AS ROUND_1,
       ROUND(1234.5678,1) AS ROUND_2,
       ROUND(1234.5678,-1) AS ROUND_MINUS,
       ROUND(1234.5678,-2) AS ROUND_MINUS2
FROM dual;


SELECT TRUNC(1234.5678) AS TRUNC,
       TRUNC(1234.5678,0) AS TRUNC_1,
       TRUNC(1234.5678,1) AS TRUNC_1,
       TRUNC(1234.5678,-1) AS TRUNC_MINUS,
       TRUNC(1234.5678,-2) AS TRUNC_MINUS2
FROM dual;

SELECT CEIL(3.14), FLOOR(3.14), CEIL(-3.14), FLOOR(-3.14)
FROM dual;

SELECT MOD(15,6), MOD(10,2), MOD(11,2) FROM dual;

-- 날짜 함수 : SYSDATE(가장높은사용률), CURRENT_DATE, CURRENT_TIMESTAMP
-- sysdate를 많이 사용하는 이유 : 회원가입 업무를 만약에 맡았다면 다른사람이 가입을 했을 때
-- 가입한 그 날짜가 떠야돼기에

SELECT SYSDATE, CURRENT_DATE, CURRENT_TIMESTAMP FROM dual;

-- 날짜데이터는 연산이 가능함 : 날짜 데이터 +1 /-1, 날짜데이터 - 날짜데이터 
-- 날짜 + 날짜 는 안됨

SELECT SYSDATE AS NOW, SYSDATE-1 AS YESTERDAY, SYSDATE+1 AS TOMORROW
FROM DUAL;

-- 날짜 함수 : ADD_MONTHS
SELECT SYSDATE, ADD_MONTHS(SYSDATE,4) FROM DUAL;

-- 입사 10주년이 되는 사원들 조회hr

SELECT empno, ename, hiredate, ADD_MONTHS(hiredate,120) FROM emp;

-- 입사 38년 미만인 사원 조회
SELECT * FROM emp WHERE ADD_MONTHS(hiredate,456) > SYSDATE;

-- 날짜함수 : MONTHS_BETWEEN(두 날짜 사이의 차이)
SELECT * FROM emp WHERE MONTHS_BETWEEN(SYSDATE, HIREDATE) < 456;

SELECT empno, ename, hiredate, SYSDATE,MONTHS_BETWEEN(hiredate,SYSDATE) AS MONTH1,
MONTHS_BETWEEN(SYSDATE,hiredate) AS MONTH2, TRUNC(MONTHS_BETWEEN(SYSDATE,hiredate))
FROM emp;

--날짜 함수 : NEXT_DAY (오늘을 기준으로 가장 가까운 날) 
        --   LAST_DAY (위에 날을 기준으로 마지막 날)
SELECT SYSDATE,NEXT_DAY(SYSDATE,'월요일'),LAST_DAY(SYSDATE)
FROM dual;

-- 형변환 함수 :  TO_CHAR(날짜,숫자를 문자로)
--              TO_NUMBER(문자를 숫자로)
--              TO_DATE(문자를 날짜로 변환)
-- 앞에 BAR가 붙으면 가변형 문자라는 뜻 EX) TO_BARCHAR..

SELECT to_char(SYSDATE,'YYYY/MM/DD') AS 현재날짜 FROM DUAL;
SELECT to_char(SYSDATE,'MM') AS 현재날짜 FROM DUAL;
SELECT to_char(SYSDATE,'MON') AS 현재날짜 FROM DUAL; --월이라고 붙음
SELECT to_char(SYSDATE,'DD') AS 현재날짜 FROM DUAL;
SELECT to_char(SYSDATE,'DAY') AS 현재날짜 FROM DUAL;
SELECT to_char(SYSDATE,'HH:MI:SS') AS 현재시간 FROM DUAL;
SELECT to_char(SYSDATE,'HH12:MI:SS') AS 현재시간 FROM DUAL;
SELECT to_char(SYSDATE,'HH24:MI:SS') AS 현재시간 FROM DUAL;
SELECT to_char(SYSDATE,'HH:MI:SS PM') AS 현재시간 FROM DUAL;

-- 오늘 날짜를 년, 월, 일 16:51:45 표현
SELECT to_char(SYSDATE,'YYYY/MM/DD HH24:MI:SS') AS 현재날짜시간 FROM DUAL;

SELECT TO_NUMBER('1,300,000','999,999,999') - TO_NUMBER('1,300','999,999') FROM dual;
-- 9,0 (숫자 한 자리를 의미), 9 = 빈자리를 채우지 않는 형태, 0 빈자리를 채우는 형태

SELECT SAL, TO_CHAR(SAL, '$999,999') AS SAL_$,
       TO_CHAR(SAL, 'L999,999') AS SAL_L,
        TO_CHAR(SAL, '$999,999.00') AS SAL_1, 
        TO_CHAR(SAL, '$000,999,999.00') AS SAL_2,
        TO_CHAR(SAL, '$000999999.99') AS SAL_3,
        TO_CHAR(SAL, '999,999.00') AS SAL_4
FROM emp;

SELECT TO_DATE('2020-11-05','YYYY/MM/DD') AS TODATE1,
       TO_DATE('20201105','YYYY-MM-DD') AS TODATE2 FROM DUAL;
       
-- 1981년 6월 1일 이후에 입사한 사원정보 조회
SELECT * 
FROM emp 
WHERE hiredate > TO_DATE('1981-06-01','YYYY/MM/DD');

SELECT TO_DATE('2O19-12-20')-TO_DATE('2019-10-20') FROM emp;

-- 널처리 함수 : NVL / NVL2 
SELECT empno, ename, sal, comm, sal+comm FROM emp;

SELECT empno, ename, sal, comm, sal+comm, NVL(comm,0), sal+NVL(comm,0)
FROM emp;

SELECT empno, ename, sal, comm, sal+comm,NVL2(comm,'O','X'), sal+NVL2(comm,sal*12+comm,sal*12) AS annsal
FROM emp; 
--NVL2는 널이 아닐 경우도 처리 가능

-- DECODE 함수 AND CASE문
-- JOB이 매니저인 경우, 세일즈맨인 경우, 어널리스트의 경우 각각의 다른 비율을 적용하고 싶다면?

SELECT empno, ename, job, sal, DECODE(job,
                                    'MANAGER', SAL*1.1,
                                    'SALESMAN', SAL*1.05,
                                    'ANALYST', SAL,
                                    SAL*1.03) AS UPSAL
FROM emp;

SELECT empno, ename, job, sal, CASE job
                                    WHEN  'MANAGER' THEN SAL*1.1
                                    WHEN  'SALESMAN' THEN SAL*1.05
                                    WHEN  'ANALYST' THEN SAL
                                    ELSE   SAL*1.03 
                               END AS UPSAL
FROM emp;

-- DECODE문과 CASE문 중 많이 쓰이는 것은... 둘다 잘 안씀 / 코딩을 하니까

SELECT empno,ename,job,sal, CASE
                                WHEN comm IS NULL THEN '해당사항없음'
                                WHEN comm=0 THEN '수당없음'
                                WHEN comm>0 THEN '수당'
                            END AS COMM_TEXT FROM emp;
                            
-- ========= 함수 실습 ===========                           

-- 사원들의 월 평균 근무 일수는 21.5일이다. 하루 근무 8시간으로 보았을 때 사원들의
-- 하루 급여(day_pay)와 시급(time_pay)를 계산하여 결과 출력
-- 단, 하루 급여는 소수점 셋째 자리에서 버리고, 시급은 두번째 소수점에서 반올림

SELECT empno, ename, sal , TRUNC ((sal/21.5),2) AS DAY_PAY, 
                           ROUND ((sal/21.5/8),1) AS TIME_PAY
FROM emp;


-- 사원들은 입사일을 기준으로 3개월이 지난 후 첫 월요일에 정직원이 된다.
-- 사원들의 정직원이 되는 날짜(r_job)을 YYYY-MM-DD형식으로 출력
-- 단 추가수당(COMM)이 없는 사원의 추가 수당은 N/A로 출력
SELECT empno, ename, hiredate ,NEXT_DAY(ADD_MONTHS(hiredate,3),'월요일') AS r_job,
      NVL(TO_CHAR(comm),'N/A') AS COMM
FROM emp;


-- 모든 사월을 대상으로 직속 상관의 사원번호를 다음 조건을 기준으로 변환하여 CHG_MGR열에 출력
-- 사원번호가 존재하지 않을 경우 : 0000 / 앞 두자리가 75일 경우 : 5555 / 76일 경우 : 6666
-- 77일 경우 : 7777 / 78일 경우 : 8888 / 그외는 그대로 출력
SELECT SUBSTR(TO_CHAR(mgr),1,2) FROM emp;

SELECT empno, ename, mgr,
            DECODE(SUBSTR(TO_CHAR(mgr),1,2),
                'null','0000',
                '75','5555',
                '76','6666',
                '77','7777',
                '78','8888',
                TO_CHAR(mgr))
FROM emp;

SELECT empno, ename, mgr,  CASE
                                WHEN mgr IS NULL THEN '0000'
                                WHEN substr(mgr,1,2)=75 THEN '5555'  
                                WHEN substr(mgr,1,2)=76 THEN '6666'  
                                WHEN substr(mgr,1,2)=77 THEN '7777'  
                                WHEN substr(mgr,1,2)=78 THEN '8888'
                                ELSE TO_CHAR(mgr)
                            END AS CHG_MGR FROM emp;



