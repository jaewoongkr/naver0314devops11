--시퀀스 생성
--기본 1부터 1씩 증가하는 시퀀스는 생략하고 기본명령어만 주면됨
CREATE SEQUENCE SEQ1;
--전체 시퀀스 조회
SELECT * FROM SEQ;

--다음 시퀀스값 발생:NEXTVAL
SELECT SEQ1.NEXTVAL FROM DUAL; --1씩 증가된 값이 발생한다

--10부터 5씩 증가하는 시퀀스를 생성해보자, 캐쉬가 기본 20인데 없애보자
CREATE SEQUENCE SEQ2 START WITH 10 INCREMENT BY 5 NOCACHE;

--SEQ2 값으로 발생시켜보자
SELECT SEQ2.NEXTVAL FROM DUAL;

--1부터 3씩 증가, 캐쉬0, 맥스 100
CREATE SEQUENCE SEQ3 START WITH 1 INCREMENT BY 3 NOCACHE MAXVALUE 100;

--SEQ3 값으로 발생시켜보자
SELECT SEQ3.NEXTVAL FROM DUAL;

--시퀀스도 제거
DROP SEQUENCE SEQ1;
DROP SEQUENCE SEQ2;
DROP SEQUENCE SEQ3;

--최종 테이블에서 사용할 시퀀스 생성(1부터 1씩 증가(생략),CACHE 0)
CREATE SEQUENCE SEQ_TEST NOCACHE;

--연습용 테이블 생성
CREATE TABLE HELLO(
  IDX NUMBER(3) PRIMARY KEY,
  IRUM VARCHAR2(20),
  AGE NUMBER(3)
); 

--테이블 구조 수정 : ALTER TABLE
-- IRUM 의 길이를 20에서 30으로 수정해보자
ALTER TABLE HELLO MODIFY IRUM VARCHAR2(30);

--ADDR 이라는 컬럼을 추가해보자(문자열 길이는 100)
ALTER TABLE HELLO ADD ADDR VARCHAR2(100);

--AGE 라는 컬럼을 제거해보자
ALTER TABLE HELLO DROP COLUMN AGE;

--컬럼명 변경(ADDR -> ADDRESS)
ALTER TABLE HELLO RENAME COLUMN ADDR TO ADDRESS;

--컬럼 두개 추가해보자
ALTER TABLE HELLO ADD BLOOD VARCHAR2(3);
ALTER TABLE HELLO ADD AGE NUMBER(3);

--데이타를 추가해보자
INSERT INTO HELLO (IRUM) VALUES('LEE');--에러발생,IDX는 PK이므로 반드시 값을 넣어야한다

INSERT INTO HELLO (IDX,IRUM) VALUES(SEQ_TEST.NEXTVAL, 'LEE');
INSERT INTO HELLO (IDX,BLOOD,ADDRESS) VALUES (SEQ_TEST.NEXTVAL,'AB','서울 역삼');

--컬럼명 생략시 테이블의 컬럼 순서대로 모든값을 줘야한다
INSERT INTO HELLO VALUES (SEQ_TEST.NEXTVAL,'이진','제주도 애월읍','O',23);

--수정
--이름이 '이진'인 사람의 혈액형을 B형으로 변경해보자
UPDATE HELLO SET BLOOD= 'B' WHERE IRUM='이진';
--IDX가 2인 사람의 IRUM, AGE 를 수정해보자
UPDATE HELLO SET IRUM='강호동', AGE=35 WHERE IDX=2;
--IDX가 1인 사람의 ADDRESS,BLOOD,AGE 의 값을 수정하세요
UPDATE HELLO SET ADDRESS='대구', BLOOD='O', AGE=20 WHERE IDX=1;

--삭제

--IDX가 1인사람 삭제
DELETE FROM HELLO WHERE IDX =1;
--AGE가 30 이상인 데이타는 모두 삭제
DELETE FROM HELLO WHERE AGE>=30;

--테이블을 제거
DROP TABLE HELLO;
---------------------------------------------------------------------------
--새로운 테이블 생성, 이번에는 각종 제약조건을 추가해서 생성해보자
CREATE TABLE STUDENT (
   NUM NUMBER(3) CONSTRAINT PK_NUM PRIMARY KEY,
   STUNAME VARCHAR2(20) CONSTRAINT NN_NAME NOT NULL,
   SCORE NUMBER(3) CONSTRAINT CK_SCORE CHECK(SCORE>=1 AND SCORE<=100),
   BIRTHDAY DATE
);

--INSERT 로 데이타 추가를 하는데 각종 에러를 발생시켜보자
INSERT INTO STUDENT (NUM,STUNAME) VALUES (1,'김미리');--성공
-- 오류 ORA-01400: NULL을 ("ANGEL"."STUDENT"."NUM") 안에 삽입할 수 없습니다
INSERT INTO STUDENT (STUNAME,SCORE) VALUES ('이미자',45);--오류

--NUM 은 PK(PK는 NOT NULL+UNIQUE)
-- 오류 ORA-00001: 무결성 제약 조건(ANGEL.PK_NUM)에 위배됩니다
INSERT INTO STUDENT (NUM,STUNAME) VALUES (1,'홍진주');--오류

-- 오류 ORA-02290: 체크 제약조건(ANGEL.CK_SCORE)이 위배되었습니다
--SCORE 의 범위는 1~100 이라야 한다
INSERT INTO STUDENT (NUM,STUNAME,SCORE) VALUES (1,'강동호',110);--오류

--오류 없는 정상데이타로 추가해보자
INSERT INTO STUDENT VALUES (3,'이미자',89,SYSDATE);--날짜는 현재날짜로
INSERT INTO STUDENT VALUES (4,'김민종',100,'2010-12-20');
COMMIT;--COMMIT 을 일단 하면 ROLLBACK 이 안된다

INSERT INTO STUDENT VALUES (5,'손미나',56,'2019-05-20');--날짜는 현재날짜로
INSERT INTO STUDENT VALUES (6,'강수지',98,SYSDATE);
INSERT INTO STUDENT VALUES (7,'김진우',68,'2015-05-20');
INSERT INTO STUDENT VALUES (8,'강호동',66,'2016-05-10');
COMMIT;
ROLLBACK;--마지막 COMMIT 한 이후의 DML작업에 대한 롤백

--NUM 이 5번인 데이타의 이름을 '손미라', SCORE 를 80으로 수정
UPDATE STUDENT SET STUNAME='손미라', SCORE=80 WHERE NUM=5;
--BIRTHDAY 의 월이 5인사람의 점수를 일괄적으로 85로 수정하시오
UPDATE STUDENT SET SCORE=85 WHERE TO_CHAR(BIRTHDAY,'MM')='05';
COMMIT;

--NUM 이 7인 데이타 삭제 
DELETE FROM STUDENT WHERE NUM =7;
--ROLLBACK 후 데이타 확인하기
ROLLBACK;
--다시 삭제문 실행
DELETE FROM STUDENT WHERE NUM =7;
--커밋하기
COMMIT;
--다시 ROLLBACK 후 데이타 확인하기
ROLLBACK;

--불필요한 제약조건 제거
ALTER TABLE STUDENT DROP CONSTRAINT CK_SCORE;
ALTER TABLE STUDENT DROP CONSTRAINT NN_NAME;

--새로운 제약조건 추가
ALTER TABLE STUDENT ADD CONSTRAINT UQ_NAME UNIQUE(STUNAME);

--같은 이름의 데이타를 추가해보자
INSERT INTO STUDENT (NUM,STUNAME) VALUES (10,'이미자');

--연습이 끝난 후 시퀀스랑 테이블은 삭제해주세요
DROP SEQUENCE SEQ_TEST;
DROP TABLE STUDENT;
-----------------------------------------------------------------------------
/*
join 연습용 테이블 2개 생성하기
테이블 #1:
      food - foodnum 숫자(3)
             foodname 문자열(20)
             foodprice 숫자(7)
             foodsize 문자열(20)
      
      booking - bnum pk 숫자(3)
                bname 문자열(20) nn
                bhp   문자열(20) uq
                foodnum 숫자(3) - fk(food 의 foodnum)
                bookingday date
                
     외부키로 연결된경우 booking 에 데이타가 추가된 이후 추가된 foodnum 은 삭제할 수 없다
     (예를 들어 게시판의 댓글같은 경우 외부키로 연결되어있는데
       이때도 댓글이 달린경우 해당글을 삭제할 수 없는 게시판들이 있다)
       -그런데 만약 food 의 데이타를 삭제하면 그 메뉴를 추가한 고객의 데이타도
        자동으로 삭제시키고자 할경우 booking 에 외부키를 설정할때 on delete cascade 를 주면된다
*/

create table food(
   foodnum number(3) constraint pk_foodnum primary key,
   foodname VARCHAR2(20),
   foodprice number(7),
   foodsize VARCHAR2(20)
);

--메뉴를 등록해보자
insert into food values (100,'짜장면',9000,'보통');
insert into food values (101,'짜장면',11000,'곱배기');
insert into food values (200,'탕수육',15000,'보통');
insert into food values (201,'탕수육',20000,'곱배기');
insert into food values (300,'칠리새우',15000,'소');
insert into food values (301,'칠리새우',30000,'대');
insert into food values (400,'해물짬뽕',11000,'보통');
commit;
select*from food;

--시퀀스 추가
create SEQUENCE seq_food nocache;

--booking 테이블 생성
create table booking(
   bnum number(3) constraint pk_bnum PRIMARY key,
   bname VARCHAR2(20) constraint nn_bname not null,
   bhp VARCHAR2(20) constraint uq_bhp unique,
   foodnum number(3),
   bookingday date,
   constraint fk_foodnum FOREIGN key(foodnum) REFERENCES food(foodnum)
);

--예약 테이블에 데이타를 추가해보자
select * from booking;

insert into booking values(seq_food.nextval,'홍범자','010-2222-3333',101,sysdate);
--핸드폰 같아서 오류
insert into booking values(seq_food.nextval,'강호동','010-2222-3333',101,sysdate);

insert into booking values(seq_food.nextval,'이영자','010-2666-3256',301,sysdate+7);

insert into booking values(seq_food.nextval,'박지민','010-3434-8888',100,sysdate+3);

insert into booking values(seq_food.nextval,'손미나','010-2321-9999',201,sysdate+3);
commit;


select * from booking;
--join 으로 두테이블을 조인해서 출력하시오
-- bnum,bname,bhp,foodnum,foodname,foodprice,foodsize,bookingday(yyyy-mm-dd)
 SELECT
 bnum,bname,bhp,b.foodnum,foodname,foodprice,foodsize,to_char(bookingday,'yyyy-mm-dd')bookingday
 FROM food f ,booking b
 WHERE f.foodnum=b.foodnum;
 
 --아무도 예약하지 않은 food 음식은 무엇이 있을까?
 select
   bnum,f.foodnum, foodname,foodprice,foodsize
   from food f, booking b
   where f.foodnum=b.foodnum(+) and bnum is null; --200,300 메뉴는 아무도 주문안함
   
--food의 200번 메뉴는 삭제가 될까요?
delete from food where foodnum=200; --아무도 주문한 사람이 없으므로 삭제가능

--food의 100번 메뉴는 삭제가 될까요?
-- 오류 ORA-02292: 무결성 제약조건(ANGEL.FK_FOODNUM)이 위배되었습니다- 자식 레코드가 발견되었습니다
delete from food where foodnum=100; --100번 메뉴를 주문한 고객이 있으므로 삭제할 수 없음

--부모 테이블인 food 를 삭제해보자
drop table food; --오류발생, 자식테이블을 먼저 삭제 후 부모테이블을 삭제해야만 한다
