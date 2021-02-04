-- < ���� (JOIN & SUB-QUERY) >

--(1) EMP�� DEPT TABLE�� JOIN�Ͽ� �μ���ȣ, �μ���, �̸�, �޿��� ����϶�.
select EMPNO, DNAME, ENAME, SAL from EMP natural join DEPT;

--(2) �̸��� 'ALLEN'�� ����� �μ����� ����϶�. 
select DNAME from DEPT natural join EMP where ENAME='ALLEN';

--(3)  DEPT Table�� �ִ� ��� �μ��� ����ϰ�, EMP Table�� �ִ� DATA�� JOIN�Ͽ� ��� ����� �̸�, �μ���ȣ, �μ���, �޿��� ����϶�. 
select ENAME, DEPTNO, DNAME, SAL from EMP natural join DEPT;

--(4) EMP Table�� �ִ� EMPNO�� MGR�� �̿��Ͽ� ������ ���踦 ������ ���� ����϶�. --> SMITH�� �Ŵ����� FORD�̴�. 
select e1.ENAME||'�� �Ŵ�����', e2.ENAME||' �Դϴ�.' from EMP e1, EMP e2 where e1.mgr = e2.EMPNO;
select * from EMP;

--(5) 'ALLEN'�� ������ ���� ����� �̸�, �μ���, �޿�, ������ ����϶�.
select ENAME, DNAME, SAL, JOB from EMP natural join DEPT where JOB=(select JOB from EMP
where ENAME='ALLEN');

--(6) 'JONES'�� �����ִ� �μ��� ��� ����� �μ���ȣ, �����ȣ, �̸�, �Ի���, �޿��� ����϶�. 
select DEPTNO, EMPNO, ENAME, HIREDATE, SAL from EMP natural join DEPT
where DEPTNO=(select DEPTNO from EMP where ENAME='JONES');

--(7) ��ü ����� ����ӱݺ��� ���� ����� �����ȣ, �̸�, �μ���, �Ի���, ����, �޿��� ����϶�. 
select EMPNO, ENAME, DNAME, HIREDATE, LOC, SAL from EMP natural join DEPT 
where SAL>(select avg(SAL) from EMP);

--(8) 10�� �μ� ����� �߿� 20�� �μ��� ����� ���� ������ �ϴ� ����� �����ȣ, ����, �̸�, �μ���, �Ի���, ������ ����϶�.
select EMPNO, JOB, ENAME, DNAME, HIREDATE, LOC from EMP natural join DEPT where JOB 

