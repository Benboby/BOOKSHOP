create proc transaction_supplier   --�����빩Ӧ�̽��׼�¼
@rorder_id varchar(20), @supplier_id varchar(20) , @kind int 
as
insert into transaction_of_supplier(order_id , supplier_id  , kind )
	values (@rorder_id , @supplier_id  , @kind );