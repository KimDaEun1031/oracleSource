-- UPDATE : ������ ���� 

CREATE TABLE DEPT_TEMP2 AS SELECT * FROM DEPT;

-- DEPT_TEMP2���ִ� LOC ��� ����
SELECT * FROM DEPT_TEMP2;

UPDATE dept_temp2     -- ���̺� ��
SET LOC='SEOUL';      -- ������ ����

ROLLBACK; -- �ǵ��ư��� CTRL+Z

UPDATE dept_temp2    -- ���̺� �� 
SET LOC='SEOUL'      -- ������ ���� 
WHERE DEPTNO=10;     -- ������Ʈ ����

-- EMP_TEMP ���̺� ����� �߿��� �޿��� 3000 ������ ����� �߰� ������ 50���� ����
SELECT * FROM EMP_TEMP;

UPDATE emp_temp
SET comm = 50
WHERE sal <= 3000;

-- ������ �����Ͱ� �����Ѵٸ� 
UPDATE emp_temp
SET comm = COMM+50
WHERE sal <= 3000;
-- ���������� ������ ���� �����ֵ��� ���ֵ��� �ؾ���

-- ���� ������ �̿��� ������ ����
-- 40�� �μ��� �μ���� ���� ����
UPDATE dept_temp2
SET (DNAME, LOC) = (SELECT DNAME, LOC FROM DEPT WHERE DEPTNO=30)
WHERE DEPTNO=40;


UPDATE dept_temp2
SET LOC = 'SEOUL'
WHERE DEPTNO=(SELECT DEPTNO FROM DEPT WHERE DNAME='OPERATIONS');

COMMIT;