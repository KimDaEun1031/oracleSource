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












