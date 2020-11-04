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




