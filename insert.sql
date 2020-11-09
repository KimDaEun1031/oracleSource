-- ȸ������, �Խñ� ���, �Ա�...

-- ������ dept ���̺��� �����ؼ� dept_temp ���̺� ����
CREATE TABLE DEPT_TEMP AS SELECT * FROM DEPT;

-- ���� ���̺� ��ȸ
SELECT * FROM DEPT_TEMP;

-- ������ �߰��ϱ�(��� 1)
INSERT INTO dept_temp(DEPTNO, DNAME, LOC)
VALUES(50,'DATABASE','SEOUL');

-- ������ �߰��ϱ�(��� 2)
INSERT INTO dept_temp VALUES(60,'NETWORK','BUSAN');

-- �����͸� �߰��� �� ���� ���� ���� ����
--INSERT INTO dept_temp(DEPTNO, DNAME, LOC) VALUES(50,'DATABASE'); ���� ���� ������� �ʽ��ϴ�. 
--INSERT INTO dept_temp(DEPTNO, DNAME, LOC) VALUES(500,'DATABASE','SEOUL'); �� ���� ���� ������ ��ü �ڸ������� ū ���� ���˴ϴ�.

-- �����Ϳ� NULL �ֱ�
-- ��������� NULL ����
INSERT INTO dept_temp(DEPTNO, DNAME, LOC) VALUES(70,'DATABASE',NULL);
INSERT INTO dept_temp(DEPTNO, DNAME, LOC) VALUES(80,'MOBLIE','');
-- ���������� NULL ����
INSERT INTO dept_temp(DEPTNO, LOC) VALUES(90,'INCHEON');
-- ȸ������ �� �� �޴��� ������ �ʼ��� �ƴմϴ�.��� �ϸ� ���������ΰ���
-- �޴��� ������ ���⵵ �ϰ� �� ���⵵ �ؿ� ��� �Ѵٸ� ��������� 

-- EMP ���̺��� �����Ͽ� EMP_TEMP ���̺� ����
CREATE TABLE EMP_TEMP AS SELECT * FROM EMP;

-- ���̺� ����
DROP TABLE EMP_TEMP;

-- EMP ���̺��� �����Ͽ� EMP_TEMP ���̺� �����ϵ� ������ �����ϱ�(�����Ͱ� ���� ������)
CREATE TABLE EMP_TEMP AS SELECT * FROM EMP WHERE 1<>1;
SELECT * FROM EMP_TEMP;

DESC EMP_TEMP;
INSERT INTO emp_temp(empno,ename,job,mgr,hiredate,sal,comm,deptno)
VALUES(9999,'ȫ�浿','PRESIDENT','','2020/11/09',4000,'',10);
INSERT INTO emp_temp(empno,ename,job,mgr,hiredate,sal,comm,deptno)
VALUES(9998,'������','MANAGER',NULL,'2018-01-21',3000,NULL,20);
-- HIREDATE�� / �� �����ϰ� - �� ����

-- ���� �ݿ�(�������� ������ �ؾ���.)
COMMIT;
--UPDATE,DELETE,INSERT�� ������ COMMIT�� �ʿ���

-- ��¥ ���� �ֱ� 
INSERT INTO emp_temp(empno,ename,job,mgr,hiredate,sal,comm,deptno)
VALUES(9997,'���ð�','SINGER',NULL,TO_DATE('21/01/2020','DD/MM/YYYY'),3000,NULL,40); -- �Ųٷ� �־��� ���
INSERT INTO emp_temp(empno,ename,job,mgr,hiredate,sal,comm,deptno)
VALUES(9996,'�̼���','HERO',NULL,SYSDATE,1000,NULL,30); -- �ý��� ���� ��¥ ����ֱ�(ȸ�����Կ� ���)

-- EMP ���̺��� SALGRADE ���̺��� �����Ͽ� �޿� ����� 1����� ������� EMP_TEMP ���̺� �߰��ϰ� �ʹٸ�
-- ���� ������ �ۼ��ϱ�(�����Ϳ� �߰��Ǵ� ���̺��� �� ������ ���� ������ �� ������ ��ġ) = ���������� �ۼ��� �� �߿�
INSERT INTO emp_temp(empno,ename,job,mgr,hiredate,sal,comm,deptno)
SELECT empno,ename,job,mgr,hiredate,sal,comm,deptno
FROM EMP E, SALGRADE S
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL AND S.GRADE = 1;
-- ���� �����͸� ���� �� ���� ���





