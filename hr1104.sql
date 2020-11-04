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
SELECT last_name, salary, commission_pct FROM employees ORDER BY salary DESC,commission_pct ASC; 

-- ������ 2500,3500,7000�� �ƴϸ� ������ sa_rep�� st_clerk�� ����� ��ȸ
SELECT * FROM employees WHERE salary NOT IN (2500,3500,7000) AND job_id IN ('SA_REP','ST_CLERK');

-- 2008/02/20 ~ 2008/05/01 ���̿� ���� ������� last_name,�����ȣ, ������� ��ȸ
-- �� ������� ������������ �����Ͽ� ���
SELECT last_name, employee_id, hire_date FROM employees WHERE hire_date>'2008/02/20' AND hire_date<='2008/05/01' ORDER BY hire_date DESC;


-- 2004�⵵�� ���� ��� ������� ��Ʈ ���� �� ������� ��ȸ�Ͽ� �Ի��� �������� �������������Ͽ� ���
SELECT last_name, hire_date FROM employees WHERE hire_date>='2004/01/01' AND hire_date<='2004/12/31' ORDER BY hire_date ASC;

