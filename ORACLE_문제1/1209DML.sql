--5. DML ( Data Manipulation Language ) �޸�����
--   (1) ���� 
--       ���̺��� �����͸� '�Է�', '����', '����' �ϰ� �ϴ� SQL

drop table EMP2; -- �ڽ����̺� <-> Foreign-key(���� �ܷ�Ű)�� �ɾ��ش�.
drop table DEPT2; --�θ����̺� : ���� ���ǰ� �Ǿ���ϱ� ������
purge recyclebin;

create table DEPT2(
    DEPTNO NUMBER(2) co nstraint PK_DEPT2 primary key, --�������ǻ���
    DNAME VARCHAR2(14), 
    LOC VARCHAR2(13)
);

create table EMP2(
    EMPNO NUMBER(4) constraint PK_EMP2 primary key, 
    ENAME VARCHAR2(10), 
    JOB VARCHAR2(9),
    MGR NUMBER(4), 
    HIREDATE DATE, 
    SAL NUMBER(7,2), 
    COMM NUMBER(7,2), 
    DEPTNO NUMBER(2)
);
alter table EMP2 add constraint FK_DEPTNO2 foreign key(DEPTNO) references DEPT2(DEPTNO); --on delete cascade;

insert into DEPT2 select * from DEPT;
insert into EMP2 select * from EMP;
commit;

desc DEPT2
desc EMP2
select * from DEPT2;
select * from EMP2;
select CONSTRAINT_NAME, CONSTRAINT_TYPE from user_constraints where TABLE_NAME='DEPT2';
select CONSTRAINT_NAME, CONSTRAINT_TYPE from user_constraints where TABLE_NAME='EMP2';

insert into DEPT2 values(50, 'ȸ���', '����');
insert into EMP2 values(8000, '�ڼ���', '������', 7839, SYSDATE, 4000, null, 50); --���α׷��Ӵ� ����Ʈ���� �ʰ��ؼ� X
select * from EMP2 where EMPNO=8000;
insert into EMP2(EMPNO, ENAME) values(9000, '������'); -- ������ NULL / EMP2() ��ȣ�������� �ٽ�����Ѵ�.
select * from EMP2 where EMPNO=9000;
--Err) insert into EMP2(ENAME) values('������'); // NOT NULL EMPNO.
desc EMP2;
--Err) insert into EMP2(EMPNO, ENAME) values(9000, '������');  // 9000�� �����Ͱ� �̹��ֱ⶧���� Err
commit; 
select * from EMP2 where EMPNO>=8000; --// Ŀ�����ؾ��Ѵ�. ������ �޸𸮸� ����ȴ�. DML �Ǽ��ϱ� ����.
update EMP2 set ENAME='�̼Ҵ�', SAL=6000 where EMPNO=9000; --// where �Ƚ��ָ� ���� update �ȴ�.
select * from EMP2 where EMPNO=9000;
update EMP2 set ENAME='�̼Ҵ�', SAL=9999 where EMPNO=9000;
update EMP2 set EMPNO=9999 where EMPNO=9000; --PK�÷�����(O)
select * from EMP2 where EMPNO=9999;
--Err) update EMP2 set EMPNO=8000 where EMPNO=9999; --8000�̹�����
update EMP2 set DEPTNO=50 where EMPNO=9999; --����
--Err) update EMP2 set DEPTNO=70 where EMPNO=9999; --�Ұ��� ( 70���μ��� ����X )
select * from emp2;
commit;
delete from EMP2 where EMPNO=9999;
select * from DEPT2;
--Err) delete from DEPT2 where DEPTNO=50; -- on delete cascade; �ɼǿ����� ���� 
select * from DEPT2;
rollback;
--Err) delete from DEPT2 where DEPTNO=20; --�Ұ�:  �ٶ󺸴� �ڽ� �����Ͱ� �����ϱ� ������ ������ X
select EMPNO, DEPTNO from EMP; -- 40�������� Ȯ��
delete from DEPT2 where DEPTNO=40; 