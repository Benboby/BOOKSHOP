create proc transaction_customer   --插入顾客交易记录
@rorder_id varchar(20), @customer_id varchar(20) , @kind int 
as
insert into transaction_of_customer(order_id , customer_id  , kind )
	values (@rorder_id , @customer_id  , @kind );