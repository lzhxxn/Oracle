-- �帣 
insert into JANGR values(10, '�׼�');
insert into JANGR values(20, 'ȣ��');
insert into JANGR values(30, '���');

-- ��� 
insert into GRADE values(10, '����');
insert into GRADE values(12, '12��');
insert into GRADE values(15, '15��');
insert into GRADE values(18, '18��');
insert into GRADE values(20, '����');

-- ��ȭ 
insert into MOVIE values('m0001','Ʈ����', 'Warner Bros', 'USA', '������������', '�귡����Ʈ', '2004-05-21', 10, 15);
insert into MOVIE values('m0002', '���� ũ�ο�', 'Dream Works', 'USA', '���Ͽ���', '����ũ�ο�', '2002-02-22', 10, 18);
insert into MOVIE values('m0003', '�͹̳�����', 'Warner Bros', 'USA', '���ӽ�ī�޷�', '�Ƴ��', '1984-12-22', 10, 12);
insert into MOVIE values('m0004', 'Ÿ��Ÿ��', 'Warner Bros', 'USA', '���ӽ�ī�޷�', '��ī������,', '1998-02-20', 30, 12);

-- ������
insert into CHAINSTORE values('c01', '��������', '������', '01012341234', '12345', '����� ����', '2019-05-27');
insert into CHAINSTORE values('c02', 'ȫ������', '�質��', '01012344321', '54321', '����� ȫ���Ա�', '2019-05-28');

-- ����
insert into VIDEO values('v0001', 'c01', '2013-02-22', '15000', '0', 'm0001');
insert into VIDEO values('v0002', 'c02', '2005-05-18', '13000', '1', 'm0001');
insert into VIDEO values('v0003', 'c01', '2005-07-12', '11000', '0', 'm0003');
insert into VIDEO values('v0004', 'c02', '2006-05-28', '17000', '1', 'm0004');

-- ȸ�� 
insert into MEMBER values('tiger@naver.com', 'c01', '������', '01023454567', '12345', '����� ������', SYSDATE, 1000);
insert into MEMBER values('tiger@naver.com', 'c02', '������', '01023454568', '12346', '����� ��������', SYSDATE, 2000);
insert into MEMBER values('lion@naver.com', 'c01', '������',  '01023454569', '41234', '��⵵ ������', SYSDATE, 3000);
insert into MEMBER values('rabbit@naver.com', 'c02', '����','01023454560', '71234', '���ֵ� ��������', SYSDATE, 5000);
insert into MEMBER values('dog@naver.com', 'c02', '������',   '01023454561', '91234', '������ ���� �л굿', SYSDATE, 4000);

-- �뿩 
insert into RENT values(RENT_SEQ.nextval,  '2006-01-01', 1000, '2006-01-03', '0', 'v0001', 'c01', 'tiger@naver.com');
insert into RENT values(RENT_SEQ.nextval,  '2006-02-01', 2000, '2006-02-03', '1', 'v0002', 'c02', 'tiger@naver.com');
insert into RENT values(RENT_SEQ.nextval,  '2006-04-01', 4000, '2006-04-03', '1', 'v0002', 'c02', 'rabbit@naver.com');
insert into RENT values(RENT_SEQ.nextval,  '2006-03-01', 3000, '2006-03-03', '0', 'v0003', 'c01', 'lion@naver.com');
insert into RENT values(RENT_SEQ.nextval,  '2006-05-01', 5000, '2006-05-03', '0', 'v0004', 'c02', 'dog@naver.com');

-- ��ü�� 
insert into LATEFEE values(2, 500, '2006-01-05');
insert into LATEFEE values(3, 700, '2006-02-07');

-- ����� 
insert into AMOUNT values('2016-01-05', 220000, 100);
insert into AMOUNT values('2016-01-06', 350000, 150);

-- �뿩�ݾ� 
insert into RENTAMOUNT values('0', 100, 1000, '�α⵵ ����');
insert into RENTAMOUNT values('1', 200, 2000, '�α⵵ ��');
insert into RENTAMOUNT values('2', 300, 3000, '�α⵵ ��');
insert into RENTAMOUNT values('3', 400, 4000, '�α⵵ ��');
insert into RENTAMOUNT values('4', 500, 5000, '�α⵵ �ֻ�');

commit;

-- Ȯ�� 
select * from JANGR;
select * from GRADE;
select count(*) from MOVIE;
select * from CHAINSTORE;
select * from VIDEO;
select M_EMAIL, C_CODE, M_JOINDATE from MEMBER;
select * from RENT;
select * from LATEFEE;
select * from AMOUNT;
select * from RENTAMOUNT;

