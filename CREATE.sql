CREATE TABLE TEST (
    ID NUMBER (4),
    NAME VARCHAR2(3));

DESC TEST;

--�ѱ��� ���� �ϳ� �� 2����Ʈ�� ó��
-- ����� ���� �ϳ� �� 1����Ʈ�� ó��
INSERT INTO TEST VALUES(1000,'ȫ�浿');
INSERT INTO TEST VALUES(1000,'ABC');

-- ���� ���� �ٸ� BYTE ó���� �����ϱ� ���� NCHAR, NVARCHAR2 �� ����
DROP TABLE TEST2;

-- �����̳� ������ �ƴϳ��� ����  :  ������ ���̸� �׻� ������ �ִ��� �ƴϳ��� ����
-- NCHAR�� ��� ���ڰ� �ϳ��� �Է��� �ǵ� 4�ڸ��� �׻� ����
-- NVARCHAR�� ��� �ϳ��� �ԷµǸ� �ϳ�, ���ڸ� �ԷµǸ� ���ڸ� ������ �׻� ����

CREATE TABLE TEST2 (
    ID NCHAR (4),
    NAME NVARCHAR2(3));

INSERT INTO TEST2 VALUES('Ȳ������','ȫ�浿');

SELECT * FROM TEST2;


CREATE TABLE TEST3 (
    ID NVARCHAR2 (4),
    NAME NVARCHAR2(4),
    REG_DATE DATE);
INSERT INTO TEST2 VALUES('Ȳ������','ȫ�浿',SYSDATE);

CREATE TABLE EMP_DDL(
    EMPNO NUMBER(4),
    ENAME VARCHAR(10),
    JOB VARCHAR(9),
    MGR NUMBER(4),
    HIREDATE DATE,
    SAL NUMBER(7,2),
    COMM NUMBER(7,2),
    DEPTNO NUMBER(4));
    
-- ALTER : ���̺� ����

-- �÷� �߰�
ALTER TABLE EMP_DDL ADD HP VARCHAR2(20);

-- ���� Į���� ����
ALTER TABLE EMP_DDL RENAME COLUMN HP TO TEL;

-- ���� Ÿ�� ����
ALTER TABLE EMP_DDL MODIFY EMPNO NUMBER(5);

-- ���� �÷� ����
ALTER TABLE EMP_DDL DROP COLUMN TEL;

-- ���̺� �̸� ����
RENAME EMP_DDL TO EMP_RENAME;

DESC EMP_RENAME;

-- MEMBER ���̺� �ۼ�
CREATE TABLE MEMBER (
    ID NCHAR(8),
    NAME NVARCHAR2(10),
    ADDR NVARCHAR2(50),
    NATION NCHAR(4),
    EMAIL VARCHAR2(50),
    AGE NUMBER(7,2));
    
DESC MEMBER;

-- MEMBER ���̺� ����

ALTER TABLE MEMBER ADD BIGO VARCHAR2 (20);

ALTER TABLE MEMBER MODIFY BIGO VARCHAR2 (30);

ALTER TABLE MEMBER RENAME COLUMN BIGO TO REMARK;

DROP TABLE MEMBER;
