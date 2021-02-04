-- 0) 테이블+제약조건 삭제 
drop table CONST_EMP;
drop table CONST_DEPT;
purge recyclebin;

-- 1) 제약조건 생성  
create table CONST_DEPT(
   DEPTNO number(2) primary key, 
   DNAME varchar2(14) default '개발부', 
   LOC char(1) check(LOC in('1','2'))  
);
create table CONST_EMP(
   NO number(4) primary key, 
   NAME varchar2(10) not null, 
   ADDR varchar2(6) check(ADDR in('서울','부산')),
   JUMIN char(13) unique not null, 
   RDATE date default SYSDATE, 
   DEPTNO number(2) references CONST_DEPT(DEPTNO)   
);

-- 2) 제약조건 확인  
insert into CONST_DEPT(DEPTNO, LOC) values(10, '1');
insert into CONST_EMP(NO, NAME, ADDR, JUMIN, DEPTNO) 
values(1000, '홍길동', '서울', '1234561234567', 10);

insert into CONST_EMP 
values(2000, '이순신', '부산', '1234561234568', SYSDATE, 10);
commit;


-- 3) 결과 확인 
select CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME from user_constraints 
where TABLE_NAME='CONST_DEPT';
select CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME from user_constraints 
where TABLE_NAME='CONST_EMP';
select * from CONST_DEPT;
select * from CONST_EMP;


