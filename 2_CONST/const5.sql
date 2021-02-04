-- 0) 테이블+제약조건 삭제 
drop table CONST_EMP;
drop table CONST_DEPT;
purge recyclebin;

-- 1) 제약조건 생성  
create table CONST_DEPT(
   DEPTNO number(2), 
   DNAME varchar2(14) default '개발부', 
   LOC char(1)  
);
alter table CONST_DEPT add constraint CONST_DEPT_PK primary key(DEPTNO);
alter table CONST_DEPT add constraint CONST_DEPT_CK check(LOC in('1','2'));

create table CONST_EMP(
   NO number(4), 
   NAME varchar2(10) constraint CONST_EMP_NNN not null, 
   ADDR varchar2(6),
   JUMIN char(13) constraint CONST_EMP_JNN not null, 
   RDATE date default SYSDATE, 
   DEPTNO number(2)
);
alter table CONST_EMP add constraint CONST_EMP_PK primary key(NO); 
alter table CONST_EMP add constraint CONST_EMP_CK check(ADDR in('서울','부산'));
alter table CONST_EMP add constraint CONST_EMP_UQ unique(JUMIN);
alter table CONST_EMP add constraint CONST_EMP_FK foreign key(DEPTNO) references CONST_DEPT(DEPTNO);

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


