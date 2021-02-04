-- �帣 
create table JANGR(
   J_CODE NUMBER(2),  --�帣�ڵ�(PK)
   J_NAME VARCHAR2(30) constraint JANGR_NN not null --�帣�� 
);
alter table JANGR add constraint JANGR_PK primary key(J_CODE);
-- ��� 
create table GRADE(
   G_CODE NUMBER(2), -- ����ڵ�(PK) 
   G_NAME VARCHAR2(20) constraint GRADE_NN not null -- ��޸� 	
);
alter table GRADE add constraint GRADE_PK primary key(G_CODE);
-- ��ȭ 
create table MOVIE(
   MV_CODE  CHAR(5),           -- ��ȭ�ڵ�(PK)
   MV_SUBJECT VARCHAR2(50) constraint MOVIE_NN not null, -- ��ȭ����
   MV_PRODUCTION VARCHAR2(30), -- ���ۻ� 
   MV_NATIONAL VARCHAR2(20),   -- ���۱���
   MV_BOSS VARCHAR2(30),       -- ����
   MV_ACTOR VARCHAR2(30),      -- �ֿ���� 
   MV_OPENDATE DATE,           -- ��������
   J_CODE NUMBER(2),           -- �帣�ڵ�(FK)
   G_CODE NUMBER(2)            -- ����ڵ�(FK)
);
alter table MOVIE add constraint MOVIE_PK primary key(MV_CODE);
alter table MOVIE add constraint MOVIE_JANGR_FK foreign key(J_CODE) references JANGR on delete cascade;
alter table MOVIE add constraint MOVIE_GRADE_FK foreign key(G_CODE) references GRADE on delete cascade;
-- ������
create table CHAINSTORE(
   C_CODE CHAR(3),            -- �������ڵ�(PK)
   C_NAME VARCHAR2(30),       -- �������̸�
   C_BOSS VARCHAR2(30) constraint CHAINSTORE_NN not null, -- ��ǥ�ڸ�  
   C_PHONE VARCHAR2(13),      -- ����ȣ
   C_POST CHAR(5),            -- �����ȣ
   C_ADDR VARCHAR2(70),       -- �ּ�
   C_OPENDATE DATE            -- ��������
);
alter table CHAINSTORE add constraint CHAINSTORE_PK primary key(C_CODE);
-- ����
create table VIDEO(
   V_CODE CHAR(5),            -- �����ڵ�(PK) 
   C_CODE CHAR(3),            -- �������ڵ�(PK, FK)
   V_BUYDATE DATE,            -- ������ 
   V_BUYAMOUNT NUMBER,        -- ���Աݾ�
   V_CONDITION CHAR(1),       -- ��������
   MV_CODE CHAR(5)            -- ��ȭ�ڵ�(FK)
);
alter table VIDEO add constraint VIDEO_PK primary key(V_CODE, C_CODE);
alter table VIDEO add constraint VIDEO_CHAINSTORE_FK foreign key(C_CODE) references CHAINSTORE on delete cascade;
alter table VIDEO add constraint VIDEO_MOVIE_FK foreign key(MV_CODE) references MOVIE on delete cascade;
-- ȸ�� 
create table MEMBER(
   M_EMAIL VARCHAR2(50),       -- ȸ���̸���(PK)  
   C_CODE CHAR(3),             -- �������ڵ�(PK,FK)
   M_NAME VARCHAR2(30),        -- ȸ���̸�
   M_PHONE VARCHAR2(13) constraint MEMBER_NN not null, -- ����ȣ
   M_POST CHAR(5),             -- �����ȣ
   M_ADDR VARCHAR2(70),        -- �ּ� 
   M_JOINDATE DATE default SYSDATE, -- ȸ��������
   M_POINT NUMBER              -- ����Ʈ
);
alter table MEMBER add constraint MEMBER_PK primary key(M_EMAIL, C_CODE);
alter table MEMBER add constraint MEMBER_CHAINSTORE_FK foreign key(C_CODE) references CHAINSTORE;

-- �뿩 
create table RENT(
   R_SEQ NUMBER,               -- �뿩�Ϸù�ȣ(PK)
   R_DATE DATE,                -- �뿩����
   R_AMOUNT NUMBER,            -- �뿩�ݾ�
   R_RETURNDATE DATE,          -- �ݳ�����
   R_DIVISION CHAR(1),         -- �뿩���� [�̹ݳ�:0, �ݳ��Ϸ�:1]
   V_CODE CHAR(5),             -- �����ڵ�(FK)
   C_CODE CHAR(3),             -- �������ڵ�(FK)
   M_EMAIL VARCHAR2(50)        -- ȸ���̸���(FK)
);
alter table RENT add constraint RENT_PK primary key(R_SEQ);
alter table RENT add constraint RENT_VIDEO_FK foreign key(V_CODE,C_CODE) references VIDEO(V_CODE,C_CODE);   
alter table RENT add constraint RENT_MEMBER_FK foreign key(M_EMAIL,C_CODE) references MEMBER(M_EMAIL,C_CODE);   
-- ��ü�� 
create table LATEFEE(
    R_SEQ NUMBER,             -- �뿩�Ϸù�ȣ(PK, FK)
    L_FEE NUMBER,             -- ��ü��
    L_INPUTDATE DATE          -- �Ա�����
);
alter table LATEFEE add constraint LATEFEE_PK primary key(R_SEQ);
alter table LATEFEE add constraint LATEFEE_FK foreign key(R_SEQ) references RENT;
-- ����� 
create table AMOUNT(
    A_RENTDATE DATE,          -- �뿩����(PK) 
    A_ONEDAYAMOUNT NUMBER,    -- ���ϸ����
    A_ONEDAYCOUNT NUMBER      -- ���ϴ뿩Ƚ��
);
alter table AMOUNT add constraint AMOUNT_PK primary key(A_RENTDATE);
-- �뿩�ݾ� 
create table RENTAMOUNT( 
    RA_V_DIVISTION CHAR(1),   -- ��������(PK) [�α⵵ ����:0, ��:1, ��:2, ��:3, �ֻ�:4]
    RA_DAYLATEFEE NUMBER,     -- ���Ͽ�ü�ݾ�
    RA_AMOUNT NUMBER,         -- �뿩�ݾ�
    RA_DESCRIPTION VARCHAR2(50) -- ����
);
alter table RENTAMOUNT add constraint RENTAMOUNT_PK primary key(RA_V_DIVISTION);
-- �뿩 ������ 
create sequence RENT_SEQ increment by 1 start with 1 nocache;

-- Ȯ�� 
select TNAME from TAB;
select SEQUENCE_NAME from SEQ;
select CONSTRAINT_NAME, CONSTRAINT_TYPE from user_constraints order by CONSTRAINT_NAME;