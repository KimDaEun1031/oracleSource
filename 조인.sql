-- �ܺ� ������ ���� ���� ���� ���� / ȸ�簡�� ���� ���� ��
-- ���ʰ� �������� ����


SELECT * FROM emp,dept ORDER BY empno; -- ���� �� �ִ� ��� ���� ��ȸ
SELECT COUNT(*) FROM emp,dept ORDER BY empno;

SELECT * FROM dept; -- 4��
SELECT * FROM emp; -- 14��
-- �̷��� �����δ� ������  (���κ� ����)


--INNER JOIN ���� ����(=�����,�ܼ�����) : ���ٸ� ã�ƿ��� �� / ���� ���� ���
-- WHERE ���� ���� ��
SELECT *
FROM emp, dept
WHERE emp.deptno = dept.deptno -- ������ ������ �Ǵ� �κ�
ORDER BY empno;
--  emp.deptno = dept.deptno ==> emp�� deptno�� dept�� deptno�� ���ٸ�~

-- INNER JOIN ~ ON ~ ���� ���� ��
SELECT *
FROM emp INNER JOIN dept
ON emp.deptno = dept.deptno -- ������ ������ �Ǵ� �κ�
ORDER BY empno;
-- ���� �Ѵ� �˰� �־�ߴ�

-- �̷��Ը� �ϱ⿣ �����ϴ� ��Ī�� ���δ� AS �ʿ����
-- �ڹ� ������ ����..

SELECT *
FROM emp E, dept D
WHERE E.deptno = D.deptno -- ������ ������ �Ǵ� �κ�
ORDER BY empno;

SELECT *
FROM emp E INNER JOIN dept D
ON E.deptno = D.deptno -- ������ ������ �Ǵ� �κ�
ORDER BY empno;


-- �� ���̺� ���� �̸��� �ʵ尡 �����ϴ� ���
-- ��� ���̺� �ִ� �ʵ带 ������ �� ������ ��Ȯ�� ���
SELECT empno, ename, job, deptno, dname
FROM emp E, dept D
WHERE E.deptno = D.deptno -- ������ ������ �Ǵ� �κ�
ORDER BY empno;
-- ���� ��? DEPTNO ������ ��? ������ DEPTNO���� Ȯ���ϰ� ���� �ʾұ� ������
-- D.DEPTNO��� �Ѵٸ�
SELECT empno, ename, job, D.deptno, dname
FROM emp E, dept D
WHERE E.deptno = D.deptno -- ������ ������ �Ǵ� �κ�
ORDER BY empno;
-- �����̴�


-- emp���̺�� dept ���̺��� �����Ͽ� enpno, ename, sal, deptno
-- dname, loc�� ��ȸ�Ѵ�. ��, �޿��� 3000 �̻��� ����鸸 ���
SELECT E.empno, E.ename, E.sal, D.deptno, D.dname, D.loc
FROM emp E, dept D
WHERE E.deptno = D.deptno AND sal >= 3000;

SELECT * FROM dept;
-- emp ���̺��� ��Ī�� e�� dept ���̺��� ��Ī�� d�� �Ͽ�
-- �޿��� 2500 �����̰� �����ȣ�� 9999������ ����� ������ ���
SELECT *
FROM emp E, dept D
WHERE E.deptno = D.deptno 
AND sal<=2500 
AND empno<=9999;
-- emp ���̺��� ��Ī�� e�� salgrade ���̺��� ��Ī�� s�� �Ͽ�
-- �� ����� ������ ���Ҿ� ����� ��� ������ ���
SELECT *
FROM emp E, salgrade S
WHERE E.sal BETWEEN S.losal AND S.hisal;

-- ���� ����(��ü ����) : ���� ���̺��� �ڱ� �ڽ� ���̺� �� ��
SELECT * FROM emp;

SELECT E1.empno, E1.ename, E1.mgr, E2.empno AS MGR_ENPNO, E2.ename AS MGR_ENAME
FROM emp E1 ,emp E2
WHERE E1.mgr = E2.empno;

-- �ܺ�����(OUTER JOIN) : ������ �������� �ʴ� ������ ����
-- LEFT OUTER JOIN �̷� ������ ���°� ǥ��

-- ó�����(1)  LEFT OUTER JOIN �� �� ���
SELECT E1.empno, E1.ename, E1.mgr, E2.empno AS MGR_ENPNO, E2.ename AS MGR_ENAME
FROM emp E1 LEFT OUTER JOIN emp E2
ON E1.mgr = E2.empno;

-- ó�����(2)  (+) �� �� ���
SELECT E1.empno, E1.ename, E1.mgr, E2.empno AS MGR_ENPNO, E2.ename AS MGR_ENAME
FROM emp E1 ,emp E2
WHERE E1.mgr = E2.empno(+); -- ������ �����̶�

-- ó�����(1)  RIGHT OUTER JOIN
SELECT E1.empno, E1.ename, E1.mgr, E2.empno AS MGR_ENPNO, E2.ename AS MGR_ENAME
FROM emp E1 RIGHT OUTER JOIN emp E2
ON E1.mgr = E2.empno;


-- ó�����(2)  (+)
SELECT E1.empno, E1.ename, E1.mgr, E2.empno AS MGR_ENPNO, E2.ename AS MGR_ENAME
FROM emp E1 , emp E2
WHERE E1.mgr(+) = E2.empno; --������ ����

-- �ǽ�

-- �޿��� 2000�ʰ��� ������� �μ�����, ��������� ���
SELECT d.deptno, d.dname, e.empno, e.ename, e.sal
FROM EMP E INNER JOIN DEPT D
ON E.deptno = D.deptno AND E.SAL>2000;
-- �� �μ��� ��� �޿�,�ִ� �޿�, �ּ� �޿�, ������� ��� 
SELECT E.deptno , D.dname ,ROUND(AVG(SAL)) AS AVG_SAL, MAX(SAL) AS MAX_SAL,
       MIN(SAL) AS MIN_SAL, COUNT(empno) AS CNT
FROM EMP E, DEPT D
WHERE  E.deptno = d.deptno
GROUP BY E.deptno, d.dname;


-- ��� �μ������� ��������� �μ���ȣ, ����̸� ������ �����Ͽ� ���
SELECT d.deptno, d.dname, e.empno, e.ename, e.job, e.sal
FROM EMP E INNER JOIN DEPT D
ON e.deptno = d.deptno ORDER BY deptno,ename;

SELECT d.deptno, d.dname, e.empno, e.ename, e.job, e.sal
FROM EMP E RIGHT OUTER JOIN DEPT D
ON e.deptno = d.deptno ORDER BY deptno,ename;
-- ��� �μ������� �������, �޿���� ����, �� ����� ���ӻ���� ���� �μ���ȣ, �����ȣ ������ ����

SELECT D1.DEPTNO, D1.DNAME, E1.EMPNO, E1.ENAME, E1.MGR, E1.SAL, E1.DEPTNO,
       S.LOSAL, S.HISAL,S.GRADE,E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_ENAME
FROM EMP E1 
RIGHT OUTER JOIN DEPT D1 ON E1.DEPTNO = D1.DEPTNO
LEFT OUTER JOIN SALGRADE S ON E1.SAL BETWEEN S.LOSAL AND S.HISAL
LEFT OUTER JOIN EMP E2 ON E1.MGR = E2.EMPNO
ORDER BY D1.DEPTNO, E1.EMPNO;

SELECT D1.DEPTNO, D1.DNAME, E1.EMPNO, E1.ENAME, E1.MGR, E1.SAL, E1.DEPTNO,
       S.LOSAL, S.HISAL,S.GRADE,E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_ENAME
FROM EMP E1 ,DEPT D1,SALGRADE S,EMP E2
WHERE E1.DEPTNO(+) = D1.DEPTNO AND E1.SAL BETWEEN S.LOSAL AND S.HISAL(+) AND
     E1.MGR = E2.EMPNO(+)
ORDER BY E1.DEPTNO;

-- ���� ���� ����
-- ������ ���� : �� �������� �� �ϳ��� ��? ���� �Ҹ��� �𸣰ڴ�.. ���� �ʿ�
SELECT * FROM emp WHERE sal >
(SELECT sal FROM emp WHERE ename = 'JONES');

SELECT * FROM emp WHERE hiredate >
(SELECT hiredate FROM emp WHERE ename = 'SCOTT');

