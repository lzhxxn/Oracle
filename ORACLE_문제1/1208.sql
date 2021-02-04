-- 급여 2000이상인 사원들의 부서별 평균급여의 반올림값 (급여가 높은 순 정렬)
select DEPTNO, round(avg(SAL)) from EMP
where SAL>=2000 group by DEPTNO order by round(avg(SAL)) desc;

select DEPTNO, round(avg(SAL)) aa from EMP
where SAL>=2000 group by DEPTNO order by round(avg(SAL)) desc;

select DEPTNO, round(avg(SAL)) from EMP
where SAL>=2000 group by DEPTNO order by 2 desc;

-- 급여 1000이상인 사원들의 부서별 평균급여의 반올림값을 부서번호로 내림차순 정렬
--단, 부서별 평균급여가 2000이상인 값만 출력하시오
-- ~별 -> group by // 한 번 더 제약을 걸고싶을 때 HAVING 절 추가! 
select DEPTNO, round(avg(SAL)) "평균급여" from EMP
where SAL>=1000 group by DEPTNO having round(avg(SAL))>=2000 order by DEPTNO desc;

--select DEPTNO, round(avg(SAL)) "평균급여" from EMP
--where SAL>=1000 group by DEPTNO having aa>=2000 order by DEPTNO desc;
-- # 주의 : having 절은 alias을 사용 할 수 없다.
--순서 ***--------------------------------------------
-- select - from - where - group by - having - order by (SFWGHO)
-----------------------------------------------------
--각 부서별 "같은 업무를 하는" 사원의 인원수를 구하여 부서번호, 업무명, 인원수를 출력하라
--(단, 부서번호과 업무명으로 각각 내림차순 정렬!)
-- 부서별 , 같은 업무별
select DEPTNO, JOB, COUNT(EMPNO) from EMP group by DEPTNO, JOB order by DEPTNO desc, JOB desc;

-- < 일반화 >
-- [1] 순서 ( SF - WGHO ) 
-- select - from - where - group by - having - order by (SFWGHO)
-- [2] where 절에는 그룹함수를 사용 불가
-- [3] having 절에서는 alias 사용 X

select CEIL(11.012) from DUAL;
select CEIL(-11.012) from DUAL;
select FLOOR(12.999) from DUAL;
select CEIL(12.499) from DUAL;
select FLOOR(-12.999) from DUAL;



-- 조인 (JOIN)
-- 하나의 테이블로는 원하는 컬럼정보를 참조 할 수 없을경우 관련된 테이블을 결합하여 참조하는 방법. 2개이상의 테이블에는 공동컬럼이 존재해야함.
-- 일반적인 조인 NATURAL 조인 (공통된 컬럼비교) EQUI 조인이라 불리기도한다.

-- < 문제 > 
-- 사원번호가 7900인 사원의 부서이름을 출력하시오
      select EMP.EMPNO, DEPT.DNAME from EMP, DEPT where EMP.DEPTNO=DEPT.DEPTNO;--형태1
      select e.EMPNO, d.DNAME from EMP e, DEPT d where e.DEPTNO=d.DEPTNO;--형태1
      select e.EMPNO, d.DNAME from EMP e join DEPT d on e.DEPTNO=d.DEPTNO;--형태2
      select EMP.EMPNO, DEPT.DNAME from EMP join DEPT using(DEPTNO); 
      select EMPNO, DNAME from EMP natural join DEPT; --형태4
      
      select EMP.EMPNO, DEPT.DNAME from EMP, DEPT where EMP.DEPTNO=DEPT.DEPTNO and EMP.EMPNO=7900;  --형태1
      select e.EMPNO, d.DNAME from EMP e, DEPT d where e.DEPTNO=d.DEPTNO and EMP.EMPNO=7900; --형태1
      select e.EMPNO, d.DNAME from EMP e join DEPT d on e.DEPTNO=d.DEPTNO where e.EMPNO=7900; --형태2
      select EMP.EMPNO, DEPT.DNAME from EMP join DEPT using(DEPTNO) where EMPNO=7900; --형태3
      select EMPNO, DNAME from EMP natural join DEPT where EMPNO=7900; --형태4 (일반적으로 가장 많이 쓰인다)
      
-- < 일반화 : DQL의 배치순서, 실행순서 > --
-- select XX --> 6
-- from XX --> 1
-- (join XX) --> 2
-- where XX --> 3
-- group by XX --> 4
-- having XX -->5
-- order by XX -->7 

 -- <2> SELF 조인
 -- 
-- <문제>
--JAMES의 매니저는 BLAKE이다. (13명의 MGR를 출력)
select EMPNO, ENAME, MGR from EMP; --MGR(MANAGER)
SELECT e1.ename ||'의 매니저는 ' "사원", e2.ename || '입니다.' "매니저" FROM emp e1,emp e2 WHERE e1.mgr=e2.empno AND e2.empno= e1.mgr; --유민
select e.ename||'의 매니져는 ', f.ename||'이다' from emp e, emp f where e.mgr=f.empno and f.empno= e.mgr; --종범

select e.ENAME||'의 매니져는 ', m.ENAME||'이다' 
	     from EMP e, EMP m where e.MGR=m.EMPNO;
select e.ENAME||'의 매니져는 ', m.ENAME||'이다' 
	     from EMP e, EMP m where e.MGR=m.EMPNO and e.ENAME='JAMES';
 select e.ENAME||'의 매니져는 ', m.ENAME||'이다' 
	     from EMP e join EMP m on e.MGR=m.EMPNO 
	     where e.ENAME='JAMES'; -- join on절로

--1-4. 서브쿼리 : 하나의 DQL문장절에 부속된 또 다른 select문장. 두 번 이상 질의를 해야 얻을 수 있는 결과를 한번의 질의로 해결케하는 쿼리.
-- 사원번호가 7900인 사원의 부서이름 출력하시오.
--Sub/Main>
select DEPTNO from EMP where EMPNO=7900; --<1> 서브쿼리
select DNAME from DEPT where DEPTNO=30; --<2> 메인쿼리
--SQL>
select DNAME from DEPT where DEPTNO=(select DEPTNO from EMP where EMPNO=7900);
--Join>
select e.EMPNO, d.DNAME from EMP e, DEPT d  
          where e.DEPTNO=d.DEPTNO and e.EMPNO=7900;

--< 복수 행 : 서브쿼리의 실행결과가 '여러개의 행'을 return하는 경우의 쿼리 >

-- 부서번호가 10번인 사원급여와 급여가 같은 사원의 이름과 커미션을 출력 (서브 - 메인 / SQL / 조인)
--1> in - or

--Sub> select SAL from EMP where DEPTNO=10;
--Main> select ENAME, SAL from EMP where SAL=? 	
--Err> select ENAME, SAL from EMP where SAL=(select SAL from EMP where DEPTNO=10);
select ENAME, SAL from EMP 
where SAL in (select SAL from EMP where DEPTNO=10); --SQL

select ENAME, SAL from EMP 
where SAL=any(select SAL from EMP where DEPTNO=10); --SQL

select ENAME, SAL from EMP
where SAL=2450 or SAL=5000 or SAL=1300; --효과

--<2> all - and
-- 급여가 가장 많은 'MANAGER'보다 급여가 같거나 많은 사원의 JOB,SAL을 출력!!
select SAL from EMP where JOB='MANAGER'; --SUB
--select JOB,SAL from EMP where SAL>=?; --MAIN
select JOB,SAL from EMP where SAL>=(select max(SAL) from EMP where JOB='MANAGER');--SQL
select JOB,SAL from EMP where SAL>=all(select max(SAL) from EMP where JOB='MANAGER'); --SQL (all)
select JOB,SAL from EMP where SAL>=2975 and SAL>=2850 and SAL>=2450; --논리연산자 효과 

--<3> any  ( any가 in보다 범위가 넓다. in은 맞아떨어져야한다. )
-- 급여가 가장 큰 'SALESMAN' 보다 급여가 작은 사원의 JOB, SAL을 출력!
select SAL from EMP where JOB='SALESMAN'; --SUB
--select JOB,SAL from EMP where SAL<? --MAIN
select JOB, SAL from EMP where SAL<any(select SAL from EMP where JOB='SALESMAN');--SQL
select JOB,SAL from EMP where SAL<1600 or SAL<1250 or SAL<1500;--효과

--<4> exists 
-- '부서번호'가 10인 사원이 존재하면 모든 부서의 이름을 출력!
select * from EMP where DEPTNO=10; --SUB
select DNAME from DEPT where exists(select * from EMP where DEPTNO=10); --MAIN

--[3] 복수 컬럼 SUB-QUERY
--	    -> SUB-QUERY의 실행결과가 여러개의 '컬럼을 값'
--	       (AND 여러개의 행)을 리턴해 주는 쿼리 
--'부서번호'가 30인 사원의 SAL과 COMM이 같은 사원들의 '이름'과 '부서번호' 출력! 
select SAL, COMM from EMP where DEPTNO=30; -- Sub> 
select ENAME, DEPTNO from EMP where (SAL, COMM) in (select SAL, COMM from EMP where DEPTNO=30); --4개 --MAIN
select ENAME, DEPTNO from EMP where (SAL, nvl(COMM, 0)) in (select SAL, nvl(COMM, 0) from EMP where DEPTNO=30); --6개 --MAIN 비교.
--null을 0으로 간주해서 +2

--[4] 상호 관련 SUB-QUERY
--	    -> MAIN-QUERY절에 사용된 테이블이 SUB-QUERY절에 다시
--	       재사용되는 경우의 서브쿼리 
 select avg(e1.SAL) from EMP e1, EMP e2 where e1.DEPTNO=e2.DEPTNO; --수행O --SUB
-- select avg(e1.SAL) from EMP e1 where e1.DEPTNO=e2.DEPTNO; --수행X --SUB-Err 
select e1.EMPNO, e1.SAL from EMP e1 where SAL>(select avg(SAL) from EMP e2 where e1.DEPTNO=e2.DEPTNO); --MAIN

        --cf) 연습문제
        -- 사원번호가 7900인 사원번호와 부서이름을 출력하라           
select e.EMPNO, d.DNAME from EMP e, DEPT d where e.DEPTNO=d.DEPTNO and e.EMPNO=7900;  -- by 조인 
select DNAME from DEPT where DEPTNO=(select DEPTNO from EMP where EMPNO=7900); -- by 서브쿼리 

-- 평균급여보다 많은 받는 사원의 이름과 급여 출력!  // where ->그룹함수 X max 등
select ENAME, SAL from EMP where SAL>avg(SAL); -- Err
select avg(SAL) from EMP; --Sub
--select ENAME, SAL from EMP where SAL>? --Main
select ENAME, SAL from EMP where SAL>(select avg(SAL) from EMP); --SQL

--1) 부서번호가 10번인 사원 평균급여 보다 급여가 적은 사원의 이름과 급여( 단, 급여가 높은 순으로 정렬 )
select avg(SAL) from EMP where DEPTNO=10; --sub 단일행 avg니까.
--	Main> select ENAME, SAL from EMP where SAL<?;
select ENAME, SAL from EMP where SAL<(select avg(SAL) from EMP where DEPTNO=10) order by SAL desc;

--2) 부서번호가 10번인 사원 평균급여 보다 급여가 적은 사원들의 부서별 평균 급여 ( 단 10번부서는 제외할 것, 부서번호 역정렬, 급여는 반올림할 것 )
select avg(SAL) from EMP where DEPTNO=10; --Sub>
--select DEPTNO, round(avg(SAL)) from EMP --Main>
--	      where SAL< ? 
--	      group by DEPTNO
--	      having DEPTNO != 10
--	      order by DEPTNO desc;
select DEPTNO, round(avg(SAL)) from EMP
	      where SAL< (select avg(SAL) from EMP where DEPTNO=10) 
	      group by DEPTNO
	      having DEPTNO != 10
	      order by DEPTNO desc; --SQL>
          
          
             -- 미션( 학생들의공간/SQL )
	      -- 문제1+문제2 는 모범답안과 비교해 볼 것!
	      -- 문제3 풀기 