-- hr 계정이 가지고 있는 모든 테이블 보기
select * from tab;

-- employees 테이블 전체 내용 조회 안됨 테이블이 없어서
SELECT * FROM employees; 
-- employees 테이블의 first_name,last_name
SELECT first_name, last_name, job_id FROM employees;

-- 사원번호가 176인 사람의 last_name과 부서번호 조회
SELECT last_name, department_id FROM employees WHERE employee_id = 176; 

-- 연봉이 12000(>=) 이상되는 직원들의 last-name 및 연봉 조회
SELECT last_name, salary*12+commission_pct AS 연봉 FROM employees WHERE salary >= 12000;

-- 연봉이 5000에서 12000의 범위의 사람들의 last_name 및 연봉 조회
SELECT last_name, salary*12+commission_pct AS 연봉 FROM employees WHERE salary >= 5000 AND salary <= 12000;

-- 20번 및 50번 부서에서 근무하는 모든 사원들의 last_name 및 부서번호를 알파벳순으로 조회
SELECT last_name, department_id FROM employees WHERE department_id IN (20,50) ORDER BY last_name, department_id; 

-- 커미션을 버는 모든 사원들의 last_name, 연봉, 커미션, 조회 단, 연봉은 역순 및 커미션 역순
SELECT last_name, salary, commission_pct FROM employees where commission_pct != 0 ORDER BY salary DESC,commission_pct ASC; 

-- 연봉이 2500,3500,7000이 아니며 직업이 sa_rep나 st_clerk인 사람들 조회
SELECT * FROM employees WHERE salary NOT IN (2500,3500,7000) AND job_id IN ('SA_REP','ST_CLERK');

-- 2008/02/20 ~ 2008/05/01 사이에 고용된 사원들의 last_name,사원번호, 고용일자 조회
-- 단 고용일자 내림차순으로 정렬하여 출력
SELECT last_name, employee_id, hire_date FROM employees WHERE hire_date>'2008/02/20' AND hire_date<='2008/05/01' ORDER BY hire_date DESC;


-- 2004년도에 고용된 모든 사람들의 라스트 네임 및 고용일을 조회하여 입사일 기준으로 오름차순정렬하여 출력
SELECT last_name, hire_date FROM employees WHERE hire_date>='2004/01/01' AND hire_date<='2004/12/31' ORDER BY hire_date;

-- 연봉이 5000 에서 12000의 범위에 있고 20 혹은 50번 부서에 근무하는 사람들의 연봉을 조회하여 오름차순으로 조회
-- 라스트네임, SALARY
SELECT * 
FROM employees 
WHERE salary BETWEEN 5000 AND 12000 AND department_id IN (20,50) ORDER BY  last_name, salary;

-- 2004년도에 고용된 모든 사람들의 라스트네임 및 고용일을 조회하여 입사일 기준으로 오름차순으로 정렬하여 출력
SELECT last_name, hire_date 
FROM employees 
WHERE hire_date BETWEEN '2004/01/01' AND '2004/12/31' ORDER BY hire_date;

-- 연봉이 5000~12000 범위 이외의 사람들의 라스트네임, 셀러리를 조회
SELECT last_name, salary 
FROM employees 
WHERE salary NOT BETWEEN 5000 AND 12000;

-- 2004년도에 고용된 모든 사람들의 라스트 네임 및 고용일을 조회하여 입사일 기준으로 
-- 오름차순정렬하여 출력
SELECT last_name, hire_date 
FROM employees 
WHERE hire_date LIKE '04%' ORDER BY hire_date;

-- 라스트 네임 에 u가 포함되는 사원들의 사원번호 및 라스트네임 조회 
SELECT employee_id, last_name 
FROM employees 
WHERE last_name LIKE '%u%'

-- 라스트 네임에 네번째 글자가 a인 사람들 라스트 네임 조회

SELECT last_name 
FROM employees 
WHERE last_name LIKE '___a%'

-- 라스트 네임에 a 혹은 e 글자가 있는 사원들의 라스트 네임을 조회하여
-- 라스트 네임기준으로 오름차순 정렬
SELECT last_name 
FROM employees 
WHERE last_name LIKE '%a%' or last_name LIKE '%e%' ORDER BY last_name;

-- 라스트 네임에 a 혹은 e 글자가 있는 사원들의 라스트 네임을 조회하여
-- 라스트 네임기준으로 오름차순 정렬
SELECT last_name 
FROM employees 
WHERE last_name LIKE '%a%''%e%' OR last_name LIKE '%a%e%' ORDER BY last_name;

-- IS NULL 연습
SELECT * FROM employees;
-- 매니저가 없는 사람들의 라스트네임 , 잡 조회
SELECT last_name, job_id 
FROM employees 
WHERE manager_id IS NULL;
 
-- st_clerk 인 잡을 가진 사원이 없는 부서 조회 부서번호가 null인값 제외
SELECT DISTINCT department_id 
FROM employees 
WHERE job_id != 'ST_CLERK' AND department_id IS NOT NULL;
   -- !=  :   NOT IN('ST_CLERK')

-- 커미션이 null이 아닌 사원들 중에서 커미션 = 셀러리 * 커미션을 구하여 
-- 사원번호, 퍼스트네임, 잡과 같이 조회
SELECT employee_id, first_name, job_id, commission_pct*salary AS commission_pct
FROM employees 
WHERE commission_pct IS NOT null;

-- 문자열 함수 실습 
-- 1. 퍼스트 네임이 curtis인 사람의 퍼스트 네임 라스트 네임 이메일 폰넘버 잡을 조회
-- 단 잡의 결과는 소문자로
SELECT first_name, last_name, email, phone_number, LOWER(job_id) 
FROM employees
WHERE first_name = 'Curtis'; 

-- 2. 부서번호가 60 70 80 90인 사람들의 employee, 퍼스트 네임, 고용일자, 잡을 조회
-- 단 잡은 it_prog인 사원의 경우 프로그래머로 변경하여 출력
SELECT employee_id ,first_name, hire_date , REPLACE(job_id,'IT_PROG', '프로그래머')
FROM employees
WHERE department_id IN(60,70,80,90); 


--3. 잡이 ad_pres pu_clerk인 사원들의 employee, 퍼스트 네임 라스트 네임 
-- department 잡을 조회하시오 단 사원명은 퍼스트와 라스트를 이어서 출력
SELECT employee_id ,CONCAT(first_name,CONCAT(' ' ,last_name)), department_id , job_id
FROM employees
WHERE job_id IN ('AD_PRES','PU_CLERK'); 

















