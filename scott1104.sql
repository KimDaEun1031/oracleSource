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

-- =========================== ����Ŭ �Լ� ==========================

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
SELECT REPLACE('�̰��� oracle�̴�','�̰���','This is')
FROM dual;

SELECT '010-1234-1234' AS REPLACE_BEFFORE, 
       REPLACE('010-1234-1234', '-', ' ') AS REPLACE_1,
       REPLACE('010-1234-1234', '-') AS REPLACE_2
FROM dual;

-- ���ڿ� �Լ� : commcat(���ڿ� ����)
SELECT CONCAT(empno,ename),  CONCAT(empno,CONCAT(':',ename))
FROM emp
WHERE ename='SCOTT';

-- || ������ �ǹ̷� ���

SELECT empno || ename, empno || ':' || ename
FROM emp
WHERE ename='SCOTT';

-- ���ڿ� �Լ� : TRIM(��������), LTRIM(���� ���� ����), RTRIM(������ ���� ����)
SELECT '    �̰���     ', TRIM('    �̰���     ')
FROM dual;
-- LEADING : ���ʿ� �ִ� ���� ����� / TRAILING : �����ʿ� �ִ� ���� �����
-- BOTH : ���ʿ� �ִ� ���� �����
SELECT TRIM(LEADING FROM '__ORACLE__') AS TRIM_LEADING,
       TRIM(TRAILING FROM '__ORACLE__') AS TRIM_TRAILING,
       TRIM(BOTH FROM '__ORACLE__') AS TRIM_BOTH,
FROM dual;

-- ���ڿ� �Լ� : REVERSE(�Ųٷ�)
SELECT REVERSE('Oracle') FROM dual;


-- 2. �����Լ� : ROUND, TRUNC, CEIL, FLOOR, MOD
-- ROUND : �ݿø� / TRUNC : ���� / CEIL : �Էµ� ���ڿ� ����� ū ����
-- FLOOR : �Էµ� ���ڿ� ����� ���� ���� / MOD : ������

SELECT ROUND(1234.5678) AS ROUND,
       ROUND(1234.5678,0) AS ROUND_1,
       ROUND(1234.5678,1) AS ROUND_2,
       ROUND(1234.5678,-1) AS ROUND_MINUS,
       ROUND(1234.5678,-2) AS ROUND_MINUS2
FROM dual;


SELECT TRUNC(1234.5678) AS TRUNC,
       TRUNC(1234.5678,0) AS TRUNC_1,
       TRUNC(1234.5678,1) AS TRUNC_1,
       TRUNC(1234.5678,-1) AS TRUNC_MINUS,
       TRUNC(1234.5678,-2) AS TRUNC_MINUS2
FROM dual;

SELECT CEIL(3.14), FLOOR(3.14), CEIL(-3.14), FLOOR(-3.14)
FROM dual;

SELECT MOD(15,6), MOD(10,2), MOD(11,2) FROM dual;

-- ��¥ �Լ� : SYSDATE(�����������), CURRENT_DATE, CURRENT_TIMESTAMP
-- sysdate�� ���� ����ϴ� ���� : ȸ������ ������ ���࿡ �þҴٸ� �ٸ������ ������ ���� ��
-- ������ �� ��¥�� ���ߵű⿡

SELECT SYSDATE, CURRENT_DATE, CURRENT_TIMESTAMP FROM dual;

-- ��¥�����ʹ� ������ ������ : ��¥ ������ +1 /-1, ��¥������ - ��¥������ 
-- ��¥ + ��¥ �� �ȵ�

SELECT SYSDATE AS NOW, SYSDATE-1 AS YESTERDAY, SYSDATE+1 AS TOMORROW
FROM DUAL;

-- ��¥ �Լ� : ADD_MONTHS
SELECT SYSDATE, ADD_MONTHS(SYSDATE,4) FROM DUAL;

-- �Ի� 10�ֳ��� �Ǵ� ����� ��ȸhr

SELECT empno, ename, hiredate, ADD_MONTHS(hiredate,120) FROM emp;

-- �Ի� 38�� �̸��� ��� ��ȸ
SELECT * FROM emp WHERE ADD_MONTHS(hiredate,456) > SYSDATE;

-- ��¥�Լ� : MONTHS_BETWEEN(�� ��¥ ������ ����)
SELECT * FROM emp WHERE MONTHS_BETWEEN(SYSDATE, HIREDATE) < 456;

SELECT empno, ename, hiredate, SYSDATE,MONTHS_BETWEEN(hiredate,SYSDATE) AS MONTH1,
MONTHS_BETWEEN(SYSDATE,hiredate) AS MONTH2, TRUNC(MONTHS_BETWEEN(SYSDATE,hiredate))
FROM emp;

--��¥ �Լ� : NEXT_DAY (������ �������� ���� ����� ��) 
        --   LAST_DAY (���� ���� �������� ������ ��)
SELECT SYSDATE,NEXT_DAY(SYSDATE,'������'),LAST_DAY(SYSDATE)
FROM dual;

-- ����ȯ �Լ� :  TO_CHAR(��¥,���ڸ� ���ڷ�)
--              TO_NUMBER(���ڸ� ���ڷ�)
--              TO_DATE(���ڸ� ��¥�� ��ȯ)
-- �տ� BAR�� ������ ������ ���ڶ�� �� EX) TO_BARCHAR..

SELECT to_char(SYSDATE,'YYYY/MM/DD') AS ���糯¥ FROM DUAL;
SELECT to_char(SYSDATE,'MM') AS ���糯¥ FROM DUAL;
SELECT to_char(SYSDATE,'MON') AS ���糯¥ FROM DUAL; --���̶�� ����
SELECT to_char(SYSDATE,'DD') AS ���糯¥ FROM DUAL;
SELECT to_char(SYSDATE,'DAY') AS ���糯¥ FROM DUAL;
SELECT to_char(SYSDATE,'HH:MI:SS') AS ����ð� FROM DUAL;
SELECT to_char(SYSDATE,'HH12:MI:SS') AS ����ð� FROM DUAL;
SELECT to_char(SYSDATE,'HH24:MI:SS') AS ����ð� FROM DUAL;
SELECT to_char(SYSDATE,'HH:MI:SS PM') AS ����ð� FROM DUAL;

-- ���� ��¥�� ��, ��, �� 16:51:45 ǥ��
SELECT to_char(SYSDATE,'YYYY/MM/DD HH24:MI:SS') AS ���糯¥�ð� FROM DUAL;

SELECT TO_NUMBER('1,300,000','999,999,999') - TO_NUMBER('1,300','999,999') FROM dual;
-- 9,0 (���� �� �ڸ��� �ǹ�), 9 = ���ڸ��� ä���� �ʴ� ����, 0 ���ڸ��� ä��� ����

SELECT SAL, TO_CHAR(SAL, '$999,999') AS SAL_$,
       TO_CHAR(SAL, 'L999,999') AS SAL_L,
        TO_CHAR(SAL, '$999,999.00') AS SAL_1, 
        TO_CHAR(SAL, '$000,999,999.00') AS SAL_2,
        TO_CHAR(SAL, '$000999999.99') AS SAL_3,
        TO_CHAR(SAL, '999,999.00') AS SAL_4
FROM emp;

SELECT TO_DATE('2020-11-05','YYYY/MM/DD') AS TODATE1,
       TO_DATE('20201105','YYYY-MM-DD') AS TODATE2 FROM DUAL;
       
-- 1981�� 6�� 1�� ���Ŀ� �Ի��� ������� ��ȸ
SELECT * 
FROM emp 
WHERE hiredate > TO_DATE('1981-06-01','YYYY/MM/DD');

SELECT TO_DATE('2O19-12-20')-TO_DATE('2019-10-20') FROM emp;

-- ��ó�� �Լ� : NVL / NVL2 
SELECT empno, ename, sal, comm, sal+comm FROM emp;

SELECT empno, ename, sal, comm, sal+comm, NVL(comm,0), sal+NVL(comm,0)
FROM emp;

SELECT empno, ename, sal, comm, sal+comm,NVL2(comm,'O','X'), sal+NVL2(comm,sal*12+comm,sal*12) AS annsal
FROM emp; 
--NVL2�� ���� �ƴ� ��쵵 ó�� ����

-- DECODE �Լ� AND CASE��
-- JOB�� �Ŵ����� ���, ��������� ���, ��θ���Ʈ�� ��� ������ �ٸ� ������ �����ϰ� �ʹٸ�?

SELECT empno, ename, job, sal, DECODE(job,
                                    'MANAGER', SAL*1.1,
                                    'SALESMAN', SAL*1.05,
                                    'ANALYST', SAL,
                                    SAL*1.03) AS UPSAL
FROM emp;

SELECT empno, ename, job, sal, CASE job
                                    WHEN  'MANAGER' THEN SAL*1.1
                                    WHEN  'SALESMAN' THEN SAL*1.05
                                    WHEN  'ANALYST' THEN SAL
                                    ELSE   SAL*1.03 
                               END AS UPSAL
FROM emp;

-- DECODE���� CASE�� �� ���� ���̴� ����... �Ѵ� �� �Ⱦ� / �ڵ��� �ϴϱ�

SELECT empno,ename,job,sal, CASE
                                WHEN comm IS NULL THEN '�ش���׾���'
                                WHEN comm=0 THEN '�������'
                                WHEN comm>0 THEN '����'
                            END AS COMM_TEXT FROM emp;
                            
-- ========= �Լ� �ǽ� ===========                           

-- ������� �� ��� �ٹ� �ϼ��� 21.5���̴�. �Ϸ� �ٹ� 8�ð����� ������ �� �������
-- �Ϸ� �޿�(day_pay)�� �ñ�(time_pay)�� ����Ͽ� ��� ���
-- ��, �Ϸ� �޿��� �Ҽ��� ��° �ڸ����� ������, �ñ��� �ι�° �Ҽ������� �ݿø�

SELECT empno, ename, sal , TRUNC ((sal/21.5),2) AS DAY_PAY, 
                           ROUND ((sal/21.5/8),1) AS TIME_PAY
FROM emp;


-- ������� �Ի����� �������� 3������ ���� �� ù �����Ͽ� �������� �ȴ�.
-- ������� �������� �Ǵ� ��¥(r_job)�� YYYY-MM-DD�������� ���
-- �� �߰�����(COMM)�� ���� ����� �߰� ������ N/A�� ���
SELECT empno, ename, hiredate ,NEXT_DAY(ADD_MONTHS(hiredate,3),'������') AS r_job,
      NVL(TO_CHAR(comm),'N/A') AS COMM
FROM emp;


-- ��� ����� ������� ���� ����� �����ȣ�� ���� ������ �������� ��ȯ�Ͽ� CHG_MGR���� ���
-- �����ȣ�� �������� ���� ��� : 0000 / �� ���ڸ��� 75�� ��� : 5555 / 76�� ��� : 6666
-- 77�� ��� : 7777 / 78�� ��� : 8888 / �׿ܴ� �״�� ���
SELECT SUBSTR(TO_CHAR(mgr),1,2) FROM emp;

SELECT empno, ename, mgr,
            DECODE(SUBSTR(TO_CHAR(mgr),1,2),
                'null','0000',
                '75','5555',
                '76','6666',
                '77','7777',
                '78','8888',
                TO_CHAR(mgr))
FROM emp;

SELECT empno, ename, mgr,  CASE
                                WHEN mgr IS NULL THEN '0000'
                                WHEN substr(mgr,1,2)=75 THEN '5555'  
                                WHEN substr(mgr,1,2)=76 THEN '6666'  
                                WHEN substr(mgr,1,2)=77 THEN '7777'  
                                WHEN substr(mgr,1,2)=78 THEN '8888'
                                ELSE TO_CHAR(mgr)
                            END AS CHG_MGR FROM emp;



