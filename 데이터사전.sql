-- ������ ���� : �����ͺ��̽� �޸�, ����, �����, ����, ��ü�� ���� ����Ŭ ��� �ʿ��� �߿��� �����Ͱ� ������ ���
-- ��κ� �б� �������� �����Ǵ� ���̺� �� ����� �������� ������ ���̽��� ���ݿ� ���� ������ �����ϴ� ��

-- SCOTT �������� ��� ������ ������ ����
SELECT * FROM DICT;

SELECT * FROM user_tables;
-- Ư�� ����ڿ��� ���ӵǾ� �ְ� �� ����ڰ� ��ȸ ������ ������ ���� ���
-- all�� �����ϴ� ������ ������ ��� ������ �κ� ����


SELECT * FROM all_tables; 
-- Ư�� ����ڰ� ��ȸ������ ��� ������ ����(������ �ƴϴ��� ������ �� �ִ� ������ ������ ������ ����)

-- �� : �������̺�
-- �������̺��� �� ���峪? �� ����? 

CREATE VIEW vm_emp20 AS (SELECT empno,ename,job,deptno
                         FROM emp
                         WHERE deptno=20);
                         
SELECT * FROM vm_emp20;
-- ���������� ���̺�� ���� ������ �����Ƿ� ���� ���̺�
              
-- �� Ȯ��           
SELECT * FROM user_views;

CREATE VIEW vm_emp30all AS SELECT * FROM emp;

-- ������ �並 ���ؼ� insert �۾�(vm_emp30all)

INSERT INTO vm_emp30all VALUES(7777,'KIM','JUNKI','','2020/10/19',2650,'',20);

SELECT * FROM vm_emp30all;
SELECT * FROM emp;

--�������̺� CREATE VIEW vm_emp30all AS SELECT * FROM emp �̷� ������ ���� ���� ������ ������ ���ǰ� �� ����

-- ������ �信 ������ �����Ѱ�?  �Ҵ빮�� ����
SELECT * FROM user_updatable_columns WHERE table_name='VM_EMP30ALL'; --�ҹ��ڴ� �ƹ��͵� �ȳ��� �빮�ڷ��ؾ���

SELECT * FROM user_updatable_columns WHERE table_name='VM_EMP_READ'; -- �ҹ��ڷ� �ϴϱ� �ƹ��͵� �ȳ����� �빮�ڷ� �ϴϱ� ���� 

-- ��� SELECT �� �����ϵ��� ����
CREATE VIEW VM_EMP_READ AS SELECT EMPNO,ENAME,JOB FROM EMP WITH READ ONLY;

-- �並 ����ϴ� ����?
-- 1.����(���� ���̺��� ������ �ִ� �ΰ��� ���� ����)
SELECT * FROM emp; -- �ΰ��� ���� : sal. comm(���� ���� ��)
-- ���� ���̺��� �ΰ��� �������� �ִ�. �����ڶ� �ϴ��� �ΰ��� ������ ���� �ص� �� �� ���⿡ 
-- �������̺� �並 ����� ���ϴ� ������ �̾Ƴ� ���������ϵ��� �ϴ� ����

-- 2. ��������, ���ΰ� ���� ������ ���� ����� �����ؼ� ����ϴ� ��
-- ��� �߸��ϸ� ���� ���̺���� �ջ�(����)�Ǳ� ������ �� ����ؼ� �� �� �� �ֵ��� �ؾ��Ѵ�.

-- �ε���(INDEX) : ���� / �����̱� ������ SELECT ���� ȿ���� ����(�������� �ƴ�)
-- ����Ŭ �����ͺ��̽� ���̺� ���� ���ϴ� ���ڵ带 ������ ã�ư� �� �ֵ��� ������� �����ͱ���

-- SCOTT ������ ������ �ε��� ���� ����
SELECT * FROM user_indexes;
-- INDEX_NAME�� PK_(Primary Key)�� �پ��ִٸ� �� ���� �����ϰ� �ĺ��ϴ� ������ ����ϸ� �� Ű, �� �ĺ��ڷ� �Ҹ���
-- FK_(Foreign Key)��� �ڽ� ���̺��̸� �θ����̺��� �̹� �����Ǿ� �־��Ѵ�. �ܺ�Ű, ����Ű, �ܺνĺ��� ������ �Ҹ���.

-- �⺻Ű ���� -> �ڵ� �ε����� ��

-- �ε��� ����(emp ���̺��� sal���� �ε��� ����)
CREATE INDEX idx_emp_sql ON emp(sal);

SELECT * FROM emp WHERE sal=1250;

-- �⺻Ű�� ������ ���̺� �ε��� Ȯ��
CREATE TABLE userTBL(
    userID char(8) NOT NULL PRIMARY KEY, 
    userName nvarchar2(10) NOT NULL,
    birthYEAR number(4) NOT NULL,
    mobile char(3));
    
SELECT index_name,uniqueness,index_type FROM user_indexes;

SELECT * FROM user_indexes;

-- ������(SEQUENCE) : Ư�� ��Ģ�� �´� ���� ���� ������ �� ��� - ���� ���� ���� ���� �� �ϳ�
-- ��) �Խñ� ��ȣ, ��ǰ ��ȣ, �ֹ� ��ȣ.....

CREATE SEQUENCE DEPT_SEQ
INCREMENT BY 10  -- ������ �󸶳� �Ұ��ΰ�?
START WITH 10    -- ó�� ���� ���ڸ� �ǹ�
MAXVALUE 90      -- ������ ����
MINVALUE 0       -- START ������ �۰� ����
NOCYCLE CACHE 2; -- �ݺ����� ����(CYCLE�� �ݺ�) / CACHE : �̸� ������ ������ ����(<=> NOCACHE)
-- �ܵ� ��ü/ ��������

-- ���� �������� ���� ���̺� ����
CREATE TABLE DEPT_SEQ_TBL AS SELECT * FROM DEPT WHERE 1<>1;
-- �������� �̿��ؼ� ����
SELECT * FROM dept_seq_tbl;
INSERT INTO DEPT_SEQ_TBL VALUES(DEPT_SEQ.nextval,'DATABASE','SEOUL');
-- INSERT�� ����̰� �ݺ��ؼ� ������ �ִ밪���� ������ ���� �Ѿ��� �� ������ ��
-- ������ ��Ű�� �ִ밪���� ���� ���� �� �� ����

-- ������ ����
ALTER SEQUENCE DEPT_SEQ INCREMENT BY 3 MAXVALUE 99 CYCLE; -- 99���� ���ٰ� �ٽ� 0���� ����

-- ������ ����� ������ Ȯ���ϱ�
SELECT DEPT_SEQ.currval FROM DUAL;


-- ���Ǿ�(SYNONYM) : ���� ��Ī
-- ���̺�, ��, ������, �� ��ü�鿡�� ��� ����� �� �ִ� �̸� �ο�

-- SYNONYM ����
CREATE SYNONYM E FOR EMP;

-- Ȯ��
SELECT * FROM E;

-- ����
DROP SYNONYM E;

-- ========== PPT �ǽ� ===========

-- EMP ���̺�� ���� ������ �����͸� �����ϴ� EMPIDX���̺��� �����Ͻÿ�
CREATE TABLE EMPIDX AS SELECT * FROM EMP WHERE 1<>1;
DROP TABLE EMPIDX;

-- ������ EMPIDX ���̺��� EMPNO���� IDX_EMPIDX_EMPNO �ε����� �����Ͻÿ�
CREATE INDEX IDX_EMPIDX_EMPNO ON EMPIDX(EMPNO);

-- �ε����� �� �����Ǿ����� ������ ���� �並 ���� Ȯ���Ͻÿ�
SELECT * FROM USER_INDEXES;

-- EMPIDX ���̺��� ������ �� �޿��� 1500 �ʰ��� ����鸸 ����ϴ� EMPIDX_OVER15K�並 �����Ͻÿ�
-- (�����ȣ, ����̸�, ��å, �μ���ȣ, �޿�, �߰����� ���� ������ �ִ�)
CREATE VIEW EMPIDX_OVER15K AS (SELECT empno,ename,job,deptno,sal,comm
                         FROM EMPIDX
                         WHERE sal>1500);

SELECT * FROM EMPIDX_OVER15K;
DROP VIEW EMPIDX_OVER15K;

-- DEPT ���̺�� ���� ���� �� ������ ������ DEPTSEQ ���̺��� �ۼ��Ͻÿ�
CREATE TABLE DEPTSEQ AS SELECT * FROM DEPT;

-- DEPTSEQ ���̺��� DEPTNO ���� ����� �������� �Ʒ��� ���õ� Ư���� ���� �����غ��ÿ�(PPT �ǽ� 3 2�� �׸� ����)
CREATE SEQUENCE DEPT_SEQ01
INCREMENT BY 1
START WITH 1
MAXVALUE 99
MINVALUE 1
NOCYCLE NOCACHE;

-- ������ ������ ��ȸ�غ��ÿ�
INSERT INTO DEPTSEQ VALUES(DEPT_SEQ01.nextval,'DATABASE','SEOUL');
SELECT * FROM deptseq;

