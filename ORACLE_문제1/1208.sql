-- �޿� 2000�̻��� ������� �μ��� ��ձ޿��� �ݿø��� (�޿��� ���� �� ����)
select DEPTNO, round(avg(SAL)) from EMP
where SAL>=2000 group by DEPTNO order by round(avg(SAL)) desc;

select DEPTNO, round(avg(SAL)) aa from EMP
where SAL>=2000 group by DEPTNO order by round(avg(SAL)) desc;

select DEPTNO, round(avg(SAL)) from EMP
where SAL>=2000 group by DEPTNO order by 2 desc;

-- �޿� 1000�̻��� ������� �μ��� ��ձ޿��� �ݿø����� �μ���ȣ�� �������� ����
--��, �μ��� ��ձ޿��� 2000�̻��� ���� ����Ͻÿ�
-- ~�� -> group by // �� �� �� ������ �ɰ���� �� HAVING �� �߰�! 
select DEPTNO, round(avg(SAL)) "��ձ޿�" from EMP
where SAL>=1000 group by DEPTNO having round(avg(SAL))>=2000 order by DEPTNO desc;

--select DEPTNO, round(avg(SAL)) "��ձ޿�" from EMP
--where SAL>=1000 group by DEPTNO having aa>=2000 order by DEPTNO desc;
-- # ���� : having ���� alias�� ��� �� �� ����.
--���� ***--------------------------------------------
-- select - from - where - group by - having - order by (SFWGHO)
-----------------------------------------------------
--�� �μ��� "���� ������ �ϴ�" ����� �ο����� ���Ͽ� �μ���ȣ, ������, �ο����� ����϶�
--(��, �μ���ȣ�� ���������� ���� �������� ����!)
-- �μ��� , ���� ������
select DEPTNO, JOB, COUNT(EMPNO) from EMP group by DEPTNO, JOB order by DEPTNO desc, JOB desc;

-- < �Ϲ�ȭ >
-- [1] ���� ( SF - WGHO ) 
-- select - from - where - group by - having - order by (SFWGHO)
-- [2] where ������ �׷��Լ��� ��� �Ұ�
-- [3] having �������� alias ��� X

select CEIL(11.012) from DUAL;
select CEIL(-11.012) from DUAL;
select FLOOR(12.999) from DUAL;
select CEIL(12.499) from DUAL;
select FLOOR(-12.999) from DUAL;



-- ���� (JOIN)
-- �ϳ��� ���̺�δ� ���ϴ� �÷������� ���� �� �� ������� ���õ� ���̺��� �����Ͽ� �����ϴ� ���. 2���̻��� ���̺��� �����÷��� �����ؾ���.
-- �Ϲ����� ���� NATURAL ���� (����� �÷���) EQUI �����̶� �Ҹ��⵵�Ѵ�.

-- < ���� > 
-- �����ȣ�� 7900�� ����� �μ��̸��� ����Ͻÿ�
      select EMP.EMPNO, DEPT.DNAME from EMP, DEPT where EMP.DEPTNO=DEPT.DEPTNO;--����1
      select e.EMPNO, d.DNAME from EMP e, DEPT d where e.DEPTNO=d.DEPTNO;--����1
      select e.EMPNO, d.DNAME from EMP e join DEPT d on e.DEPTNO=d.DEPTNO;--����2
      select EMP.EMPNO, DEPT.DNAME from EMP join DEPT using(DEPTNO); 
      select EMPNO, DNAME from EMP natural join DEPT; --����4
      
      select EMP.EMPNO, DEPT.DNAME from EMP, DEPT where EMP.DEPTNO=DEPT.DEPTNO and EMP.EMPNO=7900;  --����1
      select e.EMPNO, d.DNAME from EMP e, DEPT d where e.DEPTNO=d.DEPTNO and EMP.EMPNO=7900; --����1
      select e.EMPNO, d.DNAME from EMP e join DEPT d on e.DEPTNO=d.DEPTNO where e.EMPNO=7900; --����2
      select EMP.EMPNO, DEPT.DNAME from EMP join DEPT using(DEPTNO) where EMPNO=7900; --����3
      select EMPNO, DNAME from EMP natural join DEPT where EMPNO=7900; --����4 (�Ϲ������� ���� ���� ���δ�)
      
-- < �Ϲ�ȭ : DQL�� ��ġ����, ������� > --
-- select XX --> 6
-- from XX --> 1
-- (join XX) --> 2
-- where XX --> 3
-- group by XX --> 4
-- having XX -->5
-- order by XX -->7 

 -- <2> SELF ����
 -- 
-- <����>
--JAMES�� �Ŵ����� BLAKE�̴�. (13���� MGR�� ���)
select EMPNO, ENAME, MGR from EMP; --MGR(MANAGER)
SELECT e1.ename ||'�� �Ŵ����� ' "���", e2.ename || '�Դϴ�.' "�Ŵ���" FROM emp e1,emp e2 WHERE e1.mgr=e2.empno AND e2.empno= e1.mgr; --����
select e.ename||'�� �Ŵ����� ', f.ename||'�̴�' from emp e, emp f where e.mgr=f.empno and f.empno= e.mgr; --����

select e.ENAME||'�� �Ŵ����� ', m.ENAME||'�̴�' 
	     from EMP e, EMP m where e.MGR=m.EMPNO;
select e.ENAME||'�� �Ŵ����� ', m.ENAME||'�̴�' 
	     from EMP e, EMP m where e.MGR=m.EMPNO and e.ENAME='JAMES';
 select e.ENAME||'�� �Ŵ����� ', m.ENAME||'�̴�' 
	     from EMP e join EMP m on e.MGR=m.EMPNO 
	     where e.ENAME='JAMES'; -- join on����

--1-4. �������� : �ϳ��� DQL�������� �μӵ� �� �ٸ� select����. �� �� �̻� ���Ǹ� �ؾ� ���� �� �ִ� ����� �ѹ��� ���Ƿ� �ذ����ϴ� ����.
-- �����ȣ�� 7900�� ����� �μ��̸� ����Ͻÿ�.
--Sub/Main>
select DEPTNO from EMP where EMPNO=7900; --<1> ��������
select DNAME from DEPT where DEPTNO=30; --<2> ��������
--SQL>
select DNAME from DEPT where DEPTNO=(select DEPTNO from EMP where EMPNO=7900);
--Join>
select e.EMPNO, d.DNAME from EMP e, DEPT d  
          where e.DEPTNO=d.DEPTNO and e.EMPNO=7900;

--< ���� �� : ���������� �������� '�������� ��'�� return�ϴ� ����� ���� >

-- �μ���ȣ�� 10���� ����޿��� �޿��� ���� ����� �̸��� Ŀ�̼��� ��� (���� - ���� / SQL / ����)
--1> in - or

--Sub> select SAL from EMP where DEPTNO=10;
--Main> select ENAME, SAL from EMP where SAL=? 	
--Err> select ENAME, SAL from EMP where SAL=(select SAL from EMP where DEPTNO=10);
select ENAME, SAL from EMP 
where SAL in (select SAL from EMP where DEPTNO=10); --SQL

select ENAME, SAL from EMP 
where SAL=any(select SAL from EMP where DEPTNO=10); --SQL

select ENAME, SAL from EMP
where SAL=2450 or SAL=5000 or SAL=1300; --ȿ��

--<2> all - and
-- �޿��� ���� ���� 'MANAGER'���� �޿��� ���ų� ���� ����� JOB,SAL�� ���!!
select SAL from EMP where JOB='MANAGER'; --SUB
--select JOB,SAL from EMP where SAL>=?; --MAIN
select JOB,SAL from EMP where SAL>=(select max(SAL) from EMP where JOB='MANAGER');--SQL
select JOB,SAL from EMP where SAL>=all(select max(SAL) from EMP where JOB='MANAGER'); --SQL (all)
select JOB,SAL from EMP where SAL>=2975 and SAL>=2850 and SAL>=2450; --�������� ȿ�� 

--<3> any  ( any�� in���� ������ �д�. in�� �¾ƶ��������Ѵ�. )
-- �޿��� ���� ū 'SALESMAN' ���� �޿��� ���� ����� JOB, SAL�� ���!
select SAL from EMP where JOB='SALESMAN'; --SUB
--select JOB,SAL from EMP where SAL<? --MAIN
select JOB, SAL from EMP where SAL<any(select SAL from EMP where JOB='SALESMAN');--SQL
select JOB,SAL from EMP where SAL<1600 or SAL<1250 or SAL<1500;--ȿ��

--<4> exists 
-- '�μ���ȣ'�� 10�� ����� �����ϸ� ��� �μ��� �̸��� ���!
select * from EMP where DEPTNO=10; --SUB
select DNAME from DEPT where exists(select * from EMP where DEPTNO=10); --MAIN

--[3] ���� �÷� SUB-QUERY
--	    -> SUB-QUERY�� �������� �������� '�÷��� ��'
--	       (AND �������� ��)�� ������ �ִ� ���� 
--'�μ���ȣ'�� 30�� ����� SAL�� COMM�� ���� ������� '�̸�'�� '�μ���ȣ' ���! 
select SAL, COMM from EMP where DEPTNO=30; -- Sub> 
select ENAME, DEPTNO from EMP where (SAL, COMM) in (select SAL, COMM from EMP where DEPTNO=30); --4�� --MAIN
select ENAME, DEPTNO from EMP where (SAL, nvl(COMM, 0)) in (select SAL, nvl(COMM, 0) from EMP where DEPTNO=30); --6�� --MAIN ��.
--null�� 0���� �����ؼ� +2

--[4] ��ȣ ���� SUB-QUERY
--	    -> MAIN-QUERY���� ���� ���̺��� SUB-QUERY���� �ٽ�
--	       ����Ǵ� ����� �������� 
 select avg(e1.SAL) from EMP e1, EMP e2 where e1.DEPTNO=e2.DEPTNO; --����O --SUB
-- select avg(e1.SAL) from EMP e1 where e1.DEPTNO=e2.DEPTNO; --����X --SUB-Err 
select e1.EMPNO, e1.SAL from EMP e1 where SAL>(select avg(SAL) from EMP e2 where e1.DEPTNO=e2.DEPTNO); --MAIN

        --cf) ��������
        -- �����ȣ�� 7900�� �����ȣ�� �μ��̸��� ����϶�           
select e.EMPNO, d.DNAME from EMP e, DEPT d where e.DEPTNO=d.DEPTNO and e.EMPNO=7900;  -- by ���� 
select DNAME from DEPT where DEPTNO=(select DEPTNO from EMP where EMPNO=7900); -- by �������� 

-- ��ձ޿����� ���� �޴� ����� �̸��� �޿� ���!  // where ->�׷��Լ� X max ��
select ENAME, SAL from EMP where SAL>avg(SAL); -- Err
select avg(SAL) from EMP; --Sub
--select ENAME, SAL from EMP where SAL>? --Main
select ENAME, SAL from EMP where SAL>(select avg(SAL) from EMP); --SQL

--1) �μ���ȣ�� 10���� ��� ��ձ޿� ���� �޿��� ���� ����� �̸��� �޿�( ��, �޿��� ���� ������ ���� )
select avg(SAL) from EMP where DEPTNO=10; --sub ������ avg�ϱ�.
--	Main> select ENAME, SAL from EMP where SAL<?;
select ENAME, SAL from EMP where SAL<(select avg(SAL) from EMP where DEPTNO=10) order by SAL desc;

--2) �μ���ȣ�� 10���� ��� ��ձ޿� ���� �޿��� ���� ������� �μ��� ��� �޿� ( �� 10���μ��� ������ ��, �μ���ȣ ������, �޿��� �ݿø��� �� )
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
          
          
             -- �̼�( �л����ǰ���/SQL )
	      -- ����1+����2 �� �����Ȱ� ���� �� ��!
	      -- ����3 Ǯ�� 