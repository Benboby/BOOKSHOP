create proc tovip
@customer_id varchar(20)
as
declare @role int ,@number int
set @number=(select count(customer_id) from customer where customer_id=@customer_id)
if @number=0
   begin
   print '�����ڸù˿�'
   return
   end
else
begin
     set @role=(select customer_role from customer where customer_id=@customer_id) 
	     if @role=1
	     begin
	     print'�����ǻ�Ա�������ΰ쿨'
	     end
	 else
	  begin
	  declare @nums int 
	  set @nums=(select count(customer_id) from order_customer where customer_id=@customer_id)
	    if @nums>=5
	    begin
	    update customer set customer_role=1 where customer_id=@customer_id
	    print '����ɹ���лл'
	    end
	    else
	    print '��δ�ڱ��깺��ͼ��5�����ϣ�������쿨�������쿨ʧ�ܣ�лл'
	  end
end