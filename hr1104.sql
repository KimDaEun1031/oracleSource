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




