-- scott ������ ������ �ִ� ��� ���̺� ����
select * from tab;

-- DESC�� ��ũ ���̺귯���� ���� / EMP ���̺��� ����
-- �̸� : EMP�� �ʵ� �κ� /���� : �ڹ��� Ÿ�԰��� ����
-- number = int / varchar = ������ ���ڿ� Ÿ�� = string���� ������ �� 
-- (7) ���� �ȿ� ���ڴ� �ڸ��� �ε� ����(7,2)��� 7�ڸ� ���� 2...
DESC emp;

-- emp ���̺��� ��� ���� ��ȸ
SELECT * FROM emp;

-- emp ���̺��� Ư�� �ʵ常 ��ȸ
SELECT ename, job, sal FROM emp;

-- �ߺ� ���ڵ� ������ �� ��ȸ
-- deptno�� �ִ� �ߺ��� ������ �޶� �Ҹ� DISTINCT �ߺ� ����
SELECT DISTINCT deptno FROM emp;



-- ��Ī alais : AS
SELECT empno AS �����ȣ FROM emp;
SELECT ename, sal, sal*12+comm, comm FROM emp;
SELECT ename, sal, sal*12+comm AS ����, comm FROM emp;

-- ��Ī�� ������ �ְ� �ʹٸ� �ֵ���ǥ�� ���
SELECT ename AS ����̸� , job as "�� å" FROM emp;

-- order by : �����Ͽ� ��ȸ
-- �ϳ��� ���� ������ �־� ��������(ASC) ��ȸ
SELECT ename,sal FROM emp ORDER BY sal; -- ���� �ͺ��� ������� �����Ͽ� ��ȸ(��������)
-- ��������
SELECT ename,sal FROM emp ORDER BY sal DESC;

--��ü �����͸� ��ȸ(�����ȣ ������������)
-- ��ü �����ʹϱ� * �̰� ��� 
SELECT * FROM emp ORDER BY empno;

-- �μ� ��ȣ�� ���������̰� �μ���ȣ�� �����ϴٸ� �޿��� ��������
SELECT * FROM emp ORDER BY deptno ASC, sal DESC;

-- ��ȸ�� ���̺��� emp ���̺��̸� ��翭�� ����Ѵ�.
-- ��µǴ� ���� ��Ī�� ������ ���� �����Ѵ�.
-- �Ʒ��� ����
-- �μ���ȣ�� �������� ������������ �����ϵ� �μ���ȣ�� ���ٸ� ����̸��� �������� 
-- ������������ �����Ѵ�
SELECT empno As EMPLOYEE_NO,ename As EMPLOYEE_NAME, mgr As MANAGER,
        hiredate, sal As SALARY, comm As COMMISSION, deptno As DEPARTMENT_NO
FROM emp ORDER BY deptno DESC, ename ASC; -- ��� ���� ����ϴϱ� hiredate�� 

-- where : ��ȸ�� �� �� ���� �ֱ�

-- �μ���ȣ�� 30���� ������� ��ȸ
SELECT * FROM emp WHERE deptno = 30;

-- �����ȣ�� 7782�� ��� ��ȸ
SELECT * FROM emp WHERE empno = 7782;

-- �μ���ȣ�� 30�̰� ����� ��å�� salseman�� ��� ��ȸ
SELECT * FROM emp WHERE deptno=30 AND job='SALESMAN';

--�����ȣ�� 7499�̰� �μ���ȣ�� 30�� ���� ��ȸ
SELECT * FROM emp WHERE empno=7499 AND deptno=30;

--�μ���ȣ�� 30�̰ų� �����å�� clerk ������ȸ
SELECT * FROM emp WHERE  deptno=30 OR job='clerk';

--�μ���ȣ�� 20�̰ų� �����å�� salesman ������ȸ
SELECT * FROM emp WHERE  deptno=20 OR job='salesman';


-- ==========================������ =========================
-- ��� :sal*12 �� �ݾ��� 36000�� ������ ��ȸ
SELECT * FROM emp WHERE sal*12 = 36000; 

-- ���� : =, <, >, >=,<=
SELECT * FROM emp WHERE sal>3000; 
SELECT * FROM emp WHERE sal>=3000;

-- F���� �ڿ� �ִ� �̸��� 
SELECT * FROM emp WHERE ename >= 'F';

-- �������� : AND OR 

-- �޿��� 2500�̻��̰� ������ ANALYST�� ��� ���� ��ȸ
SELECT * FROM emp WHERE sal>=2500 AND job='ANALYST';

-- ������ MANAGER, SALESMAN,CLERK�� ��� ���� ��ȸ
SELECT * FROM emp WHERE job='MANAGER' OR job='SALESMAN' OR job='CLERK'; 
-- job='MANAGER' OR job='SALESMAN' OR job='CLERK' - �ٸ��Ե� ����

-- � ������ : ���� �׸��� ������ �˻� 

-- sal�� 3000�� �ƴ� ������� ���
SELECT * FROM emp WHERE sal != 3000;
SELECT * FROM emp WHERE sal <> 3000;
SELECT * FROM emp WHERE sal ^= 3000;

-- in ������

-- ���� OR ���� 
SELECT * FROM emp WHERE job IN ('CLERK','MANAGER','SALESMAN'); 

SELECT * FROM emp WHERE job!='MANAGER' AND job!='SALESMAN' AND job!='CLERK'; 
-- => �ٲٱ� ���� �Ʒ� �Ѵ� ���� ���� (�ƴѰ�)
SELECT * FROM emp WHERE job NOT IN ('CLERK','MANAGER','SALESMAN'); 

--IN �� ����ؼ� �μ���ȣ�� 10,20���� ������� ��ȸ
SELECT * FROM emp WHERE deptno IN (10,20); 







