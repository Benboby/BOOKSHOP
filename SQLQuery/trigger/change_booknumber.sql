create trigger change_booknumber  --库存改变
on order_supplier
with encryption
after insert 
as 
declare @number int,@book_id varchar(20),@nownumber int,@supplierorder_id varchar(20),@supplier_id varchar(20)
select @number=number,@book_id=book_id,@supplierorder_id= supplierorder_id,@supplier_id=supplier_id from inserted 
select @nownumber=book_number from book where book_id=@book_id 
if(@number<0)
begin
      if(@nownumber+@number<0)
      begin
  print '库存不足，无法退书'
  rollback transaction
  return 
      end
          if(@nownumber+@number>0)
          begin
          update book set book_number=@nownumber+@number where book_id=@book_id
		  exec transaction_supplier @supplierorder_id,@supplier_id,0 
		  return 
          end
end
 update book set book_number=@nownumber+@number where book_id=@book_id
 exec transaction_supplier @supplierorder_id,@supplier_id,1