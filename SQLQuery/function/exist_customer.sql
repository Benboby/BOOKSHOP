create function exist_customer(@customer_id varchar(20))     --�жϹ˿ͱ����Ƿ���ڸù˿�
returns int
begin 
     declare @a int  
	 set @a=(Select count(customer_id) from customer where customer_id=@customer_id)
	 if @a=0
	 begin
	    return 0          
	end
	 return  1
end