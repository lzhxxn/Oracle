--(1) EMP Table���� �̸�, �޿�, Ŀ�̼� �ݾ�, �Ѿ�(sal+comm)�� ���Ͽ� �Ѿ��� 
--    ���� ������ ����϶�. ��, Ŀ�̼��� NULL�� ����� �����Ѵ�. 
select ENAME, SAL, COMM "Ŀ�̼� �ݾ�", SAL+NVL(COMM, 0) from EMP where COMM is not null order by 4 desc;

--(2) 10�� �μ��� ��� ����鿡�� �޿��� 13%�� ���ʽ��� �����ϱ�� �Ͽ���.
--    �̸�, �޿�, ���ʽ� �ݾ�, �μ� ��ȣ�� ����϶�.
select ENAME, SAL, SAL*0.13 "���ʽ� �ݾ�", DEPTNO from EMP where DEPTNO=10;

--(*3) 30�� �μ��� ������ ����Ͽ� �̸�, �μ���ȣ, �޿�, ������ ����϶�.
--    ��, ������ �޿��� 150%�� ���ʽ��� �����Ѵ�. 
select ENAME, DEPTNO, SAL, SAL*12+SAL*1.5 from EMP where DEPTNO=30;

--(***4) �μ� ��ȣ�� 20�� �μ��� �ð��� �ӱ��� ����Ͽ� ����϶�.
--    ��, 1���� �ٹ��ϼ��� 12���̰�, 1�� �ٹ��ð��� 5�ð��̴�.
--    ��¾���� �̸�, �޿�, �ð��� �ӱ�(�Ҽ����� 1��° �ڸ����� �ݿø�)
--    �� ����϶�. 
select ENAME, SAL, ROUND((SAL/12)/5, 1) "�ð��� �ӱ�" from EMP where DEPTNO=20;

--(5)�޿��� $1,500 ���� $3,000 ������ ����� �޿��� 15%�� ȸ��� �����ϱ�� �Ͽ���.
--    �̸� �̸�, �޿�, ȸ��(-2�ڸ����� �ݿø�)�� ����϶�.
select ENAME, SAL, ROUND(SAL*0.15,2)"ȸ��" from EMP where SAL between 1500 and 3000;
select ENAME, SAL, ROUND(SAL*0.15,2)"ȸ��" from EMP where SAL>=1500 and SAL<=3000;

--(6) �޿��� $2,000 �̻��� ��� ����� �޿��� 15%�� ������� ����� �Ͽ���. 
--    �̸�, �޿�, ������(�Ҽ��� ���� ����)�� ����϶�.
select ENAME, SAL, TRUNC(SAL*0.15)"������" from EMP where SAL>=2000;

--(7)  �Ի��Ϻ��� ���ݱ����� ��¥���� ����϶�.
--    �μ� ��ȣ, �̸�, �Ի���, ������, �ٹ��ϼ�(�Ҽ��� ���� ����), 
--	�ٹ����(�ݿø�),�ٹ�����(30�� ����,�ݿø�), �ٹ��ּ�(�ݿø�)�� ����϶�.
select DEPTNO, ENAME, HIREDATE, SYSDATE, TRUNC(SYSDATE-HIREDATE) "�ٹ��ϼ�", ROUND(MONTHS_BETWEEN(SYSDATE,HIREDATE)/12,0) "�ٹ����",
ROUND(MONTHS_BETWEEN(SYSDATE,HIREDATE)) "�ٹ�����", ROUND(MONTHS_BETWEEN(SYSDATE,HIREDATE)/7,0) "�ٹ��ּ�" from EMP;

--(8) ��� ����� �Ǽ��ɾ��� ����Ͽ� ����϶�.
--    ��, �޿��� ���� ������ �̸�, �޿�, �Ǽ��ɾ��� ����϶�
--    (�Ǽ��ɾ��� �޿��� ���� 10%�� ������ �� �ݾ�)
select ENAME, SAL, SAL-(SAL*0.1) "�Ǽ��ɾ�" from EMP order by 2 desc;
select ENAME, SAL, SAL*0.9 "�Ǽ��ɾ�" from EMP order by 2 desc;

--(9) �Ի��Ϸκ��� 90���� ���� ���� ��� �̸�, �Ի���, 90�� ���� ��, �޿��� ����϶�.
select ENAME, HIREDATE, (HIREDATE+90) "90�� ���� ��", SAL from EMP; 

--(10) �Ի��Ϸκ��� 6������ ���� ���� �Ի���, 6���� ���� ��¥, �޿��� ����϶�
select hiredate,  ADD_MONTHS(HIREDATE, 6) "6���� ��", sal FROM emp;

--(11) �Ի��� ���� �ٹ��ϼ��� ����Ͽ� �μ���ȣ, �̸�, �Ի���, �ٹ��ϼ��� ����϶�.
select DEPTNO, ENAME, HIREDATE, TRUNC(SYSDATE-HIREDATE)"�ٹ��ϼ�" from EMP;

--(*12) ��� ����� 60���� ���� ���� 'MONDAY'�� �� ��, �� ��, �� �� �ΰ��� ���Ͽ� �̸�, �Ի���, 'MONDAY'�� ����϶�.
select ENAME, hiredate, to_char(hiredate+60, 'monday') from emp;

--(13) �Ի��Ϸκ��� ���ñ����� �ϼ��� ���Ͽ� �̸�, �Ի���, �ٹ��ϼ�(�ݿø�)�� ����϶�.
select ename, hiredate, round((sysdate-hiredate+1),0) "�ٹ��ϼ�" from EMP;

--(***?14) �Ի����� '1996�� 5�� 14��'�� ���·� �̸�, �Ի����� ����϶�.
SELECT ename, TO_CHAR(hiredate,'YYYY"��"  MM"��" DD"��"') "�Ի���" FROM emp;

--(*15)�̸��� ���ڼ��� 6�� �̻��� ����� �̸��� �տ��� 3�ڸ� ���Ͽ� �ҹ��ڷ� �̸����� ����϶�.
select ENAME from EMP where substr(ENAME,2,1)='A';
SELECT SUBSTR(lower(ename),0,3) FROM emp WHERE length(ename)>=6;

--(16) 10�� �μ� ������ ���, �ְ�, ����, �ο����� ���Ͽ� ����϶�.
select TRUNC(avg(sal))"���", max(sal)"�ְ�", min(sal)"����", count(empno)"�ο���" from emp where deptno=10;

--(17) �� �μ��� �޿��� ���, �ְ�, ����, �ο����� ���Ͽ� ����϶�. (�μ���ȣ�� ���)
select deptno, TRUNC(avg(sal))"���", max(sal)"�ְ�", min(sal)"����", count(empno)"�ο���" from emp group by deptno;

--(18) �� �μ��� ���� ������ �ϴ� ����� �ο����� ���Ͽ� �μ���ȣ, ������, �ο����� ����϶�.
select deptno,  job, count(empno) "�ο���" from EMP group by deptno, job order by deptno;

--(19) ���� ������ �ϴ� ����� ���� 4�� �̻��� ������ �ο����� ����϶�.
select deptno,  job, count(empno) "�ο���" from EMP  group by deptno, job having count(empno)>=4;

--(20) �� �μ��� ��� ����, ��ü ����, �ְ� ����, ���� ������ ���Ͽ� ��� ������  ���� ������ ����϶�. (�μ���ȣ�� ���)
select deptno, TRUNC(AVG(sal))"��տ���", SUM(sal)"��ü����", MAX(sal)"�ְ����", MIN(sal)"��������"
from EMP group by deptno order by TRUNC(AVG(sal)) desc;