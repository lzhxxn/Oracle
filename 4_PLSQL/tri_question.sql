drop table TR_MYHOME;
drop table TR_LOGIN;
drop table TR_MEMBER;
drop sequence MYHOME_SQ;

create table TR_MEMBER(
	ID varchar2(10) constraint MEMBER_ID_PK primary key, 
	PWD varchar2(10) constraint MEMBER_PWD_NN not null, 
	NAME varchar2(10) constraint MEMBER_NN not null, 
	EMAIL varchar2(20), 
	IDATE date
    );
create table TR_LOGIN(
       ID varchar2(10), 
       PWD varchar2(10), 
       constraint LOGIN_ID_PK primary key(ID), 
       constraint LOGIN_ID_FK foreign key(ID) references TR_MEMBER(ID) on delete cascade 
    );
create table TR_MYHOME(
	SEQ number constraint MYHOME_SEQ_PK primary key, 
	ID varchar2(10) constraint MYHOME_ID_NN not null, 
	NAME varchar2(20) constraint MYHOME_NAME_NN not null, 
	TOTCOUNT number default 0, 
	HMSG varchar2(15), 
	CDATE date, 
	constraint MYHOME_ID_FK foreign key(ID) references TR_MEMBER(ID) on delete cascade 
    );
create sequence MYHOME_SQ start with 1 increment by 1 nocache;
select MYHOME_SQ.NEXTVAL from DUAL;

--select * from tab;
--select * from seq;

--Q1) trigger1: 회원가입시..'로긴 테이블'에 ID/PWD입력, 
             --'홈페이지테이블'에 시퀀스와 ID/NAME입력되는 트리거

--Q2) trigger2: 회원비번수정시.. 로긴 테이블의 PWD수정되는 트리거 