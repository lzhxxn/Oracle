-- < 문제 (JOIN & SUB-QUERY) >

--(1) EMP와 DEPT TABLE을 JOIN하여 부서번호, 부서명, 이름, 급여를 출력하라.
select EMPNO, DNAME, ENAME, SAL from EMP natural join DEPT;

--(2) 이름이 'ALLEN'인 사원의 부서명을 출력하라. 
select DNAME from DEPT natural join EMP where ENAME='ALLEN';

--(3)  DEPT Table에 있는 모든 부서를 출력하고, EMP Table에 있는 DATA와 JOIN하여 모든 사원의 이름, 부서번호, 부서명, 급여를 출력하라. 
select ENAME, DEPTNO, DNAME, SAL from EMP natural join DEPT;

--(4) EMP Table에 있는 EMPNO와 MGR을 이용하여 서로의 관계를 다음과 같이 출력하라. --> SMITH의 매니져는 FORD이다. 
select e1.ENAME||'의 매니저는', e2.ENAME||' 입니다.' from EMP e1, EMP e2 where e1.mgr = e2.EMPNO;
select * from EMP;

--(5) 'ALLEN'의 직무와 같은 사람의 이름, 부서명, 급여, 직무를 출력하라.
select ENAME, DNAME, SAL, JOB from EMP natural join DEPT where JOB=(select JOB from EMP
where ENAME='ALLEN');

--(6) 'JONES'가 속해있는 부서의 모든 사람의 부서번호, 사원번호, 이름, 입사일, 급여를 출력하라. 
select DEPTNO, EMPNO, ENAME, HIREDATE, SAL from EMP natural join DEPT
where DEPTNO=(select DEPTNO from EMP where ENAME='JONES');

--(7) 전체 사원의 평균임금보다 많은 사원의 사원번호, 이름, 부서명, 입사일, 지역, 급여를 출력하라. 
select EMPNO, ENAME, DNAME, HIREDATE, LOC, SAL from EMP natural join DEPT 
where SAL>(select avg(SAL) from EMP);

--(8) 10번 부서 사람들 중에 20번 부서의 사원과 같은 업무를 하는 사원의 사원번호, 업무, 이름, 부서명, 입사일, 지역을 출력하라.
select EMPNO, JOB, ENAME, DNAME, HIREDATE, LOC from EMP natural join DEPT where JOB 

