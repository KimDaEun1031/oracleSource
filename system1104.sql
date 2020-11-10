-- �ּ� scott ���� ��ȣ ���� / ���� �����ϱ�
alter user scott identified by tiger account unlock;

-- hr ���� ��ȣ ���� / ���� �����ϱ�
alter user hr identified by 12345 account unlock;

-- ������ ����
-- dba_ : system, sys �� �� �� ����(DB������ ���� �������� ����� ��)
SELECT * FROM dba_tables;

-- scott���� create view ���� �ο�
-- DCL�� ����
GRANT CREATE VIEW TO SCOTT;

-- SYNONYM ���� �ο� + PUBLIC �Ѵ� �ؾ���
GRANT CREATE SYNONYM TO SCOTT;
GRANT CREATE PUBLIC SYNONYM TO SCOTT;

-- ���ο� ����� ����(���ο� ��Ű�� ����)
CREATE USER TEST IDENTIFIED BY 12345;

-- ���� �ο�
GRANT CREATE SESSION TO TEST;

-- ���� �۾��� ������ ������ �ִ� �� �ο�
GRANT CONNECT, RESOURCE TO TEST;

-- TEST2 ����� ����(�ƹ� ������ ���� ����� ����)
CREATE USER TEST2 IDENTIFIED BY 12345;

-- ���� �ο�
GRANT CREATE SESSION TO TSET2;
GRANT CREATE TABLE TO TEST2;

GRANT CONNECT,RESOURCE TO TSET2;

-- ��й�ȣ ����
ALTER USER TEST2 IDENTIFIED BY 54321;

-- ����� ����
DROP USER TEST2 CASCADE;

-- ���� ��� 
REVOKE CREATE TABLE FROM TEST2;

-- �������� ����� ����� ����
CREATE USER JAVADB IDENTIFIED BY 12345;
GRANT CONNECT,RESOURCE TO JAVADB;