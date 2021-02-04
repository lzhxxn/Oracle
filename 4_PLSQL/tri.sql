drop table EMP_TRI;

create table EMP_TRI(
    EMPNO number(4) primary key, 
    ENAME varchar2(10), 
    SAL number(7,2)
);

create or replace trigger TRI_SAL
after 
   insert on EMP_TRI
begin
   update EMP_TRI set SAL=2000;
end;
/
