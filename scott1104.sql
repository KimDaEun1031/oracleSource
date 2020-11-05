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


-- between A and b

-- �޿��� 2000�̻� 3000������ ������� ��ȸ
SELECT * FROM emp WHERE sal>=2000 AND sal<=3000;
SELECT * FROM emp WHERE sal BETWEEN 2000 AND 3000;

-- �޿��� 2000 ���� 3000 ���ϰ� �ƴ� ��� ���� ��ȸ
SELECT * FROM emp WHERE sal NOT BETWEEN 2000 AND 3000;

-- like : ���ڿ� �˻��� �� �� ���(s�� �����ϴ� ~~ / h�� ������ ~~ /����� t�� �ִٸ�~~)
-- %�� �ڿ� ������ ~�� �����ϴ� %�� ���� ���̿�(%s%)�̷������� ������ ����� ~�� �ִ�
-- %�� �տ� ������ ~�� ������ ���� �ǹ� /  _(�����)�� ���� �ϳ��� ���ڸ�

-- ��� �̸��� s�� �����ϴ� ��� ������� ���
SELECT * FROM emp WHERE ename LIKE 'S%';

-- ��� �̸��� �ι�° ���� L�� ����� ��ȸ
SELECT * FROM emp WHERE ename LIKE '_L%'

-- ��� �̸��� AM�� ���ԵǾ� �ִ� ����� ��ȸ
SELECT * FROM emp WHERE ename LIKE '%AM%'
-- ��� �̸��� AM�� ���ԵǾ� ���� ���� ����� ��ȸ
SELECT * FROM emp WHERE ename NOT LIKE '%AM%'


-- IS NULL
-- SELECT * FROM emp WHERE comm = null; �ȵ�
SELECT * FROM emp WHERE comm IS null;

-- MGR�� NULL �� ������� ��ȸ
SELECT * FROM emp WHERE mgr IS null;
-- MGR�� NULL �ƴ� ������� ��ȸ
SELECT * FROM emp WHERE mgr IS NOT null;

-- ���� ������ : ������(UNION), ������(INTERSECT) , ������(MINUS)

-- DEPTNO�� 10�� ���̺�� DEPTNO�� 20�� ����� ���ؼ� ���ؼ� ��ȸ
SELECT empno, ename, sal, deptno FROM emp WHERE deptno =10
UNION
SELECT empno, ename, sal, deptno FROM emp WHERE deptno =20;

SELECT empno, ename, sal, deptno FROM emp WHERE deptno =10
UNION ALL
SELECT empno, ename, sal, deptno FROM emp WHERE deptno =10;
-- ������ �� ���� ���ٸ� �ߺ��� ���� �� ��� ��� : �� �� ALL�� ���̸� �� ����

-- �μ���ȣ�� 10�� �ƴ� ������� ���� ��ȸ
SELECT * FROM emp 
MINUS 
SELECT * FROM emp WHERE deptno=10;

-- �μ���ȣ�� 10�� ��� ������ ��ȸ
SELECT * FROM emp 
INTERSECT
SELECT * FROM emp WHERE deptno=10;

-- 20�� 30�� �μ��� �ٺ��ϰ� �ִ� ��� �� SAL�� 2000�ʰ��� ����� ���� �ΰ���
-- ����� SELECT ���� ����Ͽ� �����ȣ �̸� �޿� �μ���ȣ�� ����ϴ�  SQL�� �ۼ�

-- ���� ������ ��� ���ϴ� ���
SELECT empno, ename, sal, deptno 
FROM emp 
WHERE sal>2000 AND deptno IN (20,30);

-- ���� �����ڸ� ����ϴ� ���
SELECT empno, ename, sal, deptno FROM emp WHERE sal>2000 
INTERSECT
SELECT empno, ename, sal, deptno FROM emp WHERE deptno IN (20,30);

-- �̷������ε� ����
SELECT empno, ename, sal, deptno 
FROM emp 
WHERE sal>2000 
MINUS
SELECT empno, ename, sal, deptno 
FROM emp 
WHERE deptno=10;


SELECT empno, ename, sal, deptno 
FROM emp 
WHERE sal>2000 AND deptno=20
UNION
SELECT empno, ename, sal, deptno 
FROM emp 
WHERE sal>2000 AND deptno=30;

-- ����Ŭ �Լ�  
-- 1. ���� �Լ� : upper, lower , initcap, LENGTH, LENGTHB
-- upper : �빮�� ���� / lower : �ҹ��� ���� / initcap : ó���� �빮��

-- ENAME�� UPPER�� LOWER, INITCAP���� ��ȯ�Ͽ� ��ȸ
SELECT ename, UPPER(ename), LOWER(ename), INITCAP(ename) 
FROM emp;

-- LENGTH : ���ڿ� ���� / LENGTHB : ���ڿ� ����(b = ����Ʈũ��)
SELECT LENGTH('�ѱ�'), LENGTHB('�ѱ�') FROM dual;
--dual ���̺�  : sys�� �����ϰ� �ִ� ���̺�� �ӽÿ���� �Լ��� ������� Ȯ���ϴ� �뵵

-- ��å�� 6���� �̻��� ������� ���� ����
SELECT * FROM emp WHERE LENGTH(job) >= 6;

-- ���ڿ� �Լ� : substr(���ڿ� ������, ������ġ, �������)
SELECT job, substr(job,1,2), substr(job,3,2), substr(job,5) FROM emp;

--   -LENGTH(job) = -5 ����� �� ���̳ʽ��ε� �����ϴ�
-- �ι�°�� -5���ͽ��� 2��° ���� �ϱ� -5,-4 2�� ����ؼ� cl�� ���°�

SELECT job, substr(job, -LENGTH(job)), substr(job, -LENGTH(job),2), substr(job,-3)
FROM emp;

-- ���ڿ� �Լ� : INSTR(Ư�� ���� ��ġ ã��)
SELECT INSTR('HELLO, ORACLE!', 'L') AS INSTR_1,
       INSTR('HELLO, ORACLE!', 'L',5) AS INSTR_2,
       INSTR('HELLO, ORACLE!', 'L',2,2) AS INSTR_3
FROM dual;

-- ���ڿ� �Լ� : REPLACE(���� ã�Ƽ� �ٲٱ�)
SELECT 


FROM 

