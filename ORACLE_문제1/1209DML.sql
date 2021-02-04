--5. DML ( Data Manipulation Language ) 메모리저장
--   (1) 설명 
--       테이블내의 데이터를 '입력', '수정', '삭제' 하게 하는 SQL

drop table EMP2; -- 자식테이블 <-> Foreign-key(참조 외래키)에 걸어준다.
drop table DEPT2; --부모테이블 : 먼저 정의가 되어야하기 때문에
purge recyclebin;

create table DEPT2(
    DEPTNO NUMBER(2) co nstraint PK_DEPT2 primary key, --제약조건생성
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

insert into DEPT2 values(50, '회계부', '서울');
insert into EMP2 values(8000, '박서하', '개발자', 7839, SYSDATE, 4000, null, 50); --프로그래머는 바이트수가 초과해서 X
select * from EMP2 where EMPNO=8000;
insert into EMP2(EMPNO, ENAME) values(9000, '허유민'); -- 나머지 NULL / EMP2() 괄호가없으면 다써줘야한다.
select * from EMP2 where EMPNO=9000;
--Err) insert into EMP2(ENAME) values('허유민'); // NOT NULL EMPNO.
desc EMP2;
--Err) insert into EMP2(EMPNO, ENAME) values(9000, '성진희');  // 9000번 데이터가 이미있기때문에 Err
commit; 
select * from EMP2 where EMPNO>=8000; --// 커밋을해야한다. 그전엔 메모리만 저장된다. DML 실수하기 쉽다.
update EMP2 set ENAME='이소담', SAL=6000 where EMPNO=9000; --// where 안써주면 전부 update 된다.
select * from EMP2 where EMPNO=9000;
update EMP2 set ENAME='이소담', SAL=9999 where EMPNO=9000;
update EMP2 set EMPNO=9999 where EMPNO=9000; --PK컬럼변경(O)
select * from EMP2 where EMPNO=9999;
--Err) update EMP2 set EMPNO=8000 where EMPNO=9999; --8000이미존재
update EMP2 set DEPTNO=50 where EMPNO=9999; --가능
--Err) update EMP2 set DEPTNO=70 where EMPNO=9999; --불가능 ( 70번부서는 존재X )
select * from emp2;
commit;
delete from EMP2 where EMPNO=9999;
select * from DEPT2;
--Err) delete from DEPT2 where DEPTNO=50; -- on delete cascade; 옵션에서만 가능 
select * from DEPT2;
rollback;
--Err) delete from DEPT2 where DEPTNO=20; --불가:  바라보는 자식 데이터가 존재하기 때문에 삭제가 X
select EMPNO, DEPTNO from EMP; -- 40번없는지 확인
delete from DEPT2 where DEPTNO=40; 