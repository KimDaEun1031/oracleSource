CREATE TABLE userTBL(
    no NUMBER(8) CONSTRAINT pk_userTBL PRIMARY KEY,
    username NCHAR(4) NOT NULL,
    birthYEAR NUMBER(4) NOT NULL,
    addr NCHAR(2) NOT NULL,
    mobile NVARCHAR2(13));
    
DROP TABLE userTBL;
    CREATE TABLE userTBL(
    no NUMBER(8) CONSTRAINT pk_userTBL PRIMARY KEY,
    username NCHAR(4) NOT NULL,
    birthYEAR NUMBER(4) NOT NULL,
    addr NCHAR(2) NOT NULL,
    mobile NVARCHAR2(13));
    
DROP TABLE userTBL;
    
CREATE SEQUENCE userTBL_seq;

INSERT INTO userTBL VALUES(userTBL_seq.nextval,'ȫ�浿',1955,'����','010-3433-5674');
INSERT INTO userTBL VALUES(userTBL_seq.nextval,'������',1946,'����','010-3445-5444');
INSERT INTO userTBL VALUES(userTBL_seq.nextval,'���ð�',1987,'��õ','010-3426-9877');
INSERT INTO userTBL VALUES(userTBL_seq.nextval,'�赿��',1998,'�λ�','010-2123-6574');
INSERT INTO userTBL VALUES(userTBL_seq.nextval,'������',2010,'����','010-4532-7865');

SELECT * FROM usertbl;

COMMIT;                         
