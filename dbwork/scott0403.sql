-- ename 이 'a' 나 's'로 시작하는 사람의 ename, sal,comm 조회
SELECT ENAME, SAL, COMM FROM EMP WHERE ENAME LIKE 'A%' OR ENAME LIKE 'S%';
-- comm 이 null 이 아닌사람만 조회
SELECT * from emp where comm is not null;
--mgr 이 7698, 7566,7782 인 사람 조회 (in 사용)
SELECT * FROM emp where MGR IN(7698, 7566,7782);
--sal 이 2500부터 3000까지 조회 (and연산)
SELECT * FROM emp where SAL >=2500 AND SAL<=3000;
--SAL 이 2500부터 3000까지 조회 (BETWEEN 사용)
SELECT * FROM emp where SAL BETWEEN 2500 AND 3000;
--JOB 을 중복처리해서 한번씩 출력
SELECT JOB, COUNT(*) FROM EMP GROUP BY JOB;

--ALLEN의 직업과 같은 직업을 가진 사람들을 조회
SELECT ENAME, JOB FROM EMP WHERE JOB =(SELECT JOB FROM EMP WHERE ENAME = 'ALLEN');
--SCOTT 의 MGR 과 같은 값으로 가진 사람의 정보 조회
SELECT ENAME, JOB, MGR FROM EMP WHERE MGR =(SELECT MGR FROM EMP WHERE ENAME = 'SCOTT');

-----------------------------------------------------------------------------
--숫자함수,문자함수 연습
SELECT ABS(-5), ABS(5) FROM DUAL;--ABS : 절대값
SELECT CEIL(3.0),CEIL(3.1),CEIL(3.9) FROM DUAL; --CEIL: 무조건 올림
SELECT FLOOR(3.0),FLOOR(3.1),FLOOR(3.9) FROM DUAL; --FLOOR:무조건 내림
SELECT MOD(7,3),MOD(9,5) FROM DUAL; -- MOD: 나머지
SELECT POWER(2,3), POWER(3,4) FROM DUAL; --POWER: 지수승
SELECT ROUND (23.456,2), ROUND(8927,-1),ROUND(4567890,-4) FROM DUAL;--ROUND: 반올림

--문자함수
SELECT CONCAT('HAPPY','DAY') FROM DUAL; --CONCAT: 문자 더하기
SELECT 'HAPPY'||'DAY' FROM DUAL;-- 위와 결과가 같다
SELECT INITCAP('HAPPY'),INITCAP('hello') FROM DUAL;--INITCAP: 첫글자만 대문자로
SELECT LOWER('heLLOdAy'), UPPER('heLLOdAy')FROM DUAL; --LOWER 소문자 / UPPER 대문자
SELECT LOWER(ENAME),INITCAP(ENAME) FROM EMP;
SELECT LPAD(SAL,10,'*') FROM EMP; --왼쪽으로 * 채우기
SELECT RPAD(SAL,10,'*') FROM EMP; --오른쪽으로 * 채우기
SELECT SUBSTR('HAPPY DAY',2,3) FROM DUAL; --2번 인덱스부터 3글자(첫글자 오라클 인덱스는 1, 자바는 0) : APP
SELECT SUBSTR('HAPPY DAY',-5,3) FROM DUAL;--뒤에서 5번째부터 3글자(첫글자 인덱스는 1): Y D 
SELECT ENAME,LENGTH(ENAME) 글자수 FROM EMP;--LENGTH: 길이, 글자수
SELECT REPLACE('GOOD DAY','O','*')FROM DUAL;--O를 *로 변경해서 출력
SELECT INSTR('HAPPY','A') FROM DUAL;--HAPPY 에 A의 위치 : 2
SELECT INSTR('HAPPY','X') FROM DUAL;--X가 없을경우 0
SELECT INSTR('HAVE A NICE DAY','NICE') FROM DUAL;--8번째에 NICE가 있음
SELECT TRIM('     HELLO   ') FROM DUAL;-- TRIM: 앞뒤공백 제거

--기타함수
--NVL 은 널일경우 대체값으로 출력
SELECT NVL(COMM,1000) FROM EMP; -- NULL 일경우 1000으로 출력
--DECODE : 값에 따라 다른 값을 출력할때
SELECT ENAME 사원명, DEPTNO 부서코드,
 DECODE(DEPTNO, 10,'홍보부',20,'교육부',30,'인사부') 부서명 FROM EMP;
 
--JOIN : PPT 43페이지
--INNER JOPIN (내부조인),EQUI JOIN
 
 --방법1
 SELECT
  EMP.EMPNO, EMP.ENAME, EMP.JOB, DEPT.DNAME, DEPT.LOC
 FROM EMP,DEPT
 WHERE EMP.DEPTNO=DEPT.DEPTNO;

--방법2, 두테이블에 공통적으로 있는 컬럼일 경우에만 앞에 테이블명을 붙이고 나머지는 생략가능
 SELECT
  EMPNO,ENAME,JOB,DNAME,LOC
 FROM EMP,DEPT
 WHERE EMP.DEPTNO=DEPT.DEPTNO;
 
 --방법3: 테이블명이 너무 길경우 별칭을 사용할 수 있다
SELECT
  E.EMPNO,ENAME,JOB,DNAME,LOC
 FROM EMP E,DEPT D
 WHERE E.DEPTNO =D.DEPTNO;


