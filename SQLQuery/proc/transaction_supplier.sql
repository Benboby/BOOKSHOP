create proc transaction_supplier   --插入与供应商交易记录
@rorder_id varchar(20), @supplier_id varchar(20) , @kind int 
as
insert into transaction_of_supplier(order_id , supplier_id  , kind )
	values (@rorder_id , @supplier_id  , @kind );