create function money()     --�����ĿǰΪֹ������
returns float
begin 
     declare @cost float,@make float, @res float
	 set @cost=(select sum(total_price) from order_supplier)
	 set @make=(select sum(total_price) from order_customer)
	 set @res=@make-@cost
	 return @res
end