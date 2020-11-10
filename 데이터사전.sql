-- 데이터 사전 : 데이터베이스 메모리, 성능, 사용자, 권한, 객체와 같은 오라클 운영에 필요한 중요한 데이터가 보관된 장소
-- 대부분 읽기 전용으로 제공되는 테이블 및 뷰들의 집합으로 데이터 베이스의 전반에 대한 정보를 제공하는 것

-- SCOTT 계정에서 사용 가능한 데이터 사전
SELECT * FROM DICT;

SELECT * FROM user_tables;
-- 특정 사용자에게 종속되어 있고 그 사용자가 조회 가능한 데이터 사전 뷰들
-- all로 시작하는 데이터 사전의 모든 정보의 부분 집합


SELECT * FROM all_tables; 
-- 특정 사용자가 조회가능한 모든 데이터 사전(주인이 아니더라도 접근할 수 있는 권한을 가지고 있으면 가능)

-- 뷰 : 가상테이블
-- 가상테이블을 왜 만드나? 왜 쓰나? 

CREATE VIEW vm_emp20 AS (SELECT empno,ename,job,deptno
                         FROM emp
                         WHERE deptno=20);
                         
SELECT * FROM vm_emp20;
-- 가상이지만 테이블과 같은 구조를 가지므로 가상 테이블
              
-- 뷰 확인           
SELECT * FROM user_views;

CREATE VIEW vm_emp30all AS SELECT * FROM emp;

-- 생성된 뷰를 통해서 insert 작업(vm_emp30all)

INSERT INTO vm_emp30all VALUES(7777,'KIM','JUNKI','','2020/10/19',2650,'',20);

SELECT * FROM vm_emp30all;
SELECT * FROM emp;

--가상테이블 CREATE VIEW vm_emp30all AS SELECT * FROM emp 이런 식으로 만든 것은 본문도 수정이 허용되게 한 것임

-- 생성된 뷰에 수정이 가능한가?  소대문자 구분
SELECT * FROM user_updatable_columns WHERE table_name='VM_EMP30ALL'; --소문자는 아무것도 안나옴 대문자로해야함

SELECT * FROM user_updatable_columns WHERE table_name='VM_EMP_READ'; -- 소문자로 하니까 아무것도 안나오고 대문자로 하니까 나옴 

-- 뷰는 SELECT 만 가능하도로 생성
CREATE VIEW VM_EMP_READ AS SELECT EMPNO,ENAME,JOB FROM EMP WITH READ ONLY;

-- 뷰를 사용하는 목적?
-- 1.보안(원본 테이블이 가지고 있는 민감한 정보 제한)
SELECT * FROM emp; -- 민감한 정보 : sal. comm(돈에 관한 것)
-- 원본 테이블에는 민감한 정보들이 있다. 개발자라도 하더라도 민감한 정보를 보게 해둘 수 는 없기에 
-- 가상테이블 뷰를 만들어 원하는 정보만 뽑아내 수정가능하도록 하는 것임

-- 2. 서브쿼리, 조인과 같은 복잡한 쿼리 결과를 저장해서 사용하는 것
-- 뷰는 잘못하면 원본 테이블까지 손상(변경)되기 때문에 잘 사용해서 볼 수 만 있도록 해야한다.

-- 인덱스(INDEX) : 목차 / 색인이기 때문에 SELECT 문의 효능을 높임(무조건은 아님)
-- 오라클 데이터베이스 테이블 내의 원하는 레코드를 빠르게 찾아갈 수 있도록 만들어진 데이터구조

-- SCOTT 계정이 소유한 인덱스 정보 보기
SELECT * FROM user_indexes;
-- INDEX_NAME에 PK_(Primary Key)가 붙어있다면 각 행을 고유하게 식별하는 역할을 담당하며 주 키, 주 식별자로 불린다
-- FK_(Foreign Key)라면 자식 테이블이며 부모테이블은 이미 생성되어 있어한다. 외부키, 참조키, 외부식별자 등으로 불린다.

-- 기본키 생성 -> 자동 인덱스가 됨

-- 인덱스 생성(emp 테이블의 sal열에 인덱스 생성)
CREATE INDEX idx_emp_sql ON emp(sal);

SELECT * FROM emp WHERE sal=1250;

-- 기본키가 설정된 테이블 인덱스 확인
CREATE TABLE userTBL(
    userID char(8) NOT NULL PRIMARY KEY, 
    userName nvarchar2(10) NOT NULL,
    birthYEAR number(4) NOT NULL,
    mobile char(3));
    
SELECT index_name,uniqueness,index_type FROM user_indexes;

SELECT * FROM user_indexes;

-- 시퀀스(SEQUENCE) : 특정 규칙에 맞는 연속 숫자 생성할 때 사용 - 제일 많이 쓰는 개념 중 하나
-- 예) 게시글 번호, 상품 번호, 주문 번호.....

CREATE SEQUENCE DEPT_SEQ
INCREMENT BY 10  -- 증가를 얼마나 할것인가?
START WITH 10    -- 처음 시작 숫자를 의미
MAXVALUE 90      -- 마지막 숫자
MINVALUE 0       -- START 값보다 작게 설정
NOCYCLE CACHE 2; -- 반복하지 않음(CYCLE은 반복) / CACHE : 미리 생성할 것인지 여부(<=> NOCACHE)
-- 단독 개체/ 독립적임

-- 위의 시퀀스를 넣을 테이블 생성
CREATE TABLE DEPT_SEQ_TBL AS SELECT * FROM DEPT WHERE 1<>1;
-- 시퀀스를 이용해서 삽입
SELECT * FROM dept_seq_tbl;
INSERT INTO DEPT_SEQ_TBL VALUES(DEPT_SEQ.nextval,'DATABASE','SEOUL');
-- INSERT를 몇번이고 반복해서 넣으면 최대값으로 설정된 값을 넘었을 때 오류가 남
-- 실행을 시키면 최대값까지 넣은 것을 알 수 있음

-- 시퀀스 수정
ALTER SEQUENCE DEPT_SEQ INCREMENT BY 3 MAXVALUE 99 CYCLE; -- 99까지 갔다가 다시 0부터 시작

-- 마지막 발행된 시퀀스 확인하기
SELECT DEPT_SEQ.currval FROM DUAL;


-- 동의어(SYNONYM) : 공식 별칭
-- 테이블, 뷰, 시퀸스, 등 객체들에게 대신 사용할 수 있는 이름 부여

-- SYNONYM 생성
CREATE SYNONYM E FOR EMP;

-- 확인
SELECT * FROM E;

-- 제거
DROP SYNONYM E;

-- ========== PPT 실습 ===========

-- EMP 테이블과 같은 구조의 데이터를 저장하는 EMPIDX테이블을 생성하시오
CREATE TABLE EMPIDX AS SELECT * FROM EMP WHERE 1<>1;
DROP TABLE EMPIDX;

-- 생성한 EMPIDX 테이블의 EMPNO열에 IDX_EMPIDX_EMPNO 인덱스를 생성하시오
CREATE INDEX IDX_EMPIDX_EMPNO ON EMPIDX(EMPNO);

-- 인덱스가 잘 생성되었는지 데이터 사전 뷰를 통해 확인하시오
SELECT * FROM USER_INDEXES;

-- EMPIDX 테이블의 데이터 중 급여가 1500 초과인 사원들만 출력하는 EMPIDX_OVER15K뷰를 생성하시오
-- (사원번호, 사원이름, 직책, 부서번호, 급여, 추가수당 열을 가지고 있다)
CREATE VIEW EMPIDX_OVER15K AS (SELECT empno,ename,job,deptno,sal,comm
                         FROM EMPIDX
                         WHERE sal>1500);

SELECT * FROM EMPIDX_OVER15K;
DROP VIEW EMPIDX_OVER15K;

-- DEPT 테이블과 같은 열과 행 구성을 가지는 DEPTSEQ 테이블을 작성하시오
CREATE TABLE DEPTSEQ AS SELECT * FROM DEPT;

-- DEPTSEQ 테이블의 DEPTNO 열에 사용할 시퀀스를 아래에 제시된 특성에 맞춰 생성해보시오(PPT 실습 3 2번 그림 참조)
CREATE SEQUENCE DEPT_SEQ01
INCREMENT BY 1
START WITH 1
MAXVALUE 99
MINVALUE 1
NOCYCLE NOCACHE;

-- 생성된 시퀀스 조회해보시오
INSERT INTO DEPTSEQ VALUES(DEPT_SEQ01.nextval,'DATABASE','SEOUL');
SELECT * FROM deptseq;

