drop table EMP3;
drop table DEPT3;
purge recyclebin;

create table DEPT3 as select * from DEPT;
create table EMP3 as select * from EMP;
--select * from DEPT3;
--select * from EMP3;

alter table DEPT3 add constraint DEPT3_PK primary key(DEPTNO);
alter table EMP3 add constraint EMP3_PK primary key(EMPNO);
alter table EMP3 add constraint EMP3_FK foreign key(DEPTNO) references DEPT3(DEPTNO);

-- »Æ¿Œ 
desc DEPT3;
desc EMP3;
select CONSTRAINT_NAME, CONSTRAINT_TYPE from user_constraints where TABLE_NAME='DEPT3';
select CONSTRAINT_NAME, CONSTRAINT_TYPE from user_constraints where TABLE_NAME='EMP3';

