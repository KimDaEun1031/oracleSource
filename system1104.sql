-- 주석 scott 계정 암호 지정 / 계정 혜제하기
alter user scott identified by tiger account unlock;

-- hr 계정 암호 지정 / 계정 혜제하기
alter user hr identified by 12345 account unlock;

-- 데이터 사전
-- dba_ : system, sys 만 볼 수 있음(DB관리를 위한 정보들이 저장된 곳)
SELECT * FROM dba_tables;

-- scott에게 create view 권한 부여
-- DCL에 속함
GRANT CREATE VIEW TO SCOTT;

-- SYNONYM 권한 부여 + PUBLIC 둘다 해야함
GRANT CREATE SYNONYM TO SCOTT;
GRANT CREATE PUBLIC SYNONYM TO SCOTT;

-- 새로운 사용자 생성(새로운 스키마 생성)
CREATE USER TEST IDENTIFIED BY 12345;

-- 권한 부여
GRANT CREATE SESSION TO TEST;

-- 여러 작업의 권한을 가지고 있는 롤 부여
GRANT CONNECT, RESOURCE TO TEST;

-- TEST2 사용자 생성(아무 권한이 없는 사용자 생성)
CREATE USER TEST2 IDENTIFIED BY 12345;

-- 권한 부여
GRANT CREATE SESSION TO TSET2;
GRANT CREATE TABLE TO TEST2;

GRANT CONNECT,RESOURCE TO TSET2;

-- 비밀번호 변경
ALTER USER TEST2 IDENTIFIED BY 54321;

-- 사용자 삭제
DROP USER TEST2 CASCADE;

-- 권한 취소 
REVOKE CREATE TABLE FROM TEST2;

-- 수업에서 사용할 사용자 생성
CREATE USER JAVADB IDENTIFIED BY 12345;
GRANT CONNECT,RESOURCE TO JAVADB;