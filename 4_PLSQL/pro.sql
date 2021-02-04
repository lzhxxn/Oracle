create or replace procedure INCRE(N in EMP2.EMPNO%TYPE, R in NUMBER)
is 
   newPay NUMBER;
begin
   select SAL into newPay from EMP2 where EMPNO=N;
   newPay := newPay + newPay * R;
   update EMP2 set SAL=newPay where EMPNO=N;
   commit;
end;
/

-- call incre(7369, 0.1);
-- select EMPNO, SAL from EMP2 where EMPNO=7369;