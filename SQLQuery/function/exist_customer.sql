create function exist_customer(@customer_id varchar(20))     --判断顾客表中是否存在该顾客
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