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


-- == �Լ� �ǽ� ==


-- �μ� 80�� �� ����� ���� ���밡���� ������ ǥ�� (PPT ����)
SELECT last_name, salary, CASE 
                                -- WHEN salary < 2000 THEN 0
                                -- WHEN (salary < 4000) THEN 0.09 ...
                                -- ... ELSE 0.45
                                WHEN salary BETWEEN 0 AND 1999 THEN salary*0
                                WHEN salary BETWEEN 2000 AND 3999 THEN 0.09
                                WHEN salary BETWEEN 4000 AND 5999 THEN 0.2
                                WHEN salary BETWEEN 6000 AND 7999 THEN 0.3
                                WHEN salary BETWEEN 8000 AND 9999 THEN 0.4
                                WHEN salary BETWEEN 10000 AND 11999 THEN 0.42
                                WHEN salary BETWEEN 12000 AND 13999 THEN 0.44
                                WHEN salary>14000 THEN 0.45                               
                                END AS TAX_RATE
FROM employees WHERE deparment_id=80;

SELECT last_name, salary, DECODE(TRUNC(salary/2000,0),
                         0,0.00,
                         1,0.09,
                         2,0.20,
                         3,0.30,
                         4,0.40,
                         5,0.42,
                         6,0.44,
                         0.45) AS TAX_RATE
FROM employees WHERE deparment_id=80;


--  ======= ������ �Լ� �ǽ� =====
-- ȸ�� ���� �ִ� ���� �� �ּ� ���� ���̸� ��ȸ
SELECT MAX(salary) - MIN(salary) FROM employees;

-- ST_CLERK�� �ٹ��ϴ� ������� �ο� �� ��ȸ
SELECT COUNT(*) FROM employees WHERE job_id='ST_CLERK';

-- �Ŵ����� �ٹ��ϴ� ������� �ο� �� ��ȸ
SELECT COUNT(DISTINCT manager_id) FROM employees;

-- ========= GROUP BY �ǽ� ===========
SELECT * FROM employees;
-- �μ��� �����Ǽ��� ���Ͽ� �μ���ȣ�� ������������ ���
SELECT department_id ,COUNT(employee_id) 
FROM employees 
GROUP BY department_id 
ORDER BY department_id;  
-- �μ��� �޿��� ��� ������ ����ϰ�, ��� ������ ������ ������
-- �μ���ȣ�� ������������ ����
SELECT ROUND(AVG(salary),0) 
FROM employees
GROUP BY department_id
ORDER BY department_id;

-- ������ ������ ���� ��� ���� ��ȸ
SELECT job_id, COUNT(employee_id)
FROM employees
GROUP BY job_id;

-- ================= JOIN �ǽ� ===================
SELECT * FROM tab;
SELECT * FROM EMPLOYEES;
SELECT * FROM locations;
SELECT * FROM departments;
SELECT * FROM emp_details_view;
SELECT * FROM job_history;


-- �ڽ��� ��� �Ŵ����� ����� ���� ���� �Ի��ڸ� ã�� �����, ��Ʈ����, MANAGER_ID�� ���
-- employees self join => 37��
SELECT E1.hire_date, E1.last_name, E1.hire_date AS �����Ի����Ի���,
       e1.manager_id, E2.hire_date AS ���Ŵ����Ի���
FROM employees E1 , employees E2 -- e1�� �� �Ŵ������� �Ի����� ���� �Ի��� / e2�� �� �Ŵ���
WHERE E1.manager_id = e2.employee_id AND e1.hire_date < e2.hire_date;

-- ���� �̸��� T�� �����ϴ� ������ ��� ������� ���, ��Ʈ����,�μ���ȣ ��ȸ
-- e.department_id = d. department_id �� d.location_id = l.location_id = 2��
SELECT e.employee_id, e.last_name, e.department_id
FROM employees E, departments D, locations L
WHERE e.department_id = d.department_id AND d.location_id = l.location_id AND l.city LIKE 'T%';
    

-- LOCATION_ID�� 1700�� ������ ������� ��Ʈ ����, DEPARTMENT_ID, SALARY ��ȸ - e,d  18��
SELECT E.LAST_NAME, E.DEPARTMENT_ID, E.SALARY
FROM  employees E INNER JOIN departments D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
WHERE LOCATION_ID = 1700;
 
-- DEPARTMENT_ID, LOCATION_ID, �� �μ��� �����, ���μ��� ��� ���� ��ȸ - e,d   11��
SELECT d.department_id, d.location_id, COUNT(employee_id), ROUND(AVG(salary))
FROM employees E INNER JOIN departments D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
GROUP BY  d.department_id, d.location_id;

-- executive �μ��� �ٹ��ϴ� ��� ������� department_id,last_name, job_id ��ȸ - em, d   3��
SELECT em.department_id, em.last_name, em.job_id
FROM emp_details_view EM INNER JOIN departments D
ON em.department_id = D.department_id AND D.department_id = 90;

-- ������ ������ ������ ������ �ִ� ������� ��� �� �� ��ȸ - em , j-h     10��  DISTINCT�� 7��
SELECT  em.employee_id, em.job_id
FROM emp_details_view EM, job_history JH
WHERE EM.employee_id(+) = JH.employee_id;

-- /* �� ����� �Ҽ� �μ����� �ڽź��� �ʰ� ���Ǿ����� ���� ���� ������ �޴�
-- ����� �����ϴ� ��� ������� LAST_NAME ��ȸ
-- (EMPLOYEES SELF JOIN)*/ 332��? / �ߺ����� �ص� ����.. / ���������� E1�� ��Ʈ����(�ߺ�����)�� ��ȸ�ϸ� 63��
SELECT DISTINCT e1.last_name --e1.department_id, e1.hire_date, e1.salary,
             --DISTINCT e2.last_name, e2.department_id, e2.hire_date, e2.salary
FROM employees E1, employees E2 -- e1�� �Ի����� �ʰ� ���� �� / e2�� ��
WHERE  e1.department_id = e2.department_id AND  e1.hire_date > e2.hire_date AND e1.salary > e2.salary;








