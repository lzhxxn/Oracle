--6. TCL( Transaction Control Language )
--   (1) ���� 
--      DML(insert, update, delete)���� ����Ǿ� DBMS�� '����'�ǰų�, 
--      '�ǵ�����' ���ؼ� �����ؾ� �ϴ� SQL�� 

--   (2) Transaction 
--     1) ���� 
--        �и��Ǽ��� �ȵ� (����)'�۾� ����' 
--     
--     2) ���� 
--        <1> DBMS�� ó�� �������� �� 
--	<2> �ϳ� or �������� DML���� ������ �� commit �Ǵ� 
--	    rollback �� ������ ����

  --   3) �� 
    --    <1> commit �Ǵ� rollback ����Ǵ� ���� 
--          Transaction �ٸ����ǿ��� Ȯ�� �� �� ����. �޸𸮸�����.

--	         ����) rollback to a; 
--	  
--	<2> DDL �̳� DCL ���� ����Ǵ� ����
insert into DEPT2 values(1, 'a', 'b');   --DML 
update DEPT2 set DNAME='A' where DEPTNO=1;  --DML 
select * from DEPT2;
create table AA(no number); --DDL 
select * from DEPT2;

--	<3> DB�� (����/������) ����� ��
delete from DEPT2 where DEPTNO=1;
--���� ����� X��ư Ŭ���ؼ� �������� -- ���������� 
select * from DEPT2; -- commit ���� ������ Ȯ��

delete from DEPT2 where DEPTNO=1;
--exit; �Ǵ� quit; --��������  
select * from DEPT2; -- commit �Ǿ����� Ȯ�� 

--            ����1> DML �۾��� 
insert into DEPT2 values(1, '��', '��');
--            ����2> DBMS ���� 
--shutdown immediate; --DB���� ���� 
--startup; --DB���� ���� 
--SQL> select * from DEPT2; -- commit ���� ����( rollback )
	       
--	<4> �۾����� Connection(����)�� ���� ��
insert into DEPT2 values(1, '��', '��');

