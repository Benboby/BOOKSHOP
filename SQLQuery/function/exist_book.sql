create function exist_book(@book_id varchar(20))     --�ж�ͼ����Ƿ���ڸ�ͼ��
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