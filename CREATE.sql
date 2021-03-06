CREATE TABLE TEST (
    ID NUMBER (4),
    NAME VARCHAR2(3));

DESC TEST;

--한글은 글자 하나 당 2바이트로 처리
-- 영어는 글자 하나 당 1바이트로 처리
INSERT INTO TEST VALUES(1000,'홍길동');
INSERT INTO TEST VALUES(1000,'ABC');

-- 언어마다 서로 다른 BYTE 처리를 보완하기 위해 NCHAR, NVARCHAR2 가 나옴
DROP TABLE TEST2;

-- 가변이냐 가변이 아니냐의 차이  :  고정된 길이를 항상 가지고 있느냐 아니냐의 차이
-- NCHAR의 경우 글자가 하나만 입력이 되도 4자리를 항상 유지
-- NVARCHAR의 경우 하나만 입력되면 하나, 두자리 입력되면 두자리 식으로 항상 가변

CREATE TABLE TEST2 (
    ID NCHAR (4),
    NAME NVARCHAR2(3));

INSERT INTO TEST2 VALUES('황보강성','홍길동');

SELECT * FROM TEST2;


CREATE TABLE TEST3 (
    ID NVARCHAR2 (4),
    NAME NVARCHAR2(4),
    REG_DATE DATE);
INSERT INTO TEST2 VALUES('황보강성','홍길동',SYSDATE);

CREATE TABLE EMP_DDL(
    EMPNO NUMBER(4),
    ENAME VARCHAR(10),
    JOB VARCHAR(9),
    MGR NUMBER(4),
    HIREDATE DATE,
    SAL NUMBER(7,2),
    COMM NUMBER(7,2),
    DEPTNO NUMBER(4));
    
-- ALTER : 테이블 변경

-- 컬럼 추가
ALTER TABLE EMP_DDL ADD HP VARCHAR2(20);

-- 기존 칼럼명 변경
ALTER TABLE EMP_DDL RENAME COLUMN HP TO TEL;

-- 기존 타입 변경
ALTER TABLE EMP_DDL MODIFY EMPNO NUMBER(5);

-- 기존 컬럼 삭제
ALTER TABLE EMP_DDL DROP COLUMN TEL;

-- 테이블 이름 변경
RENAME EMP_DDL TO EMP_RENAME;

DESC EMP_RENAME;

-- MEMBER 테이블 작성
CREATE TABLE MEMBER (
    ID NCHAR(8),
    NAME NVARCHAR2(10),
    ADDR NVARCHAR2(50),
    NATION NCHAR(4),
    EMAIL VARCHAR2(50),
    AGE NUMBER(7,2));
    
DESC MEMBER;

-- MEMBER 테이블 변경

ALTER TABLE MEMBER ADD BIGO VARCHAR2 (20);

ALTER TABLE MEMBER MODIFY BIGO VARCHAR2 (30);

ALTER TABLE MEMBER RENAME COLUMN BIGO TO REMARK;

DROP TABLE MEMBER;
