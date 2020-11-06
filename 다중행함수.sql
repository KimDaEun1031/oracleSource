
-- ������ �Լ� : SUM / COUNT / MAX / MIN / AVG
-- ���� ���� �������� �ϳ��� ������� �����س��� ���� �Լ�

-- SUM : �հ�
-- SELECT ename, SUM(sal) FROM emp; ����
-- ename�� ��⿡ ename�� ���� �� �۵���

SELECT SUM(sal), SUM(DISTINCT sal), SUM(ALL sal) FROM emp;
-- distinct�� �ߺ� �����̱⶧���� sal�� �� �� ���� ���� �ִٸ� ���� �� ���Ѵ�.

-- count : ����
SELECT COUNT(*) FROM emp;
-- EMP�� �� ���� �����Ͱ� �� �ֳ���? 14���� �������

--�μ� ��ȣ�� 30���� ���� �� ���ϱ�
SELECT COUNT(*) FROM emp WHERE depno=30;

-- MAX(�ִ밪), MIN(�ּڰ�)
SELECT MAX(SAL), MIN(SAL) FROM emp;

-- �μ� ��ȣ 20�� ����� �Ի��� �� ���� �ֱ� �Ի��� ���ϱ�
SELECT MAX(hiredate) FROM emp WHERE deptno=20;

-- AVG : ���
SELECT AVG(SAL) FROM emp;
SELECT AVG(SAL) FROM emp WHERE deptno=30;
SELECT AVG(DISTINCT SAL) FROM emp;
