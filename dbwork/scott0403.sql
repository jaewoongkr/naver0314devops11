-- ename �� 'a' �� 's'�� �����ϴ� ����� ename, sal,comm ��ȸ
SELECT ENAME, SAL, COMM FROM EMP WHERE ENAME LIKE 'A%' OR ENAME LIKE 'S%';
-- comm �� null �� �ƴѻ���� ��ȸ
SELECT * from emp where comm is not null;
--mgr �� 7698, 7566,7782 �� ��� ��ȸ (in ���)
SELECT * FROM emp where MGR IN(7698, 7566,7782);
--sal �� 2500���� 3000���� ��ȸ (and����)
SELECT * FROM emp where SAL >=2500 AND SAL<=3000;
--SAL �� 2500���� 3000���� ��ȸ (BETWEEN ���)
SELECT * FROM emp where SAL BETWEEN 2500 AND 3000;
--JOB �� �ߺ�ó���ؼ� �ѹ��� ���
SELECT JOB, COUNT(*) FROM EMP GROUP BY JOB;

--ALLEN�� ������ ���� ������ ���� ������� ��ȸ
SELECT ENAME, JOB FROM EMP WHERE JOB =(SELECT JOB FROM EMP WHERE ENAME = 'ALLEN');
--SCOTT �� MGR �� ���� ������ ���� ����� ���� ��ȸ
SELECT ENAME, JOB, MGR FROM EMP WHERE MGR =(SELECT MGR FROM EMP WHERE ENAME = 'SCOTT');

-----------------------------------------------------------------------------
--�����Լ�,�����Լ� ����
SELECT ABS(-5), ABS(5) FROM DUAL;--ABS : ���밪
SELECT CEIL(3.0),CEIL(3.1),CEIL(3.9) FROM DUAL; --CEIL: ������ �ø�
SELECT FLOOR(3.0),FLOOR(3.1),FLOOR(3.9) FROM DUAL; --FLOOR:������ ����
SELECT MOD(7,3),MOD(9,5) FROM DUAL; -- MOD: ������
SELECT POWER(2,3), POWER(3,4) FROM DUAL; --POWER: ������
SELECT ROUND (23.456,2), ROUND(8927,-1),ROUND(4567890,-4) FROM DUAL;--ROUND: �ݿø�

--�����Լ�
SELECT CONCAT('HAPPY','DAY') FROM DUAL; --CONCAT: ���� ���ϱ�
SELECT 'HAPPY'||'DAY' FROM DUAL;-- ���� ����� ����
SELECT INITCAP('HAPPY'),INITCAP('hello') FROM DUAL;--INITCAP: ù���ڸ� �빮�ڷ�
SELECT LOWER('heLLOdAy'), UPPER('heLLOdAy')FROM DUAL; --LOWER �ҹ��� / UPPER �빮��
SELECT LOWER(ENAME),INITCAP(ENAME) FROM EMP;
SELECT LPAD(SAL,10,'*') FROM EMP; --�������� * ä���
SELECT RPAD(SAL,10,'*') FROM EMP; --���������� * ä���
SELECT SUBSTR('HAPPY DAY',2,3) FROM DUAL; --2�� �ε������� 3����(ù���� ����Ŭ �ε����� 1, �ڹٴ� 0) : APP
SELECT SUBSTR('HAPPY DAY',-5,3) FROM DUAL;--�ڿ��� 5��°���� 3����(ù���� �ε����� 1): Y D 
SELECT ENAME,LENGTH(ENAME) ���ڼ� FROM EMP;--LENGTH: ����, ���ڼ�
SELECT REPLACE('GOOD DAY','O','*')FROM DUAL;--O�� *�� �����ؼ� ���
SELECT INSTR('HAPPY','A') FROM DUAL;--HAPPY �� A�� ��ġ : 2
SELECT INSTR('HAPPY','X') FROM DUAL;--X�� ������� 0
SELECT INSTR('HAVE A NICE DAY','NICE') FROM DUAL;--8��°�� NICE�� ����
SELECT TRIM('     HELLO   ') FROM DUAL;-- TRIM: �յڰ��� ����

--��Ÿ�Լ�
--NVL �� ���ϰ�� ��ü������ ���
SELECT NVL(COMM,1000) FROM EMP; -- NULL �ϰ�� 1000���� ���
--DECODE : ���� ���� �ٸ� ���� ����Ҷ�
SELECT ENAME �����, DEPTNO �μ��ڵ�,
 DECODE(DEPTNO, 10,'ȫ����',20,'������',30,'�λ��') �μ��� FROM EMP;
 
--JOIN : PPT 43������
--INNER JOPIN (��������),EQUI JOIN
 
 --���1
 SELECT
  EMP.EMPNO, EMP.ENAME, EMP.JOB, DEPT.DNAME, DEPT.LOC
 FROM EMP,DEPT
 WHERE EMP.DEPTNO=DEPT.DEPTNO;

--���2, �����̺� ���������� �ִ� �÷��� ��쿡�� �տ� ���̺���� ���̰� �������� ��������
 SELECT
  EMPNO,ENAME,JOB,DNAME,LOC
 FROM EMP,DEPT
 WHERE EMP.DEPTNO=DEPT.DEPTNO;
 
 --���3: ���̺���� �ʹ� ���� ��Ī�� ����� �� �ִ�
SELECT
  E.EMPNO,ENAME,JOB,DNAME,LOC
 FROM EMP E,DEPT D
 WHERE E.DEPTNO =D.DEPTNO;


