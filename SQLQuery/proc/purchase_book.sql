create proc purchase_book   --从供应商进货
@supplierorder_id varchar(20), @book_id varchar(20), @supplier_id varchar(20) , @number int , @total_price float
as
declare @buy_time  varchar(20) set @buy_time=GetDate();
insert into order_supplier(supplierorder_id, book_id, supplier_id, number, total_price,buy_time)
	values (@supplierorder_id , @book_id , @supplier_id  , @number , @total_price ,@buy_time);