create proc transaction_customer   --����˿ͽ��׼�¼
@rorder_id varchar(20), @customer_id varchar(20) , @kind int 
as
insert into transaction_of_customer(order_id , customer_id  , kind )
	values (@rorder_id , @customer_id  , @kind );