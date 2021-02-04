< 오라클 11g >

[ PART 1 - 설치 및 접근법 ]

1. 오라클 설치(11g)
   (1) 디렉토리 이름이 '한글'이면 X
       1) Oracle 설치파일이 존재하는 경로에 한글X
       2) Oracle 설치경로에 한글X
       
   (2) 디렉토리에 '공백'이 있으면 X
       1) Oracle 설치 파일이 존재하는 경로에 공백X
       2) Oracle 설치 경로에 공백X

   (3) Windows 계정이 한글 이름이면 X

   (4) 설치시에 에러 해결 방법 
       1) OS부터 밀고 다시 설치 
       2) Oracle 를 다시 설치 
          <1> 제어판 -> 프로그램 추가제거 -> 관련 프로그램 제거
	  <2> 관리도구 -> 서비스 -> 오라클 관련 서비스들을 정지
	  <3> Oracle 설치 디렉토리를 삭제
	     (만약, 삭제 안되면 '안전모드'에서 삭제 )
	  <4> 시작 -> 모든 프로그램에서 -> Oracle관련 메뉴 삭제 
	  <5> 실행 -> regedit -> oracle관련 파일을 모두 제거 
	  <6> 다시 설치

2. 오라클 접근법 
   (1) sqlplus 이용법 
      ex) 실행 -> sqlplus scott/tiger 
      
   (2) utility application 이용법 ( local / remote 관리 )
       1) sqlgate 
       2) toad 
       3) orange 
       4) SQL Developer 
          ..........

[ PART 2 - ORACLE 개요 ]
1. DBMS ( DataBase Management System )의 개념 
   (1) DB ( DataBase )
       - 지속적으로 유지 관리해야 할 '데이터의 집합' 

   (2) DBMS 
       - DB를 효율적으로 '관리'하고, 효율적으로 '저장'하고
         '검색'할 수 있는 환경을 제공해 주는 '시스템 소프트웨어' 
	 ( ex: Oracle, Ms-sql, MySql, Db2, 사이베이스, ... )

2. DBMS 역사 
   (1) 1960 : File System
   (2) 1970 : Network-DBMS 
   (3) 1980 : 관계형-DBMS ( RDBMS )
   (4) 1990 : 관계형-DBMS, 객체관계형( ORDBMS )
   (5) 2000 : 관계형/객체관계형/객체지향  

       ex) oracle 6.X, 7.X -> 관계형 
           oracle 8.X, 11.X -> 객체관계형 

3. 데이터베이스 설계
   실세계(업무분석) -> '개'념적 모델링 -> '논'리적 모델링 -> '물'리적 모델링 -> SQL작성 
         ( 'Entity'와 'Attribute') ( ERD 생성 ) ( 구체적인 DBMS 결정 )

4. SQL ( Structured Query Language )

5. 기본 사용자 계정 
   (1) SYS
       오라클 'super' 사용자 ID이며, 데이터베이스에서 발생하는 
        '모든 문제'를 처리할 수 있는 권한 

   (2) SYSTEM 
       SYS과 같은데, 차이는 데이터베이스를 생성할 수 있는 권한이 없음 

   (3) SCOTT 
       처음 오라클을 사용하는 user들을 위한 SAMPLE 계정이며, 
       일반적으로 프로그램을 작성할 때 사용되는 수준의 
       권한( for Developer )을 가진 계정이다. 

6. 주요 용어 
   (1) TABLE 
       관계형 DBMS에서 기본 데이터 저장 구조로써 'Entity(실체)'의 
       집합 저장소 ( ex: DEPT, EMP, SALGRADE, BONUS, ... ) 

   (2) ROW 
       테이블의 행 ( 하나의 유효한 데이터 ) 즉, Entity(실체)
       (ex : 10 ACCOUNTING     NEW YORK  )

   (3) COLUMN  
       테이블의 열명 ( Attibute 가 COLUMN이 됨 ) 
       (ex : DEPTNO,  DNAME, LOC )

   (4) PRIMARY-KEY
       테이블에서 각 ROW를 유일하게 구분하는 COLUMN 에 
       부여되는 '제약조건( Constraint )'
       (ex: PK_DEPT )

   (5) FOREIGN-KEY ( == 참조키, 외래키 )
       다른 테이블의 COLUMN값을 참조하는 테이블의 COLUMN에 
       부여되는 '제약조건' [ cf) 참조 무결성 ]
       (ex: FK_DEPTNO )
   
   (6) FIELD 
       테이블에서 ROW와 COLUMN이 교차하는 데이터 
       (ex: DEPT에서 'SALES' )

   (7) NULL 
       데이터가 존재하지 않는 FIELD 

      ex) scott 계정의 table 
         - DEPT : 부서 테이블  
	 - EMP  : 사원 테이블

7. SQL의 구분 
   (1) DQL( Data Query Language )
       -> 테이블의 데이터를 '조회'할 때 
       ( ex: select~ )
   (2) DML( Data Manipulation Language )
       -> 테이블의 '입력', '수정', '삭제'할 때 
       ( ex: insert~, update~, delete~ )
   (3) DDL ( Data Definition Language )
       -> 객체들을 생성, 변경, 삭제 등을 할 때 
       ( ex: create~, alter~, drop~, ... )
   (4) TCL ( Transaction Control Language )
       -> DML문을 DB에 저장 or 취소할 때 
       ( ex: commit, rollback, savepoint~ )

       cf) Transaction: 분리되어서는 안될 (논리적인) '작업 단위'
   (5) DCL ( Data Control Language ) 
       -> DB 계정에게 권한을 '부여'or '취소'할 때 
       ( ex: grant~ , revoke~ )

8. PL-SQL
   제어문(조건문, 반복문)이 들어있는 SQL로써 오라클 DBMS에서 지원하는 
   확장된 SQL 
   (1) Stored Procedure
       -> 일련의 작업처리순서를 정의해 놓은 것으로 
         미리 DBMS에 컴파일되어져있어 프로그램 or 사용자로부터 
	 호출되면 실행되는 일종의 '작업처리순서' 
   (2) Anonymous Procedure 
       -> Stored Procedure 와의 차이점은 'DBMS에 자동으로 포함'되어 
         내부적으로 호출되는 프로시져 
   (3) Stored Function 
       -> 프로시져와 차이점은 'return값'이 존재해야 함 
   (4) Trigger 
       -> 어떤 조건에 만족되어지는 상황(DML)이 발생되면 
         자동으로 호출되어 작동되는 로직 
   (5) Package 
       -> 위의 것들을 기능별 묶어놓은 꾸러미 

[ PART 3 - SQL ]
1. DQL
   #1-1 Base
   (1) 기본
       SQL> select * from tab;
       SQL> select TABLE_NAME from user_tables;
       SQL> desc dept
       SQL> select DNAME, LOC from DEPT;
       SQL> select * from DEPT;

   (2) all / distinct
       SQL> select JOB from EMP;
       SQL> select all JOB from EMP;
       SQL> select distinct JOB from EMP;


   (3) order by
       -- 모든 사원들의 사번과 급여를 출력
       SQL> select EMPNO, SAL from EMP;
       -- 모든 사원들의 사번과 급여를 출력( 급여가 낮은 순)
       SQL> select EMPNO, SAL from EMP order by SAL; -- asc
       -- 모든 사원들의 사번과 급여를 출력( 급여가 높은 순)
       SQL> select EMPNO, SAL from EMP order by SAL desc;
       -- 모든 사원의 사번과 급여를 출력 ( 급여가 높은 순, 같은 급여일땐 EMPNO오름차순 )
       SQL> select EMPNO, SAL from EMP order by SAL desc, EMPNO;

       -- 모든 사원의 사번과 커미션을 출력( 커미션 낮/높 순 )
       SQL> select EMPNO, COMM from EMP order by COMM; -- null이 뒤로 
       SQL> select EMPNO, COMM from EMP order by COMM desc; -- null이 앞으로
       
       -- (null 제외한) 모든 사원의 사번과 커미션을 출력
       SQL> select EMPNO, COMM from EMP where COMM is not null;
       -- (null 제외한) 모든 사원의 사번과 커미션을 출력(단, 커미션이 높은 순으로)
       SQL> select EMPNO, COMM from EMP where COMM is not null 
           order by COMM desc;

       -- 직업에 대해서 오름차순 정렬한 후, 급여가 높은 순으로 정렬
       SQL> select JOB, SAL from EMP order by JOB, SAL desc;

  (4) ALIAS   
       SQL> select JOB "직업", SAL "급여" from EMP;
       SQL> select JOB as "직업", SAL as "급여" from EMP;
       SQL> select JOB 직업, SAL 급여 from EMP;
       SQL> select JOB 직업, SAL "1234" from EMP;
       SQL> select JOB 직업, SAL "!@#$" from EMP;

        cf) 숫자 or 특수문자 or 공백포함 되면 ""로 묶어줘야 함 

  (5) where
       -- 부서번호가 20인 사원의 사번과 부서번호를 출력
       SQL> select EMPNO, DEPTNO from EMP where DEPTNO=20;

       -- 30번 부서인 부서번호와 급여와 사번을 출력하라(단, 급여가 높으로 순)
       SQL> select DEPTNO, SAL, EMPNO from EMP 
             where DEPTNO=30 order by SAL desc;

       -- 입사일이 81년 12월 3일이후의 사번과 이름과 입사일과 부서번호 출력
         -- (단, 사번의 내림차순)
       SQL> select EMPNO, ENAME, HIREDATE, DEPTNO from EMP
           where HIREDATE>='81/12/03' order by EMPNO desc;

       -- 입사일이 81년 12월 3일이후의 사번과 이름과 입사일과 부서번호 출력
         -- (단.. 사번의 내림차순, 20번부서만 출력)
       SQL> select EMPNO, ENAME, HIREDATE, DEPTNO from EMP
           where HIREDATE>='81/12/03' and DEPTNO=20 
	   order by EMPNO desc;

  (6) 연산자( Operator )
      1) 산술연산자( *, /, +, - ) 
       --30번 부서 사원의 급여를 10% 인상해서 사번(EMPNO)과 급여(SAL)를 출력
       SQL> select EMPNO, SAL*1.1 from EMP where DEPTNO=30;

       --30번 부서 사원의 '연말보너스'를 이름과 연말보너스를 출력(연말보너스가 높은 순) 
       -- ( 단, 연말보너스는 급여의 2배와 커미션의 1/2의 합이다.)
       SQL> select ENAME, SAL, COMM from EMP where DEPTNO=30;
       SQL> select ENAME, SAL, NVL(COMM,0) from EMP where DEPTNO=30;
       SQL> select ENAME, SAL*2+NVL(COMM,0)/2 "연말보너스" from EMP 
            where DEPTNO=30 order by "연말보너스" desc;

      2) 비교연산자 ( =, != , >, >=, <, <= )
       -- 급여가 950인 사원의 이름(ENAME)과 급여(SAL)를 출력
       SQL> select ENAME, SAL from EMP where SAL=950;

       -- 급여가 3000 이상인 사원의 이름(ENAME)과 급여(SAL)를 출력
       SQL> select ENAME, SAL from EMP where SAL>=3000;

       -- 30부서가 아닌 사원의 이름(ENAME)과 급여(SAL)와 부서번호(DEPTNO)를 출력
	   -- (부서번호의 오름차순, 높은 급여순, 이름 오름차순)
       SQL> select ENAME, SAL, DEPTNO from EMP where DEPTNO!=30
          order by DEPTNO, SAL desc, ENAME;

     3) 논리연산자 ( and(곱), or(합), not )	
       -- 20번 부서이면서 급여 3000이상인 사원의 이름, 급여, 부서번호를 출력
       SQL> select ENAME, SAL, DEPTNO from EMP where DEPTNO=20 and SAL>=3000;

       -- 직업이 'SALESMAN'이고 부서번호가 30번인 이름, 직업, 부서번호를 출력
       SQL> select ENAME, JOB, DEPTNO from EMP where DEPTNO=30 and JOB='SALESMAN';

       -- 급여가 1000 미만이거나, 4000 이상인 사원의 사번, 급여를 출력
       SQL> select EMPNO, SAL from EMP where SAL<1000 or SAL>=4000;

       -- 급여가 1000 이상 4000 미만인 사원의 사번, 급여를 출력
       SQL> select EMPNO, SAL from EMP where not (SAL<1000 or SAL>=4000);

     cf1) 사원(EMP) 컬럼 
         EMPNO  -- 사번                                    
	 ENAME  -- 이름                                             
	 JOB    -- 직업                                            
	 MGR    -- 관리자                                              
	 HIREDATE -- 입사일                                         
	 SAL    -- 급여                                             
	 COMM   -- 커미션                                            
	 DEPTNO -- 부서번호 

     cf2) 부서(DEPT) 컬럼 
         DEPTNO -- 부서번호
	 DNAME  -- 부서이름 
	 LOC    -- 부서위치 

	-- 팀단위로 한사람에 3개씩 문제를 만들어서 서로 풀어보기 

     4) SQL연산자 ( in, any, all, between, like, is null, is not null, exists, ...)
	-- 부서번호가 10 or 20 or 100 인 사원의 부서번호과 이름을 출력
        SQL> select ENAME, DEPTNO from EMP where DEPTNO=10 or DEPTNO=20 or DEPTNO=100;
	SQL> select ENAME, DEPTNO from EMP where DEPTNO in(10, 20, 100);
	SQL> select ENAME, DEPTNO from EMP where DEPTNO=any(10, 20, 100);

        -- 30부서의 최대 급여보다 더 큰 급여를 받는 사원의 이름, 급여 출력
	SQL> select SAL from EMP where DEPTNO=30; 	
	SQL> select ENAME, SAL from EMP 
	     where SAL>all(select SAL from EMP where DEPTNO=30);
	     -- all은 전체값을 모두 만족시켜야 하는 연산자 

	-- 급여가 1100 이상 3000 이하인 사원의 이름과 급여 출력
	SQL> select ENAME, SAL from EMP where SAL>=1100 and SAL<=3000;
	SQL> select ENAME, SAL from EMP where SAL between 1100 and 3000;
	
	-- 이름이 'FORD'와 'SCOTT' 사이의 사원 이름을 출력!(단, 알파벳 순 정렬) 
	SQL> select ENAME from EMP where ENAME>='FORD' and ENAME<='SCOTT' order by ENAME;
	SQL> select ENAME from EMP where ENAME between'FORD' and 'SCOTT' order by ENAME;

	-- 이름이 'J'로 시작되는 사원 이름을 출력(단, 오름차순 정렬)
	SQL> select ENAME from EMP where ENAME like 'J%' order by ENAME;

	-- 이름에 'T'가 들어있는 사원 이름을 출력
	SQL> select ENAME from EMP where ENAME like '%T%' order by ENAME;

	-- 이름에 세번째 문자가 'A'인 사원의 이름을 출력
	SQL> select ENAME from EMP where ENAME like '__A%' order by ENAME;

	-- 급여의 십의 자리가 5인 사원의 급여를 출력
	SQL> select SAL from EMP where SAL like '%5_';

	-- 커미션이 NULL인 사원의 사번과 커미션을 출력 
	SQL> select EMPNO, COMM from EMP where COMM is null;

	-- 커미션이 NULL이 아닌 사원의 사번과 커미션을 출력
	SQL> select EMPNO, COMM from EMP where COMM is not null;

	-- 이름이 'FORD'라는 사원이 존재하면 모든 사원의 이름을 출력
	SQL> select ENAME from EMP where ENAME='FORD';
	SQL> select ENAME from EMP where exists(select ENAME from EMP where ENAME='FORD');	

        -- 이름이 'AAA'라는 사원이 존재하면 모든 사원의 이름을 출력
	SQL> select ENAME from EMP where exists(select ENAME from EMP where ENAME='AAA');
	
    5) 결합연산자 ( || )
        SQL> select ENAME||'의 급여는 ', SAL||'입니다' from EMP;

    6) 집합연산자 ( union, union all, intersect, minus )
       -- 사원의 사번과 이름 출력하고, 부서의 번호와 부서이름을 출력
       SQL> select EMPNO, ENAME from EMP
	    union
            select DEPTNO, DNAME from DEPT;

       -- 사원의 사번과 이름 출력하고, 사원의 사번과 이름 출력 
       SQL> select EMPNO, ENAME from EMP
            union
            select EMPNO, ENAME from EMP; --14개 

       SQL> select EMPNO, ENAME from EMP
            union all
            select EMPNO, ENAME from EMP; --28개 

       SQL> select EMPNO, ENAME from EMP
	    intersect
            select DEPTNO, DNAME from DEPT; --0개 

       SQL> select EMPNO, ENAME from EMP
            intersect
            select EMPNO, ENAME from EMP where DEPTNO=20; --5개 

       SQL> select EMPNO, ENAME from EMP
            minus
            select EMPNO, ENAME from EMP where DEPTNO=20; --9개 
 
  (7) 연산자 우선순위 
     1) 1순위: 비교, SQL, 산술 
     2) 2순위: NOT 
     3) 3순위: AND 
     4) 4순위: OR 
     5) 5순위: 결합, 집합 

       SQL> select ENAME, SAL from EMP
	    where NOT SAL>1000 and SAL<3000;
       SQL> select ENAME, SAL from EMP
	    where NOT (SAL>1000 and SAL<3000);

   cf) SQL문장의 실행법 
      1) 문장의 끝에 ;을 붙여주는 enter!
      2) 문장의 다음 라인에 /를 붙여주고 enter!
      3) 가장 최근(직전)의 버퍼에 담긴 SQL 문장을 실행
          SQL> run
      4) 버퍼의 SQL보기 / 편집 
          SQL> edit
          [1] 메모리 버퍼의 내용이 메모장으로 확인 
	  [2] 수정
	  [3] 저장 
	  [4] run 


   #1-2. 함수( function )
   (1) 함수(function) 란 ? (처리/반환)
       어떠한 일을 수행하는 기능으로써 주어진 인수(argument)
       를 재료로 '처리'를 하여 그 결과를 '반환'하는 일을 수행 

   (2) 함수 기능의 구체적 표현 
      1) Data에 대한 '계산' 
      2) Data를 다른 형태로 '변환'
      3) Data의 결과를 '출력'

   (3) 함수의 종류 
      1) 단일행 함수 (ex: nvl, .. )
         -> 하나의 행(row)당, 하나의 결과값을 리턴하는 함수 
	 SQL> select ename, nvl(comm, 0) from emp where comm is null;

      2) 복수행 함수 (ex: max, min, avg, .. ) 
         -> 여러개의 행(row)당, 하나의 결과값을 리턴하는 함수 
         SQL> select avg(SAL) from EMP;

   (4) 단일행 함수 
      1) 문자 함수 
        <1> chr(아스키코드)
	    SQL> select chr(65) from dual;

	<2> concat(컬럼명, '붙일문자열')
	   SQL> select ENAME||' is a ' ||JOB from EMP;
	   SQL> select concat(ENAME, ' is a '), JOB from EMP;

	<3> initcap('문자열')
	   SQL> select initcap('the lion') from dual;
	   INITCAP 함수는 매개변수로 들어오는 char의 첫 문자는 대문자로, 나머지는 소문자로 반환하는 함수다

	<4> lower('문자열')
	   SQL> select lower('MY NAME IS KHS') from dual;
           SQL> select lower(ename) from emp;

	<5> LPAD('문자열1', 자리수, '문자열2')

	    LPAD 함수는 지정한 길이 만큼 왼쪽부터 특정문자로 채워준다.
	    - 함수  :  LPAD("값", "총 문자길이", "채움문자")

	   SQL> select LPAD('khs', 13, '*#') from DUAL;
	   SQL> select LPAD('khs', 13, ' ') from DUAL;

	<6> RPAD('문자열1', 자리수, '문자열2')
	   SQL> select RPAD('khs', 13, '*#') from DUAL;

	<7> LTRIM('문자열1', '문자열2')
           SQL> select LTRIM('xyxXxyLAST WORDxy', 'xy') from DUAL;
           SQL> select LTRIM('xyyXxyLAST WORDxy', 'xy') from DUAL;
           SQL> select LTRIM('     LAST WORDxy', ' ') from DUAL;
	   SQL> select LTRIM('     LAST WORDxy') from DUAL;

	<8> RTRIM('문자열1', '문자열2')
           SQL> select RTRIM('xyxXxyLAST WORDxy', 'xy') from DUAL;
	   SQL> select RTRIM('xyxXxyLAST WORDxyx', 'xy') from DUAL;
	   SQL> select RTRIM('WORD  ', ' ') from DUAL;
	   SQL> select RTRIM('WORD  ') from DUAL;
	   SQL> select length('WORD   ') from dual;
	   SQL> select length(rtrim('WORD   ')) from dual;

	<9> REPLACE('문자열1', '문자열2', '문자열3')
	   SQL> select 'JACK and JUE' from DUAL;
	   SQL> select replace('JACK and JUE', 'J','BL') from DUAL;
	   SQL> select DNAME from DEPT;
	   SQL> select replace(DNAME, 'A', 'i') from DEPT;

	<10> SUBSTR('문자열', 자리수, 갯수)
	   SQL> select SUBSTR('ABCDEFG', 3, 2) from DUAL;

	   -- ename의 두번째 자리가 'A'인 사원의 이름을 출력
	   SQL> select ENAME from EMP where ENAME like '_A%';
	   SQL> select ENAME from EMP where substr(ENAME,2,1)='A';

	<11> ASCII('문자')
	   SQL> select ascii('A') from dual;
	   SQL> select ASCII('"') from DUAL;
	   SQL> select ASCII('#') from DUAL;
	   SQL> select ASCII('3') from DUAL;

	<12> LENGTH('문자열')
	   SQL> select length('진달래 꽃') from DUAL; 
	   SQL> select length('abC D') from DUAL;

	<13> GREATEST('문자열1', '문자열2', '문자열3')
	   SQL> select GREATEST('CC', 'ABCDE', 'CA') from DUAL;
	   SQL> select GREATEST('12', '132', '119') from DUAL;
	   SQL> select GREATEST('가나', '가다', '가자') from DUAL; 

	<14> LEAST('문자열')
	   SQL> select LEAST('CC', 'ABCDE', 'CA') from DUAL; 
           SQL> select LEAST('12', '132', '119') from DUAL;
           SQL> select LEAST('가나', '가다', '가자') from DUAL;

	<15> INSTR('문자열1', '문자열2', 자리수1, 자리수2)
	   SQL> select INSTR('CORPORATE FLOOR', 'OR', 3, 2) from DUAL;
           SQL> select INSTR('CORPORATE FLOOR', 'OR', 6, 1) from DUAL;

	   cf) '자리수1'부터 '자리수2'번째의 '문자열2'를 찾음

	<16> NVL(컬럼명, 숫자) ** 
	   SQL> select ENAME, NVL(COMM, 100) from EMP; 
	   SQL> select ENAME, NVL(COMM, 0) from EMP;

     2) 숫자 함수
        <1> ABS(숫자)  
	   SQL> select ABS(-15) from DUAL;

	<2> CEIL(숫자)
	   SQL> select CEIL(11.012) from DUAL;
	   SQL> select CEIL(-11.012) from DUAL;

	<3> FLOOR(숫자)
	   SQL> select FLOOR(12.999) from DUAL;
	   SQL> select FLOOR(-12.999) from DUAL;

	<4> ROUND(숫자)
	   SQL> select ROUND(12.5) from DUAL;
	   SQL> select ROUND(-12.5) from DUAL;

	<5> COS(숫자[rad]) 
	   SQL> select cos(90 * 3.141592653589793/180) from dual;

	<6> SIN(숫자[rad]) 
	   SQL> select sin(90 * 3.141592653589793/180) from dual;

	<7> TAN(숫자[rad])
           SQL> select TAN(45 * 3.141592653589793/180) from DUAL;

	<8> EXP(숫자)
	   SQL> select EXP(2) from dual;

	<9> LOG(숫자1, 숫자2)
	   SQL> select LOG(10, 100) from dual;

	<10> MOD(숫자1, 숫자2)
	   SQL> select mod(11,4) from dual;

	<11> POWER(숫자1, 숫자2)
	   SQL> select power(3, 3) from dual;

	<12> TRUNC(숫자1, 숫자2)
	   SQL> select TRUNC(15.789, 2) from DUAL;
	   SQL> select TRUNC(15.789, 0) from DUAL;
	   SQL> select TRUNC(-15.789, 2) from DUAL;

      3) 날짜 함수 (***)
        <1> SYSDATE
           SQL> select SYSDATE from dual;

	<2> ADD_MONTHS(날짜컬럼 or 날짜데이터, 숫자)
	   SQL> select HIREDATE from EMP where EMPNO=7782;
	   SQL> select HIREDATE, ADD_MONTHS(HIREDATE, 7) from EMP where EMPNO=7782;
	   SQL> select ADD_MONTHS('90/11/04', 2) from DUAL;

	<3> LAST_DAY(날짜컬럼 or 날짜데이터)
	   SQL> select LAST_DAY('19/10/29') from DUAL;
	   SQL> select hiredate, LAST_DAY(hiredate) from EMP;	

	<4> NEW_TIME(날짜컬럼or날짜데이터, 'GMT', 'PDT')
	   SQL> select NEW_TIME('08/12/04', 'GMT', 'PDT') from DUAL;
           SQL> select hiredate, NEW_TIME(hiredate, 'GMT', 'PDT') from EMP;

        <5> MONTHS_BETWEEN(날짜컬럼or날짜데이터1, 날짜컬럼or날짜데이터2)
	   SQL> select MONTHS_BETWEEN('80/01/02', '81/02/04') from DUAL;
	   -- empno가 7782인 사원의 현재까지의 근무월수
	   SQL> select MONTHS_BETWEEN(SYSDATE, HIREDATE) from EMP where EMPNO=7782;

	<6> NEXT_DAY(날짜컬럼or날짜데이터, 숫자)
	   SQL> select SYSDATE, NEXT_DAY(SYSDATE,4) from DUAL;
	   SQL> select SYSDATE, NEXT_DAY(SYSDATE,2) from DUAL; 
	   
	   -- 일(1) 월(2) 화(3) 수(4) 목(5) 금(6) 토(7)

     4) 문자 변환 함수 ( ***** )
        => TO_CHAR(날짜컬럼or날짜데이터, '변환포멧')
	<1> 'D'
	   SQL> select SYSDATE, to_char(SYSDATE, 'D') from dual;
	<2> 'DAY'
	   SQL> select SYSDATE, to_char(SYSDATE, 'DAY') from dual;
	<3> 'DY'
	   SQL> select SYSDATE, to_char(SYSDATE, 'DY') from dual;
	<4> 'DD'
	   SQL> select SYSDATE, to_char(SYSDATE, 'DD') from dual;
	<5> 'MM'
	   SQL> select SYSDATE, to_char(SYSDATE, 'MM') from dual;
	<6> 'MONTH'
	   SQL> select SYSDATE, to_char(SYSDATE, 'MONTH') from dual;
	<7> 'YY'
	   SQL> select SYSDATE, to_char(SYSDATE, 'YY') from dual;
	<8> 'YYYY'
	   SQL> select SYSDATE, to_char(SYSDATE, 'YYYY') from dual;
	<9> 'MM-DD-YY'
	   SQL> select SYSDATE, to_char(SYSDATE, 'MM-DD-YY') from dual;
        <10> 'HH' or 'HH12'
	   SQL> select SYSDATE, to_char(SYSDATE, 'HH') from dual;
	<11> 'HH24'
	   SQL> select SYSDATE, to_char(SYSDATE, 'HH24') from dual;
	<12> 'MI'
	   SQL> select TO_CHAR(SYSDATE, 'MI') from DUAL;
	<13> 'SS'
	   SQL> select TO_CHAR(SYSDATE, 'SS') from DUAL;
	<14> 'AM'or'PM'
	   SQL> select TO_CHAR(SYSDATE, 'AM HH:MI:SS') from DUAL; 
	   SQL> select TO_CHAR(SYSDATE, 'fmAM HH:MI:SS') from DUAL;

	   --현재날짜를 '2020-12-07 오후 12:13:50 월요일' 식으로 출력
	<15> 'YYYY-MM-DD AM HH:MI:SS DAY'
	   SQL> select TO_CHAR(SYSDATE, 'YYYY-MM-DD AM HH:MI:SS DAY') from DUAL; 

	   cf) alter session set NLS_LANGUAGE='ENGLISH';

	   cf) Tip 
	     - one, two, three .. 
	      SQL> select to_char(SYSDATE, 'DDSP') from dual;

	     - simple 서수  
	      SQL> select to_char(SYSDATE, 'DDTH') from dual;

	     - 서수  
	      SQL> select to_char(SYSDATE, 'DDSPTH') from dual;

   (5) 복수행 함수 ( ***** )
      1) count(컬럼명)
        SQL> select count(ename) from emp;
	SQL> select count(comm) from emp;
	SQL> select count(*) from emp;
	SQL> select count(EMPNO) from emp;
      
      2) sum(컬럼명)
        SQL> select sum(comm) from emp;
	SQL> select sum(sal) from emp;

      3) avg(컬럼명)
        SQL> select avg(sal) from EMP;
	SQL> select avg(comm) from EMP; -- null제외 
	SQL> select avg(nvl(comm,0)) from EMP; -- null포함 
     
      4) max(컬럼명)와 min(컬럼명)
        SQL> select max(sal) from EMP;
	SQL> select min(sal) from EMP;
	SQL> select max(sal) - min(sal) from EMP;

	-- 최고 급여자의 사원이름을 출력
	SQL> select ENAME, SAL from EMP where SAL=max(SAL); --(X)
	SQL> select ENAME, SAL from EMP where SAL=(select max(SAL) from EMP); --(O)

      5) VARIANCE(컬럼명)
        SQL> select VARIANCE(comm) from EMP;
    
      6) STDDEV(컬럼명)
        SQL> select STDDEV(comm) from EMP;

      < Question > 
      -- 부서별 평균연봉(반올림)을 출력
      Err> select DEPTNO, avg(SAL) from EMP; 
      SQL> select DEPTNO, avg(SAL) from EMP group by DEPTNO;
      SQL> select DEPTNO, round(avg(SAL)) from EMP group by DEPTNO;

      -- 급여 2000 이상인 사원들의 부서별 평균급여의 반올림값
      SQL> select DEPTNO, round(avg(SAL)) from EMP 
           where SAL>=2000 group by DEPTNO;

      -- 급여 2000 이상인 사원들의 부서별 평균급여의 반올림값 (부서번호의 오름차순 정렬)
      SQL> select DEPTNO, round(avg(SAL)) from EMP 
           where SAL>=2000 group by DEPTNO order by DEPTNO;
  
     ## 오라클 수업 깃: https://github.com/khs4git1/Oracle.git

      -- 급여 2000 이상인 사원들의 부서별 평균급여의 반올림값 (급여가 높은 순 정렬)
      SQL> select DEPTNO, round(avg(SAL)) from EMP
           where SAL>=2000 group by DEPTNO order by round(avg(SAL)) desc;
      SQL> select DEPTNO, round(avg(SAL)) aa from EMP
           where SAL>=2000 group by DEPTNO order by aa desc;
      SQL> select DEPTNO, round(avg(SAL)) from EMP
           where SAL>=2000 group by DEPTNO order by 2 desc;

      --급여 1000이상인 사원들의 부서별 평균급여의 반올림값을 부서번호로 내림차순 정렬하라
	   -- (단, 부서별 평균급여가 2000 이상인 값만 출력!)
      유민> SELECT deptno, round(AVG(sal))  "평균급여" FROM emp 
          WHERE sal >=1000  
	  GROUP BY deptno 
	  HAVING round(AVG(sal)) >= 2000 
	  ORDER BY 1 DESC;

      SQL> select DEPTNO, round(avg(SAL)) from EMP
           where SAL>=1000
	   group by DEPTNO
	   having round(avg(SAL))>=2000
	   order by DEPTNO desc;
   
      Err> select DEPTNO, round(avg(SAL)) aa from EMP
           where SAL>=1000
	   group by DEPTNO
	   having aa>=2000
	   order by DEPTNO desc;

	  -- #주의: having 절에서는 alias를 사용할 수 없음 

      --각 부서별 같은 업무를 하는 사원의 인원수를 구하여 부서번호, 업무명, 인원수를 출력하라
	 --(단, 부서번호과 업무명으로 각각 내림차순 정렬!)
      SQL> select DEPTNO, JOB, count(EMPNO) from EMP
           group by DEPTNO, JOB 
	   order by DEPTNO desc, JOB desc;
     
      < 일반화 >
      [1] 순서 ( SF - WGHO )
         select -> from -> where -> group by -> having -> order by 
      [2] where 절에는 그룹함수를 사용 불가
      [3] having 절에서는 alias를 사용할 수 없음

     ------------- 문제2 ---------------------------
     탐색기: ftp://106.240.16.165  ( student / java )


   #1-3. 조인( Join )
   1) 설명 
         하나의 테이블로는 원하는 컬럼정보를 참조할 수 
	 없는 경우 관련된 테이블을 '논리적으로 결합'하여
	 원하는 컬럼정보를 참조하는 방법을 '조인'이라 한다.

   2) 조건 
         논리적으로 결합되는 2개 이상의 테이블에는 반드시 
	 '공통컬럼'이 존재해야하며 이 '공통 컬럼'은 
	 동일한 데이터 타입과 공통된 데이터를 포함해야 한다.

   3) 일반적인 조인예
      <1> NATURAL 조인 ( EQUI 조인 )
      select EMP.EMPNO, DEPT.DNAME from EMP, DEPT where EMP.DEPTNO=DEPT.DEPTNO;--형태1
      select e.EMPNO, d.DNAME from EMP e, DEPT d where e.DEPTNO=d.DEPTNO;--형태1
      select e.EMPNO, d.DNAME from EMP e join DEPT d on e.DEPTNO=d.DEPTNO;--형태2
      select EMP.EMPNO, DEPT.DNAME from EMP join DEPT using(DEPTNO);--형태3
      select EMPNO, DNAME from EMP natural join DEPT; --형태4

 
      < 문제 >
      -- 사원번호가 7900인 사원의 부서이름 출력하시오 
      SQL> select EMP.EMPNO, DEPT.DNAME from EMP, DEPT 
          where EMP.DEPTNO=DEPT.DEPTNO and EMP.EMPNO=7900; -- 형태1  
      SQL> select e.EMPNO, d.DNAME from EMP e, DEPT d  
          where e.DEPTNO=d.DEPTNO and e.EMPNO=7900; -- 형태1
      SQL> select e.EMPNO, d.DNAME from EMP e join DEPT d 
          on e.DEPTNO=d.DEPTNO and e.EMPNO=7900; -- 형태2
      SQL> select e.EMPNO, d.DNAME from EMP e join DEPT d 
          on e.DEPTNO=d.DEPTNO where e.EMPNO=7900; -- 형태2
      SQL> select EMP.EMPNO, DEPT.DNAME from EMP join DEPT using(DEPTNO)
          where EMP.EMPNO=7900; --형태3
      SQL> select EMPNO, DNAME from EMP natural join DEPT
          where EMPNO=7900;

       < 일반화: DQL의 배치순서와 실행순서 >
        - select XX         --> 6
        - from XX           --> 1 
        - (join XX)         --> 2 
        - where XX          --> 3 
        - group by XX       --> 4 
        - having XX         --> 5
        - order by XX       --> 7
  
     <2> SELF 조인
        < 문제 >
        -- ex) JAMES의 매니져는 BLAKE이다  ( 13명의 MGR를 출력하시오 )

	유민> SELECT e1.ename ||'의 매니저는 ' "사원", e2.ename || '입니다.' "매니저" 
	     FROM emp e1,emp e2 
	     WHERE e1.mgr=e2.empno AND e2.empno= e1.mgr;
	동오> select concat(e.ENAME,'의 매니저는') 사원이름,concat(e2.ENAME,'이다') 담당매니저
             from EMP e, EMP e2 where e.MGR=e2.EMPNO;
	종범> select e.ename||'의 매니져는 ', f.ename||'이다' from emp e, emp f 
             where e.mgr=f.empno and f.empno= e.mgr;

	SQL> select e.ENAME||'의 매니져는 ', m.ENAME||'이다' 
	     from EMP e, EMP m where e.MGR=m.EMPNO;
	SQL> select e.ENAME||'의 매니져는 ', m.ENAME||'이다' 
	     from EMP e, EMP m where e.MGR=m.EMPNO and e.ENAME='JAMES';
        SQL> select e.ENAME||'의 매니져는 ', m.ENAME||'이다' 
	     from EMP e join EMP m on e.MGR=m.EMPNO 
	     where e.ENAME='JAMES'; -- join on절로


   #1-4. 서브쿼리( Sub Query )
    1) 설명 
          하나의 DQL문장절에 부속된(포함된) 또 다른 SELECT문장
          따라서, 두 번 이상 질의를 해야 얻을 수 있는 결과를 
	  한번의 질의로 해결이 가능케하는 쿼리 

    2) 용어 
          [1] MAIN-QUERY or OUTER-QUERY 
	  [2] SUB-QUERY or INNER-QUERY 

    3) 특징 
        [1] 괄호를 묶어야 한다. 
	[2] 실행순서는 '대부분' SUB-QUERY가 먼저 수행되고, 
	    MAIN-QUERY가 실행된다.
	[3] SUB-QUERY는 MAIN-QUERY의 다음 부분에 위치된다.
	    - SELECT/DELETE/UPDATE문장의 FROM절/WHERE절 
	    - INSERT문장의 INTO절 
	    - UPDATE문장의 SET절 
        [4] SUB-QUERY는 ORDER BY절을 사용할 수 없다.
	    (예외 : SELECT/DELETE/UPDATE문장의 FROM절 )

    4) 종류
        [1] 단일행 SUB-QUERY
	    -> SUB-QUERY의 실행결과가 '하나의 컬럼' AND 
	      '하나의 행'만을 리턴해 주는 경우의 쿼리 
	       즉, '하나의 데이터'를 리턴해 주는 쿼리
            
	    < 문제 >
	    -- 사원번호가 7900인 사원의 부서이름 출력하시오 
	    Join> select e.EMPNO, d.DNAME from EMP e, DEPT d  
		  where e.DEPTNO=d.DEPTNO and e.EMPNO=7900; 

	    Sub> select DEPTNO from EMP where EMPNO=7900;
	    Main> select DNAME from DEPT where DEPTNO=?;
	    SQL> select DNAME from DEPT 
	         where DEPTNO=(select DEPTNO from EMP where EMPNO=7900);

            -- 부서번호가 10번인 사원급여와 급여가 같은 사원의 이름과 커미션을 출력
	    Sub> select SAL from EMP where DEPTNO=10;
	    Main> select ENAME, COMM from EMP where SAL=?
	    Err> select ENAME, COMM from EMP 
	         where SAL=(select SAL from EMP where DEPTNO=10); --복수행
		 
            Sub> select SAL, COMM from EMP where EMPNO=7369;
	    Main> select ENAME, SAL, COMM from EMP where SAL=?;
	    Err> select ENAME, SAL, COMM from EMP 
	       where SAL=(select SAL, COMM from EMP where EMPNO=7369);--복수컬럼

	    -- 평균급여보다 많은 받는 사원의 이름과 급여 출력!
	    Err> select ENAME, SAL from EMP where SAL>avg(SAL);	
	    Sub> select avg(SAL) from EMP;
	    Main> select ENAME, SAL from EMP where SAL>?
	    SQL> select ENAME, SAL from EMP where SAL>(select avg(SAL) from EMP);

        [2] 복수행 SUB-QUERY
	    -> SUB-QUERY의 실행결과가 '여러개의 행'을 return 하는 경우의 쿼리
	    ( 연산자를 이용: in[=any], any, exists, all )
  
            <1> in 
            -- 부서번호가 10번인 사원급여와 급여가 같은 사원의 이름과 급여를 출력
	    Sub> select SAL from EMP where DEPTNO=10;
	    Main> select ENAME, SAL from EMP where SAL=? 	
            Err> select ENAME, SAL from EMP where SAL=(select SAL from EMP where DEPTNO=10);

	    SQL> select ENAME, SAL from EMP 
	         where SAL in (select SAL from EMP where DEPTNO=10);
            SQL> select ENAME, SAL from EMP 
	         where SAL=any(select SAL from EMP where DEPTNO=10);
            효과> select ENAME, SAL from EMP
	         where SAL=2450 or SAL=5000 or SAL=1300;
	
	    <2> all
	    -- 급여가 가장 많은 'MANAGER'보다 급여가 같거나 많은 사원의 JOB,SAL을 출력!!
	    Sub> select SAL from EMP where JOB='MANAGER';
	    Main> select JOB,SAL from EMP where SAL>=?;
	    SQL> select JOB,SAL from EMP
	        where SAL>=(select max(SAL) from EMP where JOB='MANAGER');
            SQL> select JOB,SAL from EMP
	        where SAL>=all(select SAL from EMP where JOB='MANAGER');
            효과> select JOB,SAL from EMP
	        where SAL>=2975 and SAL>=2850 and SAL>=2450;

            <3> any
	     -- 급여가 가장 큰 'SALESMAN' 보다 급여가 작은 사원의 JOB, SAL을 출력!
	     Sub> select SAL from EMP where JOB='SALESMAN';
	     Main> select JOB,SAL from EMP where SAL<?;
	     SQL> select JOB,SAL from EMP 
	        where SAL<any(select SAL from EMP where JOB='SALESMAN');
             효과> select JOB,SAL from EMP
	        where SAL<1600 or SAL<1250 or SAL<1500; 

            <4> exists
	      -- '부서번호'가 10인 사원이 존재하면 모든 부서의 이름을 출력!
	      Sub> select * from EMP where DEPTNO=10;
              Main> select DNAME from DEPT
	         where exists(select * from EMP where DEPTNO=10);

	[3] 복수 컬럼 SUB-QUERY
	    -> SUB-QUERY의 실행결과가 여러개의 '컬럼을 값'
	       (AND 여러개의 행)을 리턴해 주는 쿼리
	       
	    --'부서번호'가 30인 사원의 SAL과 COMM이 같은 사원들의 '이름'과 '부서번호' 출력! 
	    Sub> select SAL, COMM from EMP where DEPTNO=30;
	    Main> select ENAME, DEPTNO from EMP
	        where (SAL, COMM) 
		in (select SAL, COMM from EMP where DEPTNO=30); --4개 
            비교> select ENAME, DEPTNO from EMP
	        where (SAL, nvl(COMM,0)) 
		in (select SAL, nvl(COMM,0) from EMP where DEPTNO=30); --6개  

	[4] 상호 관련 SUB-QUERY
	    -> MAIN-QUERY절에 사용된 테이블이 SUB-QUERY절에 다시
	       재사용되는 경우의 서브쿼리 

           Sub> select avg(e1.SAL) from EMP e1, EMP e2 
	        where e1.DEPTNO=e2.DEPTNO; --수행O
	   Sub-Err> select avg(SAL) from EMP e2 
	        where e1.DEPTNO=e2.DEPTNO; --수행X
           Main> select e1.EMPNO, e1.SAL from EMP e1
	        where SAL>(select avg(SAL) from EMP e2 
	        where e1.DEPTNO=e2.DEPTNO);
	  
        cf) 연습문제
        -- 사원번호가 7900인 사원번호와 부서이름을 출력하라
	SQL> select e.EMPNO, d.DNAME from EMP e, DEPT d
	     where e.DEPTNO=d.DEPTNO and e.EMPNO=7900; -- by 조인 
	SQL> select DNAME from DEPT
	     where DEPTNO=(select DEPTNO from EMP where EMPNO=7900); -- by 서브쿼리 

	-- 부서번호가 10번인 사원 평균급여 보다 급여가 적은 사원의 이름과 급여
	   -- ( 단, 급여가 높은 순으로 정렬 )
	Sub> select avg(SAL) from EMP where DEPTNO=10;
	Main> select ENAME, SAL from EMP where SAL<?;
	SQL> select ENAME, SAL from EMP 
	     where SAL<(select avg(SAL) from EMP where DEPTNO=10);
	SQL> select ENAME, SAL from EMP 
	     where SAL<(select avg(SAL) from EMP where DEPTNO=10)
	     order by SAL desc;

        --부서번호가 10번인 사원 평균급여 보다 급여가 적은 사원들의 부서별 평균 급여
	    --( 단 10번부서는 제외할 것, 부서번호 역정렬, 급여는 반올림할 것 )
	Sub> select avg(SAL) from EMP where DEPTNO=10;
	Main> select DEPTNO, round(avg(SAL)) from EMP
	      where SAL< ? 
	      group by DEPTNO
	      having DEPTNO != 10
	      order by DEPTNO desc;
        SQL> select DEPTNO, round(avg(SAL)) from EMP
	     where SAL< (select avg(SAL) from EMP where DEPTNO=10) 
	     group by DEPTNO
	     having DEPTNO != 10
	     order by DEPTNO desc; 

	   -- 미션( 학생들의공간/SQL )
	      -- 문제1+문제2 는 모범답안과 비교해 볼 것!
	      -- 문제3 풀기
	      
5. DML ( Data Manipulation Language )
   (1) 설명 
       테이블내의 데이터를 '입력', '수정', '삭제' 하게 하는 SQL

       cf) 우선 테이블을 복사하자 ( copy1.sql )

   (2) 종류 
       1) insert 문 
          SQL> insert into DEPT2 values(50, '회계부', '서울');
          SQL> insert into EMP2 
	       values(8000, '박서하', '개발자', 7839, SYSDATE, 4000, null, 50);
	  SQL> select * from EMP2 where EMPNO>=8000;
	  SQL> insert into EMP2(EMPNO, ENAME) values(9000, '허유민'); 
          Err> insert into EMP2(EMPNO, ENAME) values(9000, '성진희');

       2) update 문
          SQL> update EMP2 set ENAME='이소담', SAL=6000 where EMPNO=9000;
	  SQL> update EMP2 set EMPNO=9999 where EMPNO=9000; --PK컬럼변경(O)
	  Err> update EMP2 set EMPNO=8000 where EMPNO=9999; --8000이미존재
	  SQL> update EMP2 set DEPTNO=50 where EMPNO=9999; --가능 
          Err> update EMP2 set DEPTNO=70 where EMPNO=9999; --불가(70번부서는 존재X)

       3) delete 문
          SQL> delete from EMP2 where EMPNO=9999;  
	  SQL> delete from DEPT2 where DEPTNO=50; -- on delete cascade; 옵션에서만 가능
	  Err> delete from DEPT2 where DEPTNO=20; --불가: 바라보는 자식 데이터가 존재하기 때문에
	  SQL> delete from DEPT2 where DEPTNO=40; --가능

6. TCL( Transaction Control Language )
   (1) 설명 
      DML(insert, update, delete)문이 실행되어 DBMS에 '저장'되거나, 
      '되돌리기' 위해서 실행해야 하는 SQL문 

   (2) Transaction 
     1) 정의 
        분리되서는 안될 (논리적)'작업 단위' 
     
     2) 시작 
        <1> DBMS에 처음 접속했을 때 
	<2> 하나 or 여러개의 DML문을 실행한 후 commit 또는 
	    rollback 을 수행한 직후

     3) 끝 
        <1> commit 또는 rollback 실행되는 순간 

	     예외) rollback to a; 
	  
	<2> DDL 이나 DCL 문이 실행되는 순간
	    세션1> 
	       SQL> insert into DEPT2 values(1, 'a', 'b');  --DML 
	       SQL> update DEPT2 set DNAME='A' where DEPTNO=1; --DML 
	       SQL> create table AA(no number); --DDL 

	    세션2>
	       SQL> select * from DEPT2;

	<3> DB가 (정상/비정상) 종료될 때
	    세션1> 
	       SQL> delete from DEPT2 where DEPTNO=1;
	       SQL> 왼쪽 상단의 X버튼 클릭해서 세션종료 -- 비정상종료 
	    세션2> 
	       SQL> select * from DEPT2; -- commit 되지 않음 
	       
	    세션1> 
	       SQL> delete from DEPT2 where DEPTNO=1;
	       SQL> exit; 또는 quit; --정상종료  
	    세션2> 
	       SQL> select * from DEPT2; -- commit 되었음 
	    
            세션1> DML 작업중 
	       SQL> insert into DEPT2 values(1, '가', '나');
            세션2> DBMS 종료 
	       SQL> sqlplus system/java1019 as sysdba
	       SQL> shutdown immediate; --DB서비스 종료 
	       SQL> startup; --DB서비스 시작 
	    세션3> 
	       SQL> select * from DEPT2; -- commit 되지 않음( rollback )
	       
	<4> 작업중인 Connection(세션)을 끊을 때
	    세션1> 
	       SQL> insert into DEPT2 values(1, '가', '나');
	       SQL> conn system/java1019
	    세션2> SQL> select * from DEPT2; -- commit 되었음 
	    
  (3) TCL의 종류 
     1) commit 
         DML문의 결과를 영구적으로 DBMS에 반영하는 SQL문 

     2) rollback
         DML문의 결과를 (이전 Transaction 까지) 취소하는 SQL

     3) savepoint 
        트랜젝션을 구성하는 DML의 한 지점을 표시하는 저장점 

        세션1> 
	   SQL> insert into DEPT2 values(1, 'a1', 'b1');
	   SQL> insert into DEPT2 values(2, 'a2', 'b2');
	   SQL> savepoint a;
	   SQL> insert into DEPT2 values(3, 'a3', 'b3');
	   SQL> savepoint b;
	   SQL> insert into DEPT2 values(4, 'a4', 'b4');
	   SQL> rollback to a;
	   Err> rollback to b; -- 안됨( 이미 늦음 )
	  
	세션2> 
	   SQL> select * from DEPT2; -- 1과 2번만 확인됨 

  (4) TCL 관련 특성
     1) READ CONSISTENCY (읽기 일관성 - '해당 row'에 대해서)
        어떤 사용자가 변경 중인 행을 '다른 사용자'가 변경 할 수 없게 하는 기술로써 
	변경 중인 사용자에 의해 commit 이나 rollback 이 실행된 후 변경가능한 특성

	<예>
	세션1> update DEPT2 set DNAME='가' where DEPTNO=1;
	세션2> update DEPT2 set DNAME='나' where DEPTNO=1; --보류 
	세션1> commit; 또는 rollback;
	세션2> 1 행이 갱신되었습니다


     2) LOCK (잠금현상 - '해당 table'에 대해서)

       <예>
        세션1> update DEPT2 set DNAME='개발부', LOC='경기'; -- 테이블 전체 lock 
	세션2> update DEPT2 set LOC='서울' where DEPTNO=1; -- 보류 

	cf) lock 해제 방법 
	   -> commit; 또는 rollback;

7. DDL ( Data Definition Language )
   (1) 설명 
      데이터베이스 내의 객체(Object)를 '생성'하고 '변경'하고, '삭제'하기 위해서 
      사용되는 SQL문

   (2) 객체(Object)
       1) table 
       2) index 
       3) view 
       4) sequence 
       5) synonym
       6) session ( 오라클로 접근하는 하나의 인터페이스[접근통로] )
       7) user 
          ... 

   (3) DDL 종류 
       1) create : 객체를 생성할 때 
           SQL> create table DDLTEST(
	           NO number(4) primary key, 
                   NAME varchar2(10), 
		   ADDR varchar2(20)
	        );

       2) alter : 객체를 변경할 때 
          ( 옵션: add, add constraint, modify, set unused column, drop column, 
	        rename column, drop constraint, disable constraint, enable constraint )
          <1> add 
	     SQL> insert into DDLTEST values(1000, '가', '나');
	     SQL> insert into DDLTEST values(2000, '다', '라');
	     SQL> alter table DDLTEST add(TEL varchar2(20));
	     SQL> insert into DDLTEST values(3000, '마', '바', '사');
	     SQL> insert into DDLTEST values(4000, '아', '자', '차');
	     SQL> select * from DDLTEST;

	  <2> modify 
	     SQL> alter table DDLTEST modify(
		      NAME varchar2(15), ADDR varchar2(25)
	          );
             SQL> desc DDLTEST

	  <3> drop column 
	     SQL> alter table DDLTEST drop column NO;  --PK컬럼도 삭제 가능 
	     SQL> desc DDLTEST
 
             제약조건확인> select CONSTRAINT_NAME, CONSTRAINT_TYPE 
	        from user_constraints where TABLE_NAME='DDLTEST';

       3) drop : 객체를 삭제할 때 
            SQL> drop table DDLTEST;
	    SQL> show recyclebin;
	    SQL> purge recyclebin;

	    cf) 오라클 휴지통 (recyclebin)
	    - 테이블 조회 
	      show recyclebin;
	    - 비우기 
              purge recyclebin;
	    - 복원 
	      flashback table EMP2 to before drop;
	    - 휴지통에 남기지않고 바로삭제 
	      drop table EMP2 purge; 
	    - 특정 테이블만 비우기 
	      purge table DEPT2;  

       4) rename : 객체이름 변경할 때 
           SQL> rename DDLTEST to DDLTEST2;
	   SQL> select * from tab;

       5) comment : 객체에게 주석을 부여할 때 
          <1> 테이블 주석
	     SQL> comment on table DDLTEST2 is 'DDL테스트용 테이블';
	     SQL> desc user_tab_comments; -- 데이터 딕셔너리 
	     SQL> select COMMENTS from user_tab_comments where TABLE_NAME='DDLTEST2';

	  <2> 컬럼 주석 
	     SQL> comment on column DDLTEST2.NAME is '회원이름';
	     SQL> desc user_col_comments; -- 데이터 딕셔너리
	     SQL> select COMMENTS from user_col_comments where TABLE_NAME='DDLTEST2';

       6) truncate : 모든 행을 잘라낼 때 
          SQL> truncate table DDLTEST;
	  SQL> select * from DDLTEST;

	  cf) delete문과의 차이점 
	    - 되돌릴 수 없음 
	    - where절을 사용할 수 없음 

8. Data Dictionary  
   (1) 설명 
      Oracle 의 테이블은 '2가지' 종류가 있다. 
      첫번째, DB생성할 때 기본적으로 만들어지는 '자료사전테이블' 
      두번째, User가 데이터를 저장하고 관리하기 위한 '사용자정의테이블'
      전자가 Data Dictionary 테이블이다.

   (2) 종류 
      1) DBA_XXX : DB전체의 관련정보 저장 테이블 
      2) ALL_XXX : 자신이 볼 수 있는 Object 정보 테이블 
      3) USER_XXX : 자신이 생성한 Object 정보 테이블 
      4) X$_XXX : DB의 성능 분석/통계 정보 테이블 ( DB튜닝시 수정함 )
      5) V$_XXX : X$_XXX 의 VIEW ( 성능 참조 )

      <예1>
      SQL> select * from dictionary;
      SQL> select * from dict_columns;

         cf) Ctl + C : 명령실행 정지 

      <예2> user_ (*****)
      SQL> select * from user_tables;
      SQL> desc user_tables;
      SQL> select TABLE_NAME from user_tables;
      SQL> select * from tab; --위와 비교 

      SQL> desc user_indexes
      SQL> select INDEX_NAME, INDEX_TYPE, TABLE_NAME 
           from user_indexes;
      
      SQL> desc user_constraints
      SQL> select CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME 
           from user_constraints;

      SQL> desc user_views
      SQL> select VIEW_NAME, TEXT from user_views;

      cf) 
      create or replace view VIEW1 as
          select DEPTNO "번호", round(avg(SAL)) "반올림" from EMP 
	  where SAL>=1000 
	  group by DEPTNO 
	  having round(avg(SAL))>=2000 
	  order by DEPTNO desc;

     SQL> select * from user_tab_comments;
     SQL> select * from user_col_comments;

     <예3> all_
     SQL> select * from all_tables;
     SQL> desc all_tables

     <예4> dba_
     SQL> select * from dba_tables; --없음 
     SQL> conn system/java1019
     SQL> select * from dba_tables; 

9. Data Type ( 형 == Type )
  (1) 설명 
     Oracle에서 제공하는 데이터 타입 

  (2) 종류
     1) 스칼라(Scalar) 타입
        cf) Scalar: 실수로 표시할 수 있는 수량 

	<1> 하나의 데이터 타입컬럼에 
	   오직, '하나의 데이터'만 저장할 수 있는 타입 
	<2> '문자/숫자/날짜' 데이터를 저장 
	<3> 종류 
	   1> NUMBER ( -38 ~ +38 자리수 )
	   2> BINARY_INTEGER 
	      ( -2147483648 ~ 2147483647 ) == (-2^31 ~ 2^31-1)
	   3> CHAR(0~255=0~2^8-1), NCHAR 
	      - CHAR(10) -> 나머지 공간을 SPACE 로 채움 
	      - NCHAR(10) -> 다양한 언어의 문자값을 저장 
           4> VARCHAR, VARCHAR2(4000), NVARCHAR2(4000)
	      - VARCHAR2(10) -> 필요한 공간만 채움 
	      - NVARCHAR2(10) -> 다양한 언어의 문자값을 저장
	   5> BLOB, LONG ROW, CLOB, LONG
	      - BLOB -> 바이너리 데이터를 4G
	      - LONG ROW -> 바이너리 데이터를 2G
	      - CLOB -> 문자 데이터를 4G
	      - LONG -> 문자 데이터를 2G
           6> DATE ( 초단위 데이터 저장 )
	   7> TIMESTAMP ( 마이크로초 저장 )
	      - TIMESTAMP WITH TIME ZONE 
	      - TIMESTAMP WITH LOCAL ZONE
	      - INTERVAL YEAR TO MONTH 

	    cf1) java.sql.Timestamp 를 이용 
	    cf2) '1/10^6'초까지 저장은 가능하나 
	       컴퓨터에서 생성할 수 있는 유효한 시간은 
	       '1/10^3' 초이므로 실제 저장되는 시간은 
	       '1/1000' 초 단위임 
	   8> BOOLEAN ( true / false 저장 )
	    
     2) 모음(Collection) 타입 
        <1> 하나의 데이터 타입 컬럼에 
	   '여러개의 데이터(배열/테이블)'를 저장할 수 있는 타입 
	<2> 배열/테이블 데이터를 저장 
	<3> 종류 
	    1> VARRAY
	    2> NESTED TABLE 

  (3) 시간 관련 함수 
     1) CURRENT_DATE 함수 ( SYSDATE 유사 )

        cf) 시간 포멧 수정 
	SQL> alter session set 
	     NLS_DATE_FORMAT='YYYY-MM-DD AM HH:MI:SS DAY';
	SQL> alter session set NLS_LANGUAGE='ENGLISH';
    
     2) CURRENT_TIMESTAMP 함수 (*****)
        SQL> select CURRENT_TIMESTAMP from DUAL;
	SQL> alter session set TIME_ZONE='-10:00'; 
	SQL> select CURRENT_TIMESTAMP from DUAL;
	SQL> alter session set TIME_ZONE='00:00'; --영국표준시간 
	SQL> select CURRENT_TIMESTAMP from DUAL;
          
     3) LOCALTIMESTAMP 함수 
        SQL> select CURRENT_TIMESTAMP, LOCALTIMESTAMP from dual;

	cf) TST테이블 
	create table TST(
	   NO number, 
	   RDATE date, 
	   TS timestamp);
	insert into TST values(10, SYSDATE, CURRENT_TIMESTAMP);

   (4) ROWID 와 ROWNUM 컬럼 (*****)
      1) 설명 
         oracle 에서 테이블을 생성하면 기본적으로 제공되는 컬럼 

      2) 종류 
         1> ROWID
	    -> ROW 의 고유 ID ( 중간에 row 수정/삭제시 불변 )
	 2> ROWNUM
	    -> 행의 INDEX (중간에 row 삭제시 변함 )

	    SQL> select count(*) from DEPT;
	    SQL> select count(PK컬럼) from DEPT;
	    SQL> select max(ROWNUM) from DEPT;

10. CONSTRAINT ( ***** )
    (1) 설명 
        테이블의 해당 컬럼에 '원치않은 데이터가 입력/변경/삭제 되는 것을 방지'
	하기위해 테이블 생성(create)시 또는 변경(alter)시 설정하는 조건 

        cf) 제약 조건명(constraint의 변수명)을 개발자가 직접 
	   부여하면 추후 해당 constraint 관리가 용이 

    (2)  종류 
       1) PRIMARY KEY (식별키) [ 테이블당 (0<=count<=1) 개 ]
          하나의 테이블에 오직 '하나'만 존재하며 자동으로 INDEX 
	  가 부여되는, 하나의 ROW 데이터를 대표하는 '대표 키'
	
       2) FOREIGN KEY (참조키/외래키) [ 테이블당 (0<=count<=n) 개 ]
          부모 테이블의 'PK/UK'를 참조하는 키 

       3) UNIQUE KEY (유일키) [ 테이블당 (0<=count<=n) 개 ]
          PK가 아니더라도 컬럼의 모든 값이 유일해야 하는 경우 
	  에 사용되는 제약조건이다.
	  즉, 중복데이터를 허용하지 않는 컬럼에 부여하는 키

	  cf) PK와 차이점 
	  첫째, NULL 을 입력할 수 있다.
          둘째, 하나의 테이블에 여러개의 유일키 생성 가능 

       4) CHECK 
          '조건'에 맞는 데이터만 입력되도록 조건을 부여한 제약조건 

	  cf) 위의 '조건'이란 ? 
	    - 데이터 값의 범위
	    - 특정 패턴 숫자 
	    - 문자값 설정
	    ... 

       5) NOT NULL 
          NULL 이 입력되어서는 안되는 컬럼에 부여하는 제약조건으로 
	  'COLUMN-LEVEL'으로만 부여할 수 있는 제약 조건

	  cf1) PK는 not null 포함 
	  cf2) default 는 제약조건이 아님 
	  cf3) not null 조건도 constraint_type 이 'C'로 표현됨 

   (3) LEVEL 기준 제약조건 부여방법 ( ***** )
      1) COLUMN-LEVEL 
         -> 하나의 제약조건을 부여할 때 사용하며 
	    '5가지'를 모두 부여할 수 있음 

	  ex) const1.sql(이름X), const2.sql(이름O) 
	 

      2) TABLE-LEVEL 
         -> 하나의 이상의 컬럼에 여러개의 제약조건을 부여할 때 
	    사용함 ( not null 불가 )
	  
	 ex) const3.sql(이름X), const4.sql(이름O), const5.sql(이름O, 테이블밖)


       cf) 개인적인 생각 
         - const 1~5 중 간단하고 가독성이 좋은 것은 2번을 선호 
	 - 제약조건 수정하려면 삭제하고 다시 만들어야 함 
	 - disable constraint, enable constraint 은 비추천(무결성이 깨지는 편법)
	 - 5가지 패턴을 익숙하게 하면 Good! 

11. 임시 테이블 ( TEMPORARY TABLE ) 
   (1) 설명 
       개발자가 DML(insert, update, delete)문을 실행한 후 
       트랜젝션을 종료(commit) 하더라도 변경된 데이터들이 
       DB 테이블에 저장되지 않는 테이블.
       즉, 잠시 데이터를 저장하는 '메모리상의 일시적 공간'

   (2) 데이터를 유지하는 방법 
      1) ON COMMIT DELETE ROWS ( 유효범위: Transaction )
         -> commit 하는 순간에 row 삭제 tables은 존재하지만 '데이터는 사라진다'

         SQL> create GLOBAL TEMPORARY table T1(
	       NO number, 
	       NAME varchar2(10)) ON COMMIT DELETE ROWS; 
	 SQL> select * from tab;
	 SQL> insert into T1 values(10, '홍길동');
	 SQL> insert into T1 values(20, '이순신');
	 SQL> select * from T1;
	 SQL> update T1 set NAME='박서하' where NO=20;
	 SQL> select * from T1;
	 SQL> commit; 
         SQL> select * from T1; -- 데이터가 없음 


      2) ON COMMIT PRESERVE ROWS ( 유효범위: Session )
         -> commit 하는 순간에 row 보존 ( session이 종료되면 사라진다 )

         <세션1>
	 SQL> create GLOBAL TEMPORARY table T2(
	       NO number, 
	       NAME varchar2(10)) ON COMMIT PRESERVE ROWS;
	 SQL> insert into T2 values(10, '홍길동');
	 SQL> insert into T2 values(20, '이순신');
	 SQL> commit; 
	 SQL> select * from T2; -- rows 안보임

	 <세션2>
	 SQL> select * from T2; -- rows 안보임 
	 
   (3) 장점 
       일시적으로 필요한 데이터를 저장할 수 있다. 
       즉, '어떤 시점'을 기준으로 데이터가 '자동 삭제'되기 때문에 
       DB의 resource 를 절약할 수 있다.
       
       cf1) 임시 테이블 삭제 
          SQL> drop table T1;
	  SQL> drop table T2;

       cf2) 삭제시 
          T1은 데이터가 있어도 drop 됨
	  but, T2는 데이터가 있으면 drop 안됨 

12. 뷰 ( VIEW )
    실제로 존재하는 것이 아닌 논리적인 '가상 테이블' 
    view를 사용하려면 일단 권한(create view) 필요 

   (1) 설명
      뷰는 테이블에 대한 '가상테이블'로써 테이블이 존재하지 않으면 뷰도 존재할 수 없음.
      뷰는 테이블처럼 데이터를 직접 소유하지 않고 '검색'시에만 정의된 뷰를 
      '틀'에 맞게 보여줌  
      
   (2) 사용 이유
      1) 기본 테이블에 대한 '보안기능'을 설정해야 하는 경우 
      2) 복잡하며 자주 사용되는 질의 SQL문을 보다 쉽고 '간단'하게 사용해야 하는 경우 

   (3) 사용 단계 
      1) VIEW 생성 권한을 scott 계정에 부여 
         SQL> conn system/java1019
	 SQL> grant CREATE VIEW to SCOTT; -- oracle 10g부터 
   
      2) VIEW 생성 
	 SQL> create or replace view VIEW1 as	
              select DEPTNO "번호", round(avg(SAL)) "반올림" from EMP 
	      where SAL>=1000 
	      group by DEPTNO 
	      having round(avg(SAL))>=2000 
	      order by DEPTNO desc;

      3) VIEW 사용 
         SQL> select * from VIEW1;
	 SQL> desc VIEW1;
	 SQL> select 번호 from VIEW1;

	 -- 미션: 매번 복잡한 쿼리 날리기 귀찮다 해결하라!!

   (4) 특징 
      1) VIEW 안 데이터의 물리적인 저장공간은 따로 가지지 않는다.
         -> 이유 : 테이블 안의 데이터를 '참조만' 하고 있기 때문 
      2) 테이블을 기초로 하는 '가상(논리)' 테이블이다.
      3) 하나 이상의 테이블로 만들어진다.
      4) 뷰를 access 하면 관련된 테이블도 간접적으로 access 된다.
      5) 테이블에서 선택된 컬럼정보만 참조할 수 있다.('보안')
      6) 복잡한 조인(JOIN)질의를 '간단', 명료하게 실행할 수 있다.
      7) 미리 '튜닝된 SQL문'을 사용하여 성능을 향상시킬 수 있다.
      8) DB 테이블 변경 될 때 
         응용프로그램(JAVA)에 대한 수정이 용이(유지 보수가 좋다.)
	 즉, Language Part 에서 code 수정이 필요없다.( SM 관점 )
      9) 다른 세션에서도 동일하게 적용된다. ( DBMS에 저장된다. )  

  (5) 핸들링 ( handling )
      1) 생성
          <1> 틀 
	    create or replace [FORCE|NOFORCE] view명 
	      ( 컬럼별칭1,  컬럼별칭2, ... , n)
	    as 
	    select 문 

	  <2> 옵션 설명 
	    - replace : 이미 존재하는 뷰이름이라면 '덮어쓴다'
	    - force : 관련 테이블의 존재 여부에 관계없이 뷰 생성 
	    - noforce : 관련 테이블이 존재할 때만 생성 가능 
	    - with check option : 제약 조건을 설정 
	    - with read only : DML작업을 할 수 없다

       2) 검색 
          SQL> select * from tab; --VIEW도 확인 가능
	  SQL> select view_name from user_views;

       3) 변경 (덮어쓰기)
          SQL> create or replace view VIEW1(na, dn, lo)
	       as 
	       select e.NAME, d.DNAME, d.LOC from CONST_DEPT d, CONST_EMP e
	       where e.DEPTNO=d.DEPTNO
	       with read only;
          SQL> select * from VIEW1;

        4) 삭제 
	  SQL> drop view VIEW1;
	  SQL> select view_name from user_views;

   (6) 종류 
      1) 단일(SIMPLE) 뷰
         -> '하나의 테이블'로 생성되는 뷰 
 
      2) 복합(COMPLEX) 뷰 
         -> '2개 이상의 테이블'로 생성되는 뷰 

12. SEQUENCE ( 일련번호 ) 
   (1) 설명 
      연속적인 숫자값을 자동으로 증감시켜 발생시키는 객체(Object) 
      즉, 시퀀스는 생성한 후, 호출만하면 연속적으로 번호를 
      (oracle 에서) 증가/감소시켜 제공해 줌 

   (2) 문법 
      create sequence 시퀀스명 
        [ increment by N ]
	[ start with N ]
	[ maxvalue N | nomaxvalue ]
	[ minvalue N | nominvalue ]
	[ cycle | nocycle ]
	[ cache | nocache ]

   (3) 생성
       SQL> create sequence MYSEQ increment by 1 start with 1 nocache; 
       SQL> desc seq
       SQL> select SEQUENCE_NAME, INCREMENT_BY, MAX_VALUE, MIN_VALUE from seq;

   (4) 사용 
       1) NEXTVAL 
          SQL> select MYSEQ.NEXTVAL from DUAL;

       2) CURRVAL 
          SQL> select MYSEQ.CURRVAL from DUAL;

	  cf) 생성 후 적어도 한번은 NEXTVAL을 호출해야 시퀀스값이 할당됨 

   (5) 삭제 
       SQL> drop sequence MYSEQ;

[ PART 4 - 관리 ]
1. 계정
   (1) 생성 
      1) 만들기 
         SQL> conn system/java1019
	 SQL> create user TEST1 identified by JAVA;

      2) 접근 
         ERR> conn TEST1/JAVA
	 SQL> grant CONNECT, RESOURCE to TEST1; -- CREATE VIEW 
	 SQL> conn TEST1/JAVA

      3) 확인 
         SQL> desc dba_users
	 SQL> select USERNAME, PASSWORD, DEFAULT_TABLESPACE from dba_users 
	      where USERNAME='TEST1';

	   cf) select USERNAME, PASSWORD, DEFAULT_TABLESPACE from dba_users 
	      where USERNAME='SCOTT';

   (2) 수정 
       1) 접속 
         SQL> conn system/java1019

       2) 비번수정 
	 SQL> alter user TEST1 identified by JAVAC;
	
       3) 확인 
         SQL> conn TEST1/JAVAC
	
   (3) 삭제 
       1) 접속 
         SQL> conn system/java1019

       2) 삭제 
         SQL> drop user TEST1; -- 테이블이 없는 경우에만 삭제됨 
	 SQL> drop user TEST1 CASCADE; -- 테이블 유무에 관계없이 삭제됨 


       cf) 권한 제거 
         SQL> conn system/java1019
	 SQL> revoke CREATE VIEW from TEST1;

        
       cf1) 오라클 참고 사이트 => http://www.gurubee.net/
       cf2) 더 많은 권한들을 확인 
            select ROLE, PASSWORD_REQUIRED, AUTHENTICATION_TYPE 
	          from dba_roles order by ROLE;

2. 백업 및 복구 ( 도스 컨솔 )
   (1) 백업 
       1) 전체 데이터베이스 ( Full Level Export )
       2) 특정 사용자 ( User Level Export ) *****
          C:\>exp scott/tiger file='C:\~\dump1.dmp' 
	  또는 
	  C:\>exp userid=system/java1019 owner=scott file='C:\~\dump2.dmp'
       3) 특정 테이블 ( Table Level Export )
          
   (2) 복구 
       1) 전체 데이터베이스 ( Full Level Import )
       2) 특정 사용자 ( User Level Import ) *****
          C:\>imp userid=system/java1019 file='C:\SOO\Git\Oracle\3_BACKUP\dump1.dmp' 
	     fromuser=scott touser=SCOTT2
       3) 선택된 테이블 ( Table Level Import ) 

     
[ PART 5 - PL-SQL ] 
1. Procedure : "작업처리순서"
   (1) 설명 
       일련의 "작업처리순서"를 정의해 놓은 것으로 미리 DBMS에 컴파일되어져있어, 
       '프로그램 or 사용자로부터 호출'되면 실행되는 알고리즘 

   (2) 예 
       pro.sql 
       

2. Trigger : "DML방아쇠"
   (1) 설명 
       일련의 "작업처리순서"를 정의해 놓은 것으로 미리 DBMS에 컴파일되어져있어, 
       어떤 조건이 만족되어지는 상황('DML수행')이 발생되면, '자동'호출되는 알고리즘

   (2) 예 
       tri.sql



[ PART 6 - Modeling ]
1. DB 모델링이란 ? 
   현실세계의 업무프로세스를 분석해서 '실체(entity)'를 도출하고,
   소프트웨어로 구현해내기 위한 '데이터' 구조의 뼈대를 작성하는 업무 

2. 관계( relation ) 
  (1) 관계에 대한 이해 
     1) 예 - 고객 table 
       이름  아이디  핸드폰  주소  차넘버  차종   차명  년식 
       ---------------------------------------------------------
       홍길동  aa     1234   서울   a1234  승용차 소나타 1995
       임꺽정  bb     2345   부산   NULL   NULL    NULL  NULL
       이승엽  cc     3456   대전   NULL   NULL    NULL  NULL
       한예슬  dd     4567   대구   d1234  승합차 갤로퍼 2001 
       장동건  ee     5678   대구   NULL   NULL    NULL  NULL
       한예슬  ff     6789   광주   f1234  미니벤 카렌스 1998
       
     2) 예 - 고객 table 보기 변경 
       이름  아이디  핸드폰  주소  차넘버  차종   차명  년식 
       ---------------------------------------------------------
       임꺽정  bb     2345   부산   NULL   NULL    NULL  NULL
       이승엽  cc     3456   대전   NULL   NULL    NULL  NULL
       장동건  ee     5678   대구   NULL   NULL    NULL  NULL
       한예슬  dd     4567   대구   d1234  승합차 갤로퍼 2001
       홍길동  aa     1234   서울   a1234  승용차 소나타 1995
       한예슬  ff     6789   광주   f1234  미니벤 카렌스 1998

     3) 분리 
       <1> 레코드(ROW)를 기준
         1> 테이블1(자동차를 소유하지 않은 고객)
          이름  아이디  핸드폰  주소  
          ----------------------------
          임꺽정  bb     2345   부산   
          이승엽  cc     3456   대전   
          장동건  ee     5678   대구   

         2> 테이블2(자동차를 소유한 고객)
          이름  아이디  핸드폰  주소   차넘버  차종   차명  년식 
          -------------------------------------------------------
          한예슬  dd   4567   대구   d1234  승합차 갤로퍼 2001
          홍길동  aa   1234   서울   a1234  승용차 소나타 1995
          한예슬  ff   6789   광주   f1234  미니벤 카렌스 1998

       <2> 컬럼(COLUMN)을 기준 
         1> 테이블1(개인신상)
          이름  아이디    핸드폰   주소 
          ----------------------------
          임꺽정  bb     2345   부산 
          이승엽  cc     3456   대전  
          장동건  ee     5678   대구  
          한예슬  dd     4567   대구   
          홍길동  aa     1234   서울   
          한예슬  ff     6789   광주
	 
	 2> 테이블2(자동차)
	  차넘버  차종   차명  년식      
          --------------------------
          d1234  승합차 갤로퍼 2001
          a1234  승용차 소나타 1995
          f1234  미니벤 카렌스 1998 

    4) 관계 (능동적으로 표현)
       <1> 부모 / 자식 테이블의 결정 
         1> 부서(dept)는 사원(emp)을 소유한다. (능동형)
          -> 부모('부서' 테이블), 자식('사원' 테이블)
	  -> '사원'이 정의되기위해서는, '부서'가 먼저 정의되어야 한다.

	 2> 개인은 자동차를 소유한다. (능동형)
	   -> 부모('개인신상' 테이블) , 자식('자동차' 테이블)
	   -> '자동차'가 정의되기위해서는, '개인신상'이 먼저 정의되어야 한다.

       <2> 공통컬럼의 요구 ( 2개의 테이블의 관계 형성 )
         1> '개인신상' 테이블의 아이디(PK)
	 2> '자동차' 테이블의 아이디(FK)

       <3> 공통 컬럼이 삽입된 테이블의 정의 1 - (옳음) 
         1> 테이블1(개인신상) - 부모 
	    이름  아이디(PK) 핸드폰 주소 
           ----------------------------
           임꺽정  bb        2345   부산 
           이승엽  cc        3456   대전  
           장동건  ee        5678   대구 
	   한예슬  dd        4567   대구   
           홍길동  aa        1234   서울   
           한예슬  ff        6789   광주

	 2> 테이블2(자동차) - 자식 
	   차넘버(PK)  차종   차명  년식  아이디(FK)
           -----------------------------------------
           d1234     승합차  갤로퍼 2001   dd
           a1234     승용차  소나타 1995   aa
           f1234     미니벤  카렌스 1998   ff

	  Q1> 이름이 '홍길동'인 자동차의 차넘버를 SELECT 하라
          SUB> select ID from MEMBER where NAME='홍길동';
	  SQL> select m.NAME, c.NUM from MEMBER m, CAR c
	      where c.ID=(select ID from MEMBER where NAME='홍길동');

       <4> 공통 컬럼이 삽입된 테이블의 정의 2 - (잘못됨)	 
	 1> 테이블2(자동차) - 부모  
	   차넘버(PK) 차종   차명  년식
           ------------------------------
           d1234     승합차 갤로퍼 2001 
           a1234     승용차 소나타 1995 
           f1234     미니벤 카렌스 1998 

         2> 테이블1(개인신상) - 자식  
	   이름  아이디(PK)   핸드폰   주소  차넘버(FK)
           -----------------------------------------
           임꺽정  bb        2345   부산   NULL 
           이승엽  cc        3456   대전   NULL
           장동건  ee        5678   대구   NULL 
	   한예슬  dd        4567   대구   d1234
           홍길동  aa        1234   서울   a1234 
           한예슬  ff        6789   광주   f1234

  (2) 관계의 종류 
     1) Cardinality 관점
        <1> 일대일( 1 : 1 ) : 모델링 가능 
	   ex) 부서 / 부서장 
	<2> 일대다( 1 : N ) : 모델링 가능 
	   ex) 부서 / 사원 
	<3> 다대다( N : N ) : 모델링 불가능 
	   ex) 고객 / 상품 

	 # 다대다 관계의 '해소' #
	   -> N:N는 1:N으로 변경(중간테이블)해서 모델링해야 함
	  ex1) 고객 / 상품
	  1> 테이블1(고객) - 부모 
	      이름    아이디(PK)   핸드폰 
	      -----------------------------
	      홍길동  hong      011-123-1234
	      이순신  lee       019-456-4567

	  2> 테이블2(상품) - 부모 
	      상품ID(PK) 이름    회사번호  가격 
	      ----------------------
	      P0001    새우깡  농심      1200
	      P0002    맛동산  해태       700

	  3> 테이블3(구매) - 자식 
	     구매번호(PK) 고객아이디(FK) 상품이름(FK)  구매일자 
	     ---------------------------------------------------
	     001         hong         P0001   2008/04
	     002         hong         P0002   2007/10
	     003         lee          P0001   2006/12

	  ex2) 공장 / 제품
	  ex3) 학생 / 동아리
	  ex4) 학생 / 과목 

     2) Relationship Type 관점
       <1> 식별관계 ( Identifying )
          1> 정의: 부모의 PK컬럼이 자식의 'PK컬럼'으로 전이 되는 것
	  2> 무조건 No nulls 

	  ex) alter table EMP2 drop constraint PK_EMP2;
	      alter table EMP2 add constraint PK_EMP22 primary key(EMPNO, DEPTNO);

       <2> 비식별관계 ( Non-Identifying )
          1> 정의: 부모의 PK컬럼이 자식의 '일반컬럼'이 전이 되는 것
	  2> 2개중 택일 
	     - Null Allowed 
	     - No nulls

	cf)  모델링툴 다운로드 URL 
	http://ko.exerd.com/#download-section


3. 단계( step )
  (1) 솔루션(solution) 제작 순서 
     1) 현실세계의 '업무프로세스 분석' / '요구 분석'
     2) '개'념적 모델링 ( ppt, txt )
     3) '논'리적 모델링 ( diagram with tool ) 
     4) '물'리적 모델링 ( diagram with tool ) 
     5) DDL 생성  
     6) 구현( 디자인 + 프로그램 )
     7) 테스팅 
     8) 서비스(유지보수)  
     
  (2) DB 모델링 순서 
     1) 업무 분석표

     2) 개념적 모델링 ( '선택성.ppt' 참고 )
        '엔티티, 속성, 관계' 를 추출해서 개념적 ERD를 정의하는 단계 

	ex1) 학생/과목/등록 - ( N:N 관계 예 )
	  학생 [학번(PK), 이름, 주소, 연락처]
	    | 
	  등록 [등록번호(PK), 학번(FK), 과목번호(FK), 점수]
	    | 
	  과목 [과목번호(PK), 과목명, 커리큘럼]

	ex2) 부서/사원 - ( 1:N 관계 예 )
	  부서[부서코드(PK), 부서명, 위치]
	    | 
	  사원[사번(PK), 이름, 주소, 입사일, 성별, 부서코드(FK) ]
	
     3) 논리적 모델링
        개념적 모델링단계에서 정의된 ERD를 매핑룰을 적용해서 
	스키마를 생성하고 정규화까지를 포함하는 단계 
	(스키마는 개체들의 관계 제약조건등의 명세를 의미)
    
        ex) ERD로 테스팅..
    
     4) 물리적 모델링 
        논리적 모델링에서 작성된 내용을 토대로 
	'DBMS를 결정', '컬럼타입과 사이즈'를 정의, 각 종 '제약조건'
	(CHECK, NOT NULL, PK, FK, UNIQUE), 인덱스등을 정의하여
	'역정규화'까지를 포함하는 단계 

        ex) ERD로 테스팅..
   
     5) SQL/PLSQL을 작성한다. 
       <1> create.sql 
       <2> drop.sql 
       <3> insert.sql 
       <4> select.sql ( 다양한 경우의 검색경우를 check!! ) 

 (3) ERD의 관계 표기 
     1) 표기 
       <1> 실선 : 식별관계 (Identifying Type)
          (부모 테이블의 PK가 자식테이블의 FK/PK가 되는 경우)
       <2> 점선 : 비식별관계 (Non-Identifying Type)
          (부모 테이블의 PK가 자식테이블의 일반컬럼 FK가되는 경우)
       <3> O : Optional - 선택 ( 0개가 될 수 있다.)
       <4> | : Mandatory - 필수 ( 1개가 있어야 된다. )
       <5> 문어다리 : Many (여러개가 될 수 있다.)
       <6> - : Exactly ( 오직 정해진 개수만 될 수 있다. )

       cf) 선택성.ppt 참고 할 것!!

     2) 관계 구분  
       <1> Cardinality (자식테이블측)
         1> Zero, (One or) More
	 2> One or More 
	 3> Zero or One 
	 4> Exactly 

       <2> Relationship Type (자식테이블측)
         1> Identifying (식별)
	 2> Non-Identifying (비식별)

  (4) ERD로 해야 할 모델링 
     1) 논리적 모델링 
       DBMS가 정해지지 않은 상태에서의 ERD  

     2) 물리적 모델링 
       DBMS이 정해져서 해당 DBMS에 적합한 테이블이름과 
       컬럼, 데이터타입/사이즈를 모두 영문으로 바꾼 ERD

  (5) DDL 작성 
     1) forward Engineering 
        -> 가독성 떨러짐 
     2) 코드로 직접 작성 
        -> 이걸로 하자
