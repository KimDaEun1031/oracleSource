-- ������ �޿����� ���� �޿��� �޴� ����� ���

-- ������ �޿� �˾Ƴ���   =  2975
SELECT SAL FROM emp WHERE ename = 'JONES';  

-- ���� �޿� ��� ����ϱ� = scott, king, ford
SELECT * FROM emp WHERE sal > 2975;

-- ���� ���� : ���� �� �ȿ� �ٸ� �������� �����ϰ� �ִ� ����
-- ������ ���� ���� = ���� ������ ����� �ϳ��� ������ ���(�ߺ��� ���� �ʴ� ������ �ϳ��� �����)
-- >,<,=,<=,>=  / (���� ����) <>,^=,!=
SELECT * 
FROM emp 
WHERE sal > (SELECT SAL FROM emp WHERE ename = 'JONES');

-- ����̸��� allen�� ����� �߰����纸�� ���� �޴� ����� ���
SELECT *
FROM emp
WHERE comm > (SELECT comm  FROM emp WHERE ename='ALLEN');

-- ��� �̸���  ward�� ����� �Ի��Ϻ��� ���� �Ի��� ����� ���
SELECT *
FROM emp
WHERE hiredate < (SELECT hiredate FROM emp WHERE ename='WARD');

-- 20�� �μ��� ���� ��� �� ��ü ����� ��� �޿����� ���� �޿��� �޴� ��� ���
SELECT *
FROM emp 
WHERE deptno = 20 AND sal > (SELECT AVG(SAL) FROM emp);

-- 20�� �μ��� ���� ��� �� ��ü ����� ��� �޿����� ���� �޿��� �޴� ����� ���� ���
-- �μ���, ������ġ ��� �߰�
SELECT *
FROM DEPT;

SELECT E.ENAME, E.DEPTNO, E.SAL, D.DEPTNO, D.DNAME, D.LOC
FROM emp E, dept D 
WHERE E.DEPTNO = D.DEPTNO AND D.deptno = 20 AND E.sal > (SELECT AVG(SAL) FROM emp);

-- ������ ���� ���� : ����� ���� ���� ����
-- IN /ANY / ALL / EXISTS

-- SELECT * FROM emp WHERE sal >= (SELECT MAX(SAL) FROM emp GROUP BY deptno); -- ����
-- ��? �׷��� ��ƹ��ȱ⿡
-- ���� ���� ����� 2�� �̻� ������ ����� �����༭�������� �����ڴ� ��� �Ұ�
SELECT * FROM emp WHERE sal IN (SELECT MAX(SAL) FROM emp GROUP BY deptno); -- 4�� ���
-- IN ~�̰ų� ~ �̰ų� ���� �ϳ��� ������ TRUE

-- ANY(=SOME) : ������ ��ȣ�� ���� ��� / MAX�� MIN ����� �ʿ� ����
-- =ANY : IN�� �������� ���� ���� , �� IN�� �� ���� �����
SELECT * FROM emp WHERE sal = ANY (SELECT MAX(SAL) FROM emp GROUP BY deptno);

SELECT * FROM emp WHERE sal = SOME (SELECT MAX(SAL) FROM emp GROUP BY deptno);

-- 30�� �μ� ������� �ִ� �޿����� ���� �޿��� �޴� ��� ���
SELECT * FROM emp WHERE sal < ANY (SELECT MAX(SAL) FROM emp WHERE deptno = 30);

SELECT * FROM emp WHERE sal < ANY (SELECT SAL FROM emp WHERE deptno = 30);

-- 30�� �μ� ������� �ּ� �޿����� ���� �޿��� �޴� ��� ���
SELECT * FROM emp WHERE sal > ANY (SELECT SAL FROM emp WHERE deptno = 30);

-- ALL : ���� ������ ��� �����ϴ� ���� ������ ���� �� �� / ������ ��� / MAX�� MIN ����� �ʿ� ����
-- �μ���ȣ�� 30���� ������� �ּ� �޿����� �� ���� �޿��� �޴� ��� ���
SELECT * FROM emp WHERE sal < ALL (SELECT SAL FROM emp WHERE deptno = 30);

-- EXISTS : IN�� ����� ����, �� IN���� ���� ���
-- ���� ���� ����� �����ϸ� ���� ���� ����� ���
SELECT * FROM emp WHERE EXISTS (SELECT dname FROM dept WHERE deptno=20);
SELECT * FROM emp WHERE NOT EXISTS (SELECT dname FROM dept WHERE deptno=20);

SELECT empno, deptno
FROM emp
WHERE EXISTS (SELECT deptno 
              FROM dept 
              WHERE deptno IN(20.30) AND emp.deptno = dept.deptno);

SELECT empno, deptno
FROM emp
WHERE EXISTS (SELECT 1
              FROM dept 
              WHERE deptno IN(20.30) AND emp.deptno = dept.deptno);
              
-- exists �ڿ� ���� ���� ������ ����Ʈ���� �� �̾Ƴ��� ����� ���� / exists�� ���� ������ ������ �߿�


-- ppt ���� ���� �ǽ�
-- ��ü ��� �� allen�� ���� ��å�� ������� ��� ����, �μ������� ��� 4��
SELECT E.empno, E.ename, E.sal, E.job, D.deptno, D.dname
FROM emp E, dept D
WHERE E.DEPTNO = D.DEPTNO AND E.job IN (SELECT job FROM emp WHERE ename='ALLEN'); 

-- ��ü ����� ��� �޿� ���� ���� �޿��� �޴� ������� ������� �������, �μ�����, �޿���� ����
-- �� ��½� �޿��� ���������� �����ϵ� �޿��� ���� ��� �����ȣ�� ������ �������� ����  6��
SELECT E.empno, E.ename,D.dname, E.hiredate, D.loc, E.sal ,S.grade
FROM emp E, salgrade S, dept D
WHERE E.DEPTNO = D.DEPTNO AND E.sal BETWEEN S.losal AND S.hisal AND E.sal > (SELECT AVG(SAL) FROM emp)
ORDER BY E.SAL DESC, E.EMPNO ASC; 

-- ���� �� ���� ���� : ���� ������ SELECT ���� ���� �÷��� ���� �� ������ ���
SELECT * FROM emp WHERE (DEPTNO,SAL) IN
          (SELECT DEPTNO, MAX(SAL) FROM emp GROUP BY DEPTNO);  --4��
          
-- FROM �� ���� ����(=INLINE VIEW[�ζ��� ��])
SELECT E.EMPNO, E.ENAME, D.DEPTNO, D.DNAME,D.LOC
FROM (SELECT * FROM EMP WHERE DEPTNO=10) E, (SELECT * FROM DEPT) D
WHERE E.DEPTNO = D.DEPTNO;  --3��

-- SELECT �� ���� ����(=SCALAR SUBQUERY[��Į�� ��������])
-- �������� �������⿡ ���� ���� ���� / PPT������ �־������
SELECT EMPNO, ENAME, JOB, SAL,
(SELECT GRADE FROM SALGRADE WHERE E.SAL BETWEEN LOSAL AND HISAL) AS SALGRADE,
DEPTNO, (SELECT DNAME FROM DEPT WHERE E.DEPTNO = DEPT.DEPTNO) AS DNAME FROM EMP E;

-- �ǽ�
-- 10�� �μ��� �ٹ��ϴ� ��� �� 30�� �μ����� �������� �ʴ� ��å�� ���� ������� �������, �μ������� ��� 1��
SELECT E.empno, E.ename, E.job, E.sal, D.deptno, D.dname, D.loc
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO AND E.JOB NOT IN (SELECT DISTINCT JOB FROM EMP WHERE DEPTNO=30)
AND E.DEPTNO=10;


-- ��å�� SALESMAN�� ������� �ְ� �޿����� ���� �޿��� �޴� ������� �������, �޿� ��� ������ ���
-- �� ������ �Լ��� ����ϴ� ����� ������� �ʴ� ����� ���� �����ȣ�� �������� �������� ����
SELECT * FROM salgrade;

SELECT E.empno, E.ename, E.job, E.sal, S.HISAL, S.LOSAL, S.GRADE
FROM EMP E, SALGRADE S
WHERE E.sal BETWEEN S.losal AND S.hisal AND SAL > (SELECT MAX(SAL) FROM emp WHERE JOB='SALESMAN')
ORDER BY E.empno;

SELECT E.empno, E.ename, E.job, E.sal, S.HISAL, S.LOSAL, S.GRADE
FROM EMP E, SALGRADE S
WHERE E.sal BETWEEN S.losal AND S.hisal AND SAL > ALL (SELECT MAX(SAL) FROM emp WHERE JOB='SALESMAN')
ORDER BY E.empno;
