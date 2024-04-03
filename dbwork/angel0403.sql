--������ ����
--�⺻ 1���� 1�� �����ϴ� �������� �����ϰ� �⺻��ɾ �ָ��
CREATE SEQUENCE SEQ1;
--��ü ������ ��ȸ
SELECT * FROM SEQ;

--���� �������� �߻�:NEXTVAL
SELECT SEQ1.NEXTVAL FROM DUAL; --1�� ������ ���� �߻��Ѵ�

--10���� 5�� �����ϴ� �������� �����غ���, ĳ���� �⺻ 20�ε� ���ֺ���
CREATE SEQUENCE SEQ2 START WITH 10 INCREMENT BY 5 NOCACHE;

--SEQ2 ������ �߻����Ѻ���
SELECT SEQ2.NEXTVAL FROM DUAL;

--1���� 3�� ����, ĳ��0, �ƽ� 100
CREATE SEQUENCE SEQ3 START WITH 1 INCREMENT BY 3 NOCACHE MAXVALUE 100;

--SEQ3 ������ �߻����Ѻ���
SELECT SEQ3.NEXTVAL FROM DUAL;

--�������� ����
DROP SEQUENCE SEQ1;
DROP SEQUENCE SEQ2;
DROP SEQUENCE SEQ3;

--���� ���̺��� ����� ������ ����(1���� 1�� ����(����),CACHE 0)
CREATE SEQUENCE SEQ_TEST NOCACHE;

--������ ���̺� ����
CREATE TABLE HELLO(
  IDX NUMBER(3) PRIMARY KEY,
  IRUM VARCHAR2(20),
  AGE NUMBER(3)
); 

--���̺� ���� ���� : ALTER TABLE
-- IRUM �� ���̸� 20���� 30���� �����غ���
ALTER TABLE HELLO MODIFY IRUM VARCHAR2(30);

--ADDR �̶�� �÷��� �߰��غ���(���ڿ� ���̴� 100)
ALTER TABLE HELLO ADD ADDR VARCHAR2(100);

--AGE ��� �÷��� �����غ���
ALTER TABLE HELLO DROP COLUMN AGE;

--�÷��� ����(ADDR -> ADDRESS)
ALTER TABLE HELLO RENAME COLUMN ADDR TO ADDRESS;

--�÷� �ΰ� �߰��غ���
ALTER TABLE HELLO ADD BLOOD VARCHAR2(3);
ALTER TABLE HELLO ADD AGE NUMBER(3);

--����Ÿ�� �߰��غ���
INSERT INTO HELLO (IRUM) VALUES('LEE');--�����߻�,IDX�� PK�̹Ƿ� �ݵ�� ���� �־���Ѵ�

INSERT INTO HELLO (IDX,IRUM) VALUES(SEQ_TEST.NEXTVAL, 'LEE');
INSERT INTO HELLO (IDX,BLOOD,ADDRESS) VALUES (SEQ_TEST.NEXTVAL,'AB','���� ����');

--�÷��� ������ ���̺��� �÷� ������� ��簪�� ����Ѵ�
INSERT INTO HELLO VALUES (SEQ_TEST.NEXTVAL,'����','���ֵ� �ֿ���','O',23);

--����
--�̸��� '����'�� ����� �������� B������ �����غ���
UPDATE HELLO SET BLOOD= 'B' WHERE IRUM='����';
--IDX�� 2�� ����� IRUM, AGE �� �����غ���
UPDATE HELLO SET IRUM='��ȣ��', AGE=35 WHERE IDX=2;
--IDX�� 1�� ����� ADDRESS,BLOOD,AGE �� ���� �����ϼ���
UPDATE HELLO SET ADDRESS='�뱸', BLOOD='O', AGE=20 WHERE IDX=1;

--����

--IDX�� 1�λ�� ����
DELETE FROM HELLO WHERE IDX =1;
--AGE�� 30 �̻��� ����Ÿ�� ��� ����
DELETE FROM HELLO WHERE AGE>=30;

--���̺��� ����
DROP TABLE HELLO;
---------------------------------------------------------------------------
--���ο� ���̺� ����, �̹����� ���� ���������� �߰��ؼ� �����غ���
CREATE TABLE STUDENT (
   NUM NUMBER(3) CONSTRAINT PK_NUM PRIMARY KEY,
   STUNAME VARCHAR2(20) CONSTRAINT NN_NAME NOT NULL,
   SCORE NUMBER(3) CONSTRAINT CK_SCORE CHECK(SCORE>=1 AND SCORE<=100),
   BIRTHDAY DATE
);

--INSERT �� ����Ÿ �߰��� �ϴµ� ���� ������ �߻����Ѻ���
INSERT INTO STUDENT (NUM,STUNAME) VALUES (1,'��̸�');--����
-- ���� ORA-01400: NULL�� ("ANGEL"."STUDENT"."NUM") �ȿ� ������ �� �����ϴ�
INSERT INTO STUDENT (STUNAME,SCORE) VALUES ('�̹���',45);--����

--NUM �� PK(PK�� NOT NULL+UNIQUE)
-- ���� ORA-00001: ���Ἲ ���� ����(ANGEL.PK_NUM)�� ����˴ϴ�
INSERT INTO STUDENT (NUM,STUNAME) VALUES (1,'ȫ����');--����

-- ���� ORA-02290: üũ ��������(ANGEL.CK_SCORE)�� ����Ǿ����ϴ�
--SCORE �� ������ 1~100 �̶�� �Ѵ�
INSERT INTO STUDENT (NUM,STUNAME,SCORE) VALUES (1,'����ȣ',110);--����

--���� ���� ������Ÿ�� �߰��غ���
INSERT INTO STUDENT VALUES (3,'�̹���',89,SYSDATE);--��¥�� ���糯¥��
INSERT INTO STUDENT VALUES (4,'�����',100,'2010-12-20');
COMMIT;--COMMIT �� �ϴ� �ϸ� ROLLBACK �� �ȵȴ�

INSERT INTO STUDENT VALUES (5,'�չ̳�',56,'2019-05-20');--��¥�� ���糯¥��
INSERT INTO STUDENT VALUES (6,'������',98,SYSDATE);
INSERT INTO STUDENT VALUES (7,'������',68,'2015-05-20');
INSERT INTO STUDENT VALUES (8,'��ȣ��',66,'2016-05-10');
COMMIT;
ROLLBACK;--������ COMMIT �� ������ DML�۾��� ���� �ѹ�

--NUM �� 5���� ����Ÿ�� �̸��� '�չ̶�', SCORE �� 80���� ����
UPDATE STUDENT SET STUNAME='�չ̶�', SCORE=80 WHERE NUM=5;
--BIRTHDAY �� ���� 5�λ���� ������ �ϰ������� 85�� �����Ͻÿ�
UPDATE STUDENT SET SCORE=85 WHERE TO_CHAR(BIRTHDAY,'MM')='05';
COMMIT;

--NUM �� 7�� ����Ÿ ���� 
DELETE FROM STUDENT WHERE NUM =7;
--ROLLBACK �� ����Ÿ Ȯ���ϱ�
ROLLBACK;
--�ٽ� ������ ����
DELETE FROM STUDENT WHERE NUM =7;
--Ŀ���ϱ�
COMMIT;
--�ٽ� ROLLBACK �� ����Ÿ Ȯ���ϱ�
ROLLBACK;

--���ʿ��� �������� ����
ALTER TABLE STUDENT DROP CONSTRAINT CK_SCORE;
ALTER TABLE STUDENT DROP CONSTRAINT NN_NAME;

--���ο� �������� �߰�
ALTER TABLE STUDENT ADD CONSTRAINT UQ_NAME UNIQUE(STUNAME);

--���� �̸��� ����Ÿ�� �߰��غ���
INSERT INTO STUDENT (NUM,STUNAME) VALUES (10,'�̹���');

--������ ���� �� �������� ���̺��� �������ּ���
DROP SEQUENCE SEQ_TEST;
DROP TABLE STUDENT;
-----------------------------------------------------------------------------
/*
join ������ ���̺� 2�� �����ϱ�
���̺� #1:
      food - foodnum ����(3)
             foodname ���ڿ�(20)
             foodprice ����(7)
             foodsize ���ڿ�(20)
      
      booking - bnum pk ����(3)
                bname ���ڿ�(20) nn
                bhp   ���ڿ�(20) uq
                foodnum ����(3) - fk(food �� foodnum)
                bookingday date
                
     �ܺ�Ű�� ����Ȱ�� booking �� ����Ÿ�� �߰��� ���� �߰��� foodnum �� ������ �� ����
     (���� ��� �Խ����� ��۰��� ��� �ܺ�Ű�� ����Ǿ��ִµ�
       �̶��� ����� �޸���� �ش���� ������ �� ���� �Խ��ǵ��� �ִ�)
       -�׷��� ���� food �� ����Ÿ�� �����ϸ� �� �޴��� �߰��� ���� ����Ÿ��
        �ڵ����� ������Ű���� �Ұ�� booking �� �ܺ�Ű�� �����Ҷ� on delete cascade �� �ָ�ȴ�
*/

create table food(
   foodnum number(3) constraint pk_foodnum primary key,
   foodname VARCHAR2(20),
   foodprice number(7),
   foodsize VARCHAR2(20)
);

--�޴��� ����غ���
insert into food values (100,'¥���',9000,'����');
insert into food values (101,'¥���',11000,'�����');
insert into food values (200,'������',15000,'����');
insert into food values (201,'������',20000,'�����');
insert into food values (300,'ĥ������',15000,'��');
insert into food values (301,'ĥ������',30000,'��');
insert into food values (400,'�ع�«��',11000,'����');
commit;
select*from food;

--������ �߰�
create SEQUENCE seq_food nocache;

--booking ���̺� ����
create table booking(
   bnum number(3) constraint pk_bnum PRIMARY key,
   bname VARCHAR2(20) constraint nn_bname not null,
   bhp VARCHAR2(20) constraint uq_bhp unique,
   foodnum number(3),
   bookingday date,
   constraint fk_foodnum FOREIGN key(foodnum) REFERENCES food(foodnum)
);

--���� ���̺� ����Ÿ�� �߰��غ���
select * from booking;

insert into booking values(seq_food.nextval,'ȫ����','010-2222-3333',101,sysdate);
--�ڵ��� ���Ƽ� ����
insert into booking values(seq_food.nextval,'��ȣ��','010-2222-3333',101,sysdate);

insert into booking values(seq_food.nextval,'�̿���','010-2666-3256',301,sysdate+7);

insert into booking values(seq_food.nextval,'������','010-3434-8888',100,sysdate+3);

insert into booking values(seq_food.nextval,'�չ̳�','010-2321-9999',201,sysdate+3);
commit;


select * from booking;
--join ���� �����̺��� �����ؼ� ����Ͻÿ�
-- bnum,bname,bhp,foodnum,foodname,foodprice,foodsize,bookingday(yyyy-mm-dd)
 SELECT
 bnum,bname,bhp,b.foodnum,foodname,foodprice,foodsize,to_char(bookingday,'yyyy-mm-dd')bookingday
 FROM food f ,booking b
 WHERE f.foodnum=b.foodnum;
 
 --�ƹ��� �������� ���� food ������ ������ ������?
 select
   bnum,f.foodnum, foodname,foodprice,foodsize
   from food f, booking b
   where f.foodnum=b.foodnum(+) and bnum is null; --200,300 �޴��� �ƹ��� �ֹ�����
   
--food�� 200�� �޴��� ������ �ɱ��?
delete from food where foodnum=200; --�ƹ��� �ֹ��� ����� �����Ƿ� ��������

--food�� 100�� �޴��� ������ �ɱ��?
-- ���� ORA-02292: ���Ἲ ��������(ANGEL.FK_FOODNUM)�� ����Ǿ����ϴ�- �ڽ� ���ڵ尡 �߰ߵǾ����ϴ�
delete from food where foodnum=100; --100�� �޴��� �ֹ��� ���� �����Ƿ� ������ �� ����

--�θ� ���̺��� food �� �����غ���
drop table food; --�����߻�, �ڽ����̺��� ���� ���� �� �θ����̺��� �����ؾ߸� �Ѵ�
