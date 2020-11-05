-- hr ������ ������ �ִ� ��� ���̺� ����
select * from tab;

-- employees ���̺� ��ü ���� ��ȸ �ȵ� ���̺��� ���
SELECT * FROM employees; 
-- employees ���̺��� first_name,last_name
SELECT first_name, last_name, job_id FROM employees;

-- �����ȣ�� 176�� ����� last_name�� �μ���ȣ ��ȸ
SELECT last_name, department_id FROM employees WHERE employee_id = 176; 

-- ������ 12000(>=) �̻�Ǵ� �������� last-name �� ���� ��ȸ
SELECT last_name, salary*12+commission_pct AS ���� FROM employees WHERE salary >= 12000;

-- ������ 5000���� 12000�� ������ ������� last_name �� ���� ��ȸ
SELECT last_name, salary*12+commission_pct AS ���� FROM employees WHERE salary >= 5000 AND salary <= 12000;

-- 20�� �� 50�� �μ����� �ٹ��ϴ� ��� ������� last_name �� �μ���ȣ�� ���ĺ������� ��ȸ
SELECT last_name, department_id FROM employees WHERE department_id IN (20,50) ORDER BY last_name, department_id; 

-- Ŀ�̼��� ���� ��� ������� last_name, ����, Ŀ�̼�, ��ȸ ��, ������ ���� �� Ŀ�̼� ����
SELECT last_name, salary, commission_pct FROM employees where commission_pct != 0 ORDER BY salary DESC,commission_pct ASC; 

-- ������ 2500,3500,7000�� �ƴϸ� ������ sa_rep�� st_clerk�� ����� ��ȸ
SELECT * FROM employees WHERE salary NOT IN (2500,3500,7000) AND job_id IN ('SA_REP','ST_CLERK');

-- 2008/02/20 ~ 2008/05/01 ���̿� ���� ������� last_name,�����ȣ, ������� ��ȸ
-- �� ������� ������������ �����Ͽ� ���
SELECT last_name, employee_id, hire_date FROM employees WHERE hire_date>'2008/02/20' AND hire_date<='2008/05/01' ORDER BY hire_date DESC;


-- 2004�⵵�� ���� ��� ������� ��Ʈ ���� �� ������� ��ȸ�Ͽ� �Ի��� �������� �������������Ͽ� ���
SELECT last_name, hire_date FROM employees WHERE hire_date>='2004/01/01' AND hire_date<='2004/12/31' ORDER BY hire_date;

-- ������ 5000 ���� 12000�� ������ �ְ� 20 Ȥ�� 50�� �μ��� �ٹ��ϴ� ������� ������ ��ȸ�Ͽ� ������������ ��ȸ
-- ��Ʈ����, SALARY
SELECT * 
FROM employees 
WHERE salary BETWEEN 5000 AND 12000 AND department_id IN (20,50) ORDER BY  last_name, salary;

-- 2004�⵵�� ���� ��� ������� ��Ʈ���� �� ������� ��ȸ�Ͽ� �Ի��� �������� ������������ �����Ͽ� ���
SELECT last_name, hire_date 
FROM employees 
WHERE hire_date BETWEEN '2004/01/01' AND '2004/12/31' ORDER BY hire_date;

-- ������ 5000~12000 ���� �̿��� ������� ��Ʈ����, �������� ��ȸ
SELECT last_name, salary 
FROM employees 
WHERE salary NOT BETWEEN 5000 AND 12000;

-- 2004�⵵�� ���� ��� ������� ��Ʈ ���� �� ������� ��ȸ�Ͽ� �Ի��� �������� 
-- �������������Ͽ� ���
SELECT last_name, hire_date 
FROM employees 
WHERE hire_date LIKE '04%' ORDER BY hire_date;

-- ��Ʈ ���� �� u�� ���ԵǴ� ������� �����ȣ �� ��Ʈ���� ��ȸ 
SELECT employee_id, last_name 
FROM employees 
WHERE last_name LIKE '%u%'

-- ��Ʈ ���ӿ� �׹�° ���ڰ� a�� ����� ��Ʈ ���� ��ȸ

SELECT last_name 
FROM employees 
WHERE last_name LIKE '___a%'

-- ��Ʈ ���ӿ� a Ȥ�� e ���ڰ� �ִ� ������� ��Ʈ ������ ��ȸ�Ͽ�
-- ��Ʈ ���ӱ������� �������� ����
SELECT last_name 
FROM employees 
WHERE last_name LIKE '%a%' or last_name LIKE '%e%' ORDER BY last_name;

-- ��Ʈ ���ӿ� a Ȥ�� e ���ڰ� �ִ� ������� ��Ʈ ������ ��ȸ�Ͽ�
-- ��Ʈ ���ӱ������� �������� ����
SELECT last_name 
FROM employees 
WHERE last_name LIKE '%a%''%e%' OR last_name LIKE '%a%e%' ORDER BY last_name;

-- IS NULL ����
SELECT * FROM employees;
-- �Ŵ����� ���� ������� ��Ʈ���� , �� ��ȸ
SELECT last_name, job_id 
FROM employees 
WHERE manager_id IS NULL;
 
-- st_clerk �� ���� ���� ����� ���� �μ� ��ȸ �μ���ȣ�� null�ΰ� ����
SELECT DISTINCT department_id 
FROM employees 
WHERE job_id != 'ST_CLERK' AND department_id IS NOT NULL;
   -- !=  :   NOT IN('ST_CLERK')

-- Ŀ�̼��� null�� �ƴ� ����� �߿��� Ŀ�̼� = ������ * Ŀ�̼��� ���Ͽ� 
-- �����ȣ, �۽�Ʈ����, ��� ���� ��ȸ
SELECT employee_id, first_name, job_id, commission_pct*salary AS commission_pct
FROM employees 
WHERE commission_pct IS NOT null;

-- ���ڿ� �Լ� �ǽ� 
-- 1. �۽�Ʈ ������ curtis�� ����� �۽�Ʈ ���� ��Ʈ ���� �̸��� ���ѹ� ���� ��ȸ
-- �� ���� ����� �ҹ��ڷ�
SELECT first_name, last_name, email, phone_number, LOWER(job_id) 
FROM employees
WHERE first_name = 'Curtis'; 

-- 2. �μ���ȣ�� 60 70 80 90�� ������� employee, �۽�Ʈ ����, �������, ���� ��ȸ
-- �� ���� it_prog�� ����� ��� ���α׷��ӷ� �����Ͽ� ���
SELECT employee_id ,first_name, hire_date , REPLACE(job_id,'IT_PROG', '���α׷���')
FROM employees
WHERE department_id IN(60,70,80,90); 


--3. ���� ad_pres pu_clerk�� ������� employee, �۽�Ʈ ���� ��Ʈ ���� 
-- department ���� ��ȸ�Ͻÿ� �� ������� �۽�Ʈ�� ��Ʈ�� �̾ ���
SELECT employee_id ,CONCAT(first_name,CONCAT(' ' ,last_name)), department_id , job_id
FROM employees
WHERE job_id IN ('AD_PRES','PU_CLERK'); 

















