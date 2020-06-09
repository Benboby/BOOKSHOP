create proc tovip
@customer_id varchar(20)
as
declare @role int ,@number int
set @number=(select count(customer_id) from customer where customer_id=@customer_id)
if @number=0
   begin
   print '不存在该顾客'
   return
   end
else
begin
     set @role=(select customer_role from customer where customer_id=@customer_id) 
	     if @role=1
	     begin
	     print'您已是会员，无需多次办卡'
	     end
	 else
	  begin
	  declare @nums int 
	  set @nums=(select count(customer_id) from order_customer where customer_id=@customer_id)
	    if @nums>=5
	    begin
	    update customer set customer_role=1 where customer_id=@customer_id
	    print '办理成功，谢谢'
	    end
	    else
	    print '您未在本店购买图书5次以上，不满足办卡条件，办卡失败，谢谢'
	  end
end