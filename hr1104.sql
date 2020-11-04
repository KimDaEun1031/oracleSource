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
SELECT last_name, salary, commission_pct FROM employees ORDER BY salary DESC,commission_pct ASC; 

-- 연봉이 2500,3500,7000이 아니며 직업이 sa_rep나 st_clerk인 사람들 조회
SELECT * FROM employees WHERE salary NOT IN (2500,3500,7000) AND job_id IN ('SA_REP','ST_CLERK');

-- 2008/02/20 ~ 2008/05/01 사이에 고용된 사원들의 last_name,사원번호, 고용일자 조회
-- 단 고용일자 내림차순으로 정렬하여 출력
SELECT last_name, employee_id, hire_date FROM employees WHERE hire_date>'2008/02/20' AND hire_date<='2008/05/01' ORDER BY hire_date DESC;


-- 2004년도에 고용된 모든 사람들의 라스트 네임 및 고용일을 조회하여 입사일 기준으로 오름차순정렬하여 출력
SELECT last_name, hire_date FROM employees WHERE hire_date>='2004/01/01' AND hire_date<='2004/12/31' ORDER BY hire_date ASC;

