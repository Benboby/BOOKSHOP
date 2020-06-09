create function money()     --求截至目前为止的利润
returns float
begin 
     declare @cost float,@make float, @res float
	 set @cost=(select sum(total_price) from order_supplier)
	 set @make=(select sum(total_price) from order_customer)
	 set @res=@make-@cost
	 return @res
end