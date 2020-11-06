
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

-- =============== GROUP BY / HAVING - GROUP BY  ================
-- GROUP BY : �׷��� (���� ����)�����ؼ� ������ �� FROM �ڿ� ��

-- �μ� ���� ���� ����� ���غ���
-- ���ݱ��� ��� �ɷ� �ߴٸ� �밡�ٰ� �ʼ������� �׷� ���̸� ���ٸ� �����ϰ� ����
SELECT deptno,AVG(SAL) 
FROM emp 
GROUP BY deptno;

-- �μ���ȣ �� �߰����� ��� ���ϱ�
SELECT deptno, AVG(COMM)
FROM emp 
GROUP BY deptno;

-- �μ���ȣ, ��å �� �޿� ��� ���ϱ�
SELECT deptno, AVG(SAL), job 
FROM emp 
GROUP BY deptno, job 
ORDER BY deptno, job;

-- ������ : group by ���� ���� �ȵǴ� ���� select�� ���� �ϸ� �ȵ�
-- ename ������ ����
-- SELECT ename, deptno, AVG(sal)
SELECT deptno, AVG(sal)
FROM emp
GROUP BY deptno;


-- HAVING GROUP BY
-- �׷� ���� ��� ���� / ������ �� ���
-- �׷��� ������ WHERE �ȴ� ������

-- �� �μ��� ���Ѻ� ��� �޿��� ���� �� �� ��� �޿��� 2000�� �̻��� �׷츸
SELECT AVG(SAL), deptno, job
FROM emp
GROUP BY job, deptno
HAVING AVG(sal)>=2000
ORDER BY deptno,job;

-- EMP ���̺��� �μ��� ��å�� ��� �޿��� 500�̻��� �������
-- �μ���ȣ, ��å, �μ��� ��å�� ��� �޿� ���
SELECT  AVG(sal), deptno, job
FROM emp
GROUP BY deptno, job HAVING AVG(sal) >= 500;
-- ; �̰� �� �ٿ��� �Ǳ� �Ǵµ� �� ��?

-- EMP ���̺��� �μ��� ��å�� ��� �޿��� 2000�̻��̰� 3000���� �������
-- �μ���ȣ, ��å, �μ��� ��å�� ��� �޿� ���
SELECT deptno, job, AVG(sal) --2.
FROM emp --1.
WHERE sal<=3000 --3.
GROUP BY deptno, job HAVING AVG(sal) >= 2000
ORDER BY deptno, job;
-- WHERE���� �־��� �� ����->����Ʈ->������ ������ ������
-- GROUP���� �������� ���� ������ ��Ȯ�ϰ� �������� �ڿ� �����ؾ��Ѵ�.
-- ���� ������ ������ ���ϴ� ���� ������ �ʾ���

SELECT *
FROM emp;

-- �μ���ȣ(DEPTNO), ��� �޿�(AVG_SAL), �ְ� �޿�(MAX_SAL), �����޿�(MIN_SAL),
-- �����(CNT)�� ��� ��. ��� �޿� ��� �� �Ҽ��� �����ϰ� �� �μ���ȣ ���� ���
-- TRUNC(AVG(SAL),0) ��ſ� FLOOR(AVG(SAL)) �� ����
SELECT deptno, TRUNC(AVG(sal),0) AS AVG_SAL, MAX(sal) AS MAX_SAL, MIN(sal) AS MIN_SAL,
       COUNT(empno) AS CNT
FROM emp
GROUP BY deptno;

-- ���� ��å�� �����ϴ� ����� 3�� �̻��� ��å�� �ο����� ���
SELECT job, COUNT(job)
FROM emp
GROUP BY job HAVING COUNT(job) >= 3;

-- ������� �Ի翬���� �������� �μ����� �� �� �Ի��ߴ��� ��� COUNT �ȿ� * �־ ��
SELECT TO_CHAR(hiredate,'yyyy') AS HIRE_YEAR, deptno, COUNT(TO_CHAR(hiredate,'yyyy')) AS CNT
FROM emp
GROUP BY deptno, TO_CHAR(hiredate,'yyyy')
ORDER BY TO_CHAR(hiredate,'yyyy');

