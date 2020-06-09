create proc customer_purchase   --�˿������������
@order_id varchar(20), @book_id varchar(20), @customer_id varchar(20) , @number int , @total_price float
as
declare @buy_time  varchar(20),@exist_customer int,@isVIP int ,@account float,@final_price float,@hasbook int,@is_discount int
set @buy_time=GetDate(); --��ȡ����ʱ��ǰʱ��
set @exist_customer=dbo.exist_customer(@customer_id)--�жϹ˿ͱ����Ƿ���ڹ˿�
set @hasbook=(select book_number from book where book_id=@book_id)   --�ж�ͼ�����Ƿ��㹻
set @is_discount=dbo.has_discount(@book_id,30)      --ͨ�������жϸ�ͼ���Ƿ�Ϊ�ؼ���
if @number >0   --����
begin
       if @exist_customer=0    
       begin
          print '�����ڸ��û�id����ע��'
	      return;
       end 
       if @hasbook<@number 
	   begin
	      print 'ͼ���治��,�޷���ɸö���'
		  return;
	   end
	   if @is_discount=1           --�ؼ���Ĵ���
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
   set @account=(select customer_account from customer where customer_id=@customer_id)  --�ж��Ƿ��ǻ�Ա�����˻����ִﵽ���Դ��۵ĵȼ�
   set @final_price=@total_price
       if @isVIP=1 and @account>50.0         --�ǻ�Ա�һ����㹻����
       begin
	      set @final_price=@total_price*0.8
		  update customer set customer_account=customer_account+5.0 where customer_id=@customer_id
	   end
  else if @isVIP=1 and @account<50.0       --�ǻ�Ա���ǻ��ֲ������
	       begin
		   update customer set customer_account=customer_account+5.0  where customer_id=@customer_id
	       end 
     insert into order_customer(order_id, book_id, customer_id, number, total_price,sell_time)
     values (@order_id , @book_id , @customer_id  , @number , @final_price ,@buy_time);         --���������˿͵Ķ�����¼
	 update book set book_number=@hasbook-@number where book_id=@book_id                    --����ͼ���� 
	 exec transaction_customer @order_id,@customer_id,1             --��ӹ˿ͽ��׼�¼
end 
if @number <0       --����
     begin 
	    if @exist_customer=0   
        begin
          print '�����ڸ��û�id����ע��'
	      return
        end 
	   else if @is_discount=1
	   begin
		 print '�ؼ��鲻�����˻���лл'
	     return
	   end
	   else
	   begin
	     set @isVIP=(select customer_role from customer where customer_id=@customer_id)
	      if @isVIP=1
		  begin
		   update customer set customer_account=customer_account-2.5 where customer_id=@customer_id
		  end
	      insert into order_customer(order_id, book_id, customer_id, number, total_price,sell_time)   --��������˿͵Ķ�����¼
	values (@order_id , @book_id , @customer_id  , @number , @total_price ,@buy_time)       
    update book set book_number=@hasbook-@number where book_id=@book_id             --���¿��
	exec transaction_customer @order_id,@customer_id,0                   --��Ӱ��˿ͽ��׼�¼
	    end
end	


