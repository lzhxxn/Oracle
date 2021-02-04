-- 장르 
create table JANGR(
   J_CODE NUMBER(2),  --장르코드(PK)
   J_NAME VARCHAR2(30) constraint JANGR_NN not null --장르명 
);
alter table JANGR add constraint JANGR_PK primary key(J_CODE);
-- 등급 
create table GRADE(
   G_CODE NUMBER(2), -- 등급코드(PK) 
   G_NAME VARCHAR2(20) constraint GRADE_NN not null -- 등급명 	
);
alter table GRADE add constraint GRADE_PK primary key(G_CODE);
-- 영화 
create table MOVIE(
   MV_CODE  CHAR(5),           -- 영화코드(PK)
   MV_SUBJECT VARCHAR2(50) constraint MOVIE_NN not null, -- 영화제목
   MV_PRODUCTION VARCHAR2(30), -- 제작사 
   MV_NATIONAL VARCHAR2(20),   -- 제작국가
   MV_BOSS VARCHAR2(30),       -- 감독
   MV_ACTOR VARCHAR2(30),      -- 주연배우 
   MV_OPENDATE DATE,           -- 개봉일자
   J_CODE NUMBER(2),           -- 장르코드(FK)
   G_CODE NUMBER(2)            -- 등급코드(FK)
);
alter table MOVIE add constraint MOVIE_PK primary key(MV_CODE);
alter table MOVIE add constraint MOVIE_JANGR_FK foreign key(J_CODE) references JANGR on delete cascade;
alter table MOVIE add constraint MOVIE_GRADE_FK foreign key(G_CODE) references GRADE on delete cascade;
-- 가맹점
create table CHAINSTORE(
   C_CODE CHAR(3),            -- 가맹점코드(PK)
   C_NAME VARCHAR2(30),       -- 가맹점이름
   C_BOSS VARCHAR2(30) constraint CHAINSTORE_NN not null, -- 대표자명  
   C_PHONE VARCHAR2(13),      -- 폰번호
   C_POST CHAR(5),            -- 우편번호
   C_ADDR VARCHAR2(70),       -- 주소
   C_OPENDATE DATE            -- 개업일자
);
alter table CHAINSTORE add constraint CHAINSTORE_PK primary key(C_CODE);
-- 비디오
create table VIDEO(
   V_CODE CHAR(5),            -- 비디오코드(PK) 
   C_CODE CHAR(3),            -- 가맹점코드(PK, FK)
   V_BUYDATE DATE,            -- 구입일 
   V_BUYAMOUNT NUMBER,        -- 구입금액
   V_CONDITION CHAR(1),       -- 비디오상태
   MV_CODE CHAR(5)            -- 영화코드(FK)
);
alter table VIDEO add constraint VIDEO_PK primary key(V_CODE, C_CODE);
alter table VIDEO add constraint VIDEO_CHAINSTORE_FK foreign key(C_CODE) references CHAINSTORE on delete cascade;
alter table VIDEO add constraint VIDEO_MOVIE_FK foreign key(MV_CODE) references MOVIE on delete cascade;
-- 회원 
create table MEMBER(
   M_EMAIL VARCHAR2(50),       -- 회원이메일(PK)  
   C_CODE CHAR(3),             -- 가맹점코드(PK,FK)
   M_NAME VARCHAR2(30),        -- 회원이름
   M_PHONE VARCHAR2(13) constraint MEMBER_NN not null, -- 폰번호
   M_POST CHAR(5),             -- 우편번호
   M_ADDR VARCHAR2(70),        -- 주소 
   M_JOINDATE DATE default SYSDATE, -- 회원가입일
   M_POINT NUMBER              -- 포인트
);
alter table MEMBER add constraint MEMBER_PK primary key(M_EMAIL, C_CODE);
alter table MEMBER add constraint MEMBER_CHAINSTORE_FK foreign key(C_CODE) references CHAINSTORE;

-- 대여 
create table RENT(
   R_SEQ NUMBER,               -- 대여일련번호(PK)
   R_DATE DATE,                -- 대여일자
   R_AMOUNT NUMBER,            -- 대여금액
   R_RETURNDATE DATE,          -- 반납일자
   R_DIVISION CHAR(1),         -- 대여구분 [미반납:0, 반납완료:1]
   V_CODE CHAR(5),             -- 비디오코드(FK)
   C_CODE CHAR(3),             -- 가맹점코드(FK)
   M_EMAIL VARCHAR2(50)        -- 회원이메일(FK)
);
alter table RENT add constraint RENT_PK primary key(R_SEQ);
alter table RENT add constraint RENT_VIDEO_FK foreign key(V_CODE,C_CODE) references VIDEO(V_CODE,C_CODE);   
alter table RENT add constraint RENT_MEMBER_FK foreign key(M_EMAIL,C_CODE) references MEMBER(M_EMAIL,C_CODE);   
-- 연체료 
create table LATEFEE(
    R_SEQ NUMBER,             -- 대여일련번호(PK, FK)
    L_FEE NUMBER,             -- 연체료
    L_INPUTDATE DATE          -- 입금일자
);
alter table LATEFEE add constraint LATEFEE_PK primary key(R_SEQ);
alter table LATEFEE add constraint LATEFEE_FK foreign key(R_SEQ) references RENT;
-- 매출액 
create table AMOUNT(
    A_RENTDATE DATE,          -- 대여일자(PK) 
    A_ONEDAYAMOUNT NUMBER,    -- 일일매출액
    A_ONEDAYCOUNT NUMBER      -- 일일대여횟수
);
alter table AMOUNT add constraint AMOUNT_PK primary key(A_RENTDATE);
-- 대여금액 
create table RENTAMOUNT( 
    RA_V_DIVISTION CHAR(1),   -- 비디오구분(PK) [인기도 최하:0, 하:1, 중:2, 상:3, 최상:4]
    RA_DAYLATEFEE NUMBER,     -- 일일연체금액
    RA_AMOUNT NUMBER,         -- 대여금액
    RA_DESCRIPTION VARCHAR2(50) -- 설명
);
alter table RENTAMOUNT add constraint RENTAMOUNT_PK primary key(RA_V_DIVISTION);
-- 대여 시퀀스 
create sequence RENT_SEQ increment by 1 start with 1 nocache;

-- 확인 
select TNAME from TAB;
select SEQUENCE_NAME from SEQ;
select CONSTRAINT_NAME, CONSTRAINT_TYPE from user_constraints order by CONSTRAINT_NAME;