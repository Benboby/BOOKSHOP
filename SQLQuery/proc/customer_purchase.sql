create proc customer_purchase   --顾客买书或者退书
@order_id varchar(20), @book_id varchar(20), @customer_id varchar(20) , @number int , @total_price float
as
declare @buy_time  varchar(20),@exist_customer int,@isVIP int ,@account float,@final_price float,@hasbook int,@is_discount int
set @buy_time=GetDate(); --获取买书时当前时间
set @exist_customer=dbo.exist_customer(@customer_id)--判断顾客表中是否存在顾客
set @hasbook=(select book_number from book where book_id=@book_id)   --判断图书库存是否足够
set @is_discount=dbo.has_discount(@book_id,30)      --通过函数判断该图书是否为特价书
if @number >0   --买书
begin
       if @exist_customer=0    
       begin
          print '不存在该用户id，请注册'
	      return;
       end 
       if @hasbook<@number 
	   begin
	      print '图书库存不够,无法完成该订单'
		  return;
	   end
	   if @is_discount=1           --特价书的处理
	   begin 
	   declare @discount_price float
	   set @discount_price=@total_price*0.5
	   insert into order_customer(order_id, book_id, customer_id, number, total_price,sell_time)
	      values (@order_id , @book_id , @customer_id  , @number , @discount_price ,@buy_time)
		  update book set book_number=@hasbook-@number where book_id=@book_id
		  exec transaction_customer @order_id,@customer_id,1
		  return ;
	   end
   set @isVIP=(select customer_role from customer where customer_id=@customer_id)
   set @account=(select customer_account from customer where customer_id=@customer_id)  --判断是否是会员并且账户积分达到可以打折的等级
   set @final_price=@total_price
       if @isVIP=1 and @account>50.0         --是会员且积分足够打折
       begin
	      set @final_price=@total_price*0.8
		  update customer set customer_account=customer_account+5.0 where customer_id=@customer_id
	   end
  else if @isVIP=1 and @account<50.0       --是会员但是积分不足打折
	       begin
		   update customer set customer_account=customer_account+5.0  where customer_id=@customer_id
	       end 
     insert into order_customer(order_id, book_id, customer_id, number, total_price,sell_time)
     values (@order_id , @book_id , @customer_id  , @number , @final_price ,@buy_time);         --插入书店与顾客的订单记录
	 update book set book_number=@hasbook-@number where book_id=@book_id                    --更新图书库存 
	 exec transaction_customer @order_id,@customer_id,1             --添加顾客交易记录
end 
if @number <0       --退书
     begin 
	    if @exist_customer=0   
        begin
          print '不存在该用户id，请注册'
	      return
        end 
	   else if @is_discount=1
	   begin
		 print '特价书不允许退货，谢谢'
	     return
	   end
	   else
	   begin
	     set @isVIP=(select customer_role from customer where customer_id=@customer_id)
	      if @isVIP=1
		  begin
		   update customer set customer_account=customer_account-2.5 where customer_id=@customer_id
		  end
	      insert into order_customer(order_id, book_id, customer_id, number, total_price,sell_time)   --添加书店与顾客的订单记录
	values (@order_id , @book_id , @customer_id  , @number , @total_price ,@buy_time)       
    update book set book_number=@hasbook-@number where book_id=@book_id             --更新库存
	exec transaction_customer @order_id,@customer_id,0                   --添加啊顾客交易记录
	    end
end	


