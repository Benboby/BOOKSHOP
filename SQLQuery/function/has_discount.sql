create function has_discount(@book_id varchar(20),@limit_days int)     --判断图书是否打折
returns int
begin 
     declare @buy_time datetime 
	 set @buy_time=(Select top 1 buy_time from order_supplier where book_id=@book_id  and number>0 order by but_time desc )--只取该图书最后一次进货的时间
	 if dbo.getdays(@buy_time)>@limit_days
	 begin
	    return 1          --进货到目前位置超过limit_days 则返回1 说明打折
	end
	 return 0           --其他情况下都返回0 包括查询不到该图书的情况
end