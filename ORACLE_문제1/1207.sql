select ename, nvl(comm, 0) from emp where comm is null;
select avg(SAL) from EMP;
select max(SAL) from EMP;
select chr(65) from dual;
select ENAME||' is a ' ||JOB from EMP;
select concat(ENAME, ' is a '), JOB from EMP;
select initcap('the lion') from dual;
select lower('MY NAME IS KHS') from dual;
select lower(ename) from emp;
select LPAD('khs', 13, '*#') from DUAL;
select LPAD('khs', 13, ' ') from DUAL;
select RPAD('khs', 13, '*#') from DUAL;
select LTRIM('xyxXxyLAST WORDxy', 'xy') from DUAL;
select LTRIM('xyyXxyLAST WORDxy', 'xy') from DUAL;
select LTRIM('     LAST WORDxy', ' ') from DUAL;
select LTRIM('     LAST WORDxy') from DUAL;
select RTRIM('xyxXxyLAST WORDxy', 'xy') from DUAL;
select length('WORD   ') from dual;
select length(rtrim('WORD   ')) from dual;
select 'JACK and JUE' from DUAL;
select replace('JACK and JUE', 'J','BL') from DUAL;
select DNAME from DEPT;
select replace(DNAME, 'A', 'i') from DEPT;
select SUBSTR('ABCDEFG', 3, 2) from DUAL;
-- ename의 두번째 자리가 'A'인 사원의 이름을 출력
select ENAME from EMP where ENAME like '_A%';
select ENAME from EMP where substr(ENAME,2,1)='A';
select ascii('A') from dual;
select ASCII('"') from DUAL;
select ASCII('#') from DUAL;    
select ASCII('3') from DUAL;    
select length('진달래 꽃') from DUAL; 
select length('abC D') from DUAL;
select GREATEST('CC', 'ABCDE', 'CA') from DUAL;
select GREATEST('12', '132', '119') from DUAL;
select GREATEST('가나', '가다', '가자') from DUAL; 
select LEAST('CC', 'ABCDE', 'CA') from DUAL; 
select LEAST('12', '132', '119') from DUAL;
select LEAST('가나', '가다', '가자') from DUAL;
select INSTR('CORPORATE FLOOR', 'OR', 3, 2) from DUAL;
select INSTR('CORPORATE FLOOR', 'OR', 6, 1) from DUAL;
select ENAME, NVL(COMM, 100) from EMP;
select ENAME, NVL(COMM, 0) from EMP;
select ABS(-15) from DUAL;
select CEIL(11.012) from DUAL;
select CEIL(-11.012) from DUAL;
select MONTHS_BETWEEN('80/01/02', '81/02/04') from DUAL;
-- empno가 7782인 사원의 현재까지의 근무월수
select MONTHS_BETWEEN(SYSDATE, HIREDATE) from EMP where EMPNO=7782;
select SYSDATE from dual;
select HIREDATE from EMP where EMPNO=7782;
select HIREDATE, ADD_MONTHS(HIREDATE, 7) from EMP where EMPNO=7782;
select ADD_MONTHS('90/11/04', 2) from DUAL;
select LAST_DAY('19/10/29') from DUAL;
select hiredate, LAST_DAY(hiredate) from EMP;
select NEW_TIME('08/12/04', 'GMT', 'PDT') from DUAL;
select hiredate, NEW_TIME(hiredate, 'GMT', 'PDT') from EMP;
select MONTHS_BETWEEN('80/01/02', '81/02/04') from DUAL;
select MONTHS_BETWEEN(SYSDATE, HIREDATE) from EMP where EMPNO=7782;
select SYSDATE, NEXT_DAY(SYSDATE,4) from DUAL;
select SYSDATE, NEXT_DAY(SYSDATE,7) from DUAL;
select SYSDATE, NEXT_DAY(SYSDATE,1) from DUAL;
select SYSDATE, NEXT_DAY(SYSDATE,2) from DUAL;
select SYSDATE from dual;
select SYSDATE, to_char(SYSDATE, 'D')from dual;
select SYSDATE, to_char(SYSDATE, 'DAY')from dual;
select SYSDATE, to_char(SYSDATE, 'DY') from dual;
select SYSDATE, to_char(SYSDATE, 'DD') from dual; --날짜
select SYSDATE, to_char(SYSDATE, 'MM') from dual;
select SYSDATE, to_char(SYSDATE, 'MONTH') from dual;
select SYSDATE, to_char(SYSDATE, 'YY') from dual;
select SYSDATE, to_char(SYSDATE, 'YYYY') from dual;
select SYSDATE, to_char(SYSDATE, 'MM-DD-YY') from dual;
select SYSDATE, to_char(SYSDATE, 'HH') from dual;
select SYSDATE, to_char(SYSDATE, 'HH24') from dual;
select SYSDATE, to_char(SYSDATE, 'MI') from dual;
select SYSDATE, to_char(SYSDATE, 'SS') from dual;
select TO_CHAR(SYSDATE, 'fmAM HH:MI:SS') from DUAL;
select TO_CHAR(SYSDATE, 'AM HH:MI:SS') from DUAL; 
select TO_CHAR(SYSDATE, 'YYYY-MM-DD AM HH:MI:SS DAY') from DUAL;  -- 중요 !!!!
alter session set NLS_LANGUAGE='ENGLISH';
select to_char(SYSDATE, 'DDSP') from dual; --서수 one two three
select to_char(SYSDATE, 'DDTH') from dual; --simple 서수
select to_char(SYSDATE, 'DDSPTH') from dual; -- 제대로 된 서수
--(5) 복수행 함수 *****
--1) count(컬럼명)
select count(ename) from emp;
select count(comm) from emp;
select count(*) from emp;
select count(EMPNO) from emp;   -- 굳 !! 제일 좋음. 하나의 컬럼만 뽑아서 계산.

--2) sum(컬럼명)
select sum(comm) from emp;
select sum(sal) from emp;

--3)avg(컬럼명)
select avg(sal) from emp;
select avg(comm) from emp; -- null 제외
select avg(nvl(comm,0)) from emp; -- null 포함  < null -> 0 간주 >

--4) max / min ( 컬럼명 )
select max(sal) from emp;
select min(sal) from emp;
select max(sal) - min(sal) from EMP;

--최고 급여자의 사원이름을 출력하시오.
select ENAME, SAL from EMP where SAL=max(SAL);  -- 그룹함수는 where 조건 절에서 사용 불가.
select ENAME, SAL from EMP where SAL=(select max(SAL) from EMP);  --select절안에서 사용한거라 가능. sub Q

--5) VARIANCE(컬럼명) 분산
select VARIANCE(comm) from EMP;

--6) STDDEV(컬럼명) 표준편차
select STDDEV(comm) from EMP; -- 루트가 씌워진 값.

--< Question >
--부서별 평균연봉을 출력
select DEPTNO, SAL, DEPTNO from emp;
select DEPTNO, avg(SAL) from EMP; -- 에러 그룹을 져줘야한다.
select DEPTNO, round(avg(SAL)) from EMP group by DEPTNO; --라운드 반올림값! round

-- 급여 2000 이상인 사원들의 부서별 평균급여의 반올림값
select DEPTNO, round(avg(SAL)) from EMP where SAL>=2000 group by DEPTNO; 
select DEPTNO, round(avg(SAL)) from EMP where SAL>=2000 group by DEPTNO order by 








