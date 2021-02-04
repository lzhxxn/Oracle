--6. TCL( Transaction Control Language )
--   (1) 설명 
--      DML(insert, update, delete)문이 실행되어 DBMS에 '저장'되거나, 
--      '되돌리기' 위해서 실행해야 하는 SQL문 

--   (2) Transaction 
--     1) 정의 
--        분리되서는 안될 (논리적)'작업 단위' 
--     
--     2) 시작 
--        <1> DBMS에 처음 접속했을 때 
--	<2> 하나 or 여러개의 DML문을 실행한 후 commit 또는 
--	    rollback 을 수행한 직후

  --   3) 끝 
    --    <1> commit 또는 rollback 실행되는 순간 
--          Transaction 다른세션에서 확인 할 수 없다. 메모리만저장.

--	         예외) rollback to a; 
--	  
--	<2> DDL 이나 DCL 문이 실행되는 순간
insert into DEPT2 values(1, 'a', 'b');   --DML 
update DEPT2 set DNAME='A' where DEPTNO=1;  --DML 
select * from DEPT2;
create table AA(no number); --DDL 
select * from DEPT2;

--	<3> DB가 (정상/비정상) 종료될 때
delete from DEPT2 where DEPTNO=1;
--왼쪽 상단의 X버튼 클릭해서 세션종료 -- 비정상종료 
select * from DEPT2; -- commit 되지 않음을 확인

delete from DEPT2 where DEPTNO=1;
--exit; 또는 quit; --정상종료  
select * from DEPT2; -- commit 되었음을 확인 

--            세션1> DML 작업중 
insert into DEPT2 values(1, '가', '나');
--            세션2> DBMS 종료 
--shutdown immediate; --DB서비스 종료 
--startup; --DB서비스 시작 
--SQL> select * from DEPT2; -- commit 되지 않음( rollback )
	       
--	<4> 작업중인 Connection(세션)을 끊을 때
insert into DEPT2 values(1, '가', '나');

