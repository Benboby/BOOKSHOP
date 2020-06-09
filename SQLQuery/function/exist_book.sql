create function exist_book(@book_id varchar(20))     --判断图书表是否存在该图书
returns int
begin 
     declare @a int  
	 set @a=(Select count(book_id) from book where book_id=@book_id)
	 if @a=0
	 begin
	    return 0          
	end
	 return  1
end