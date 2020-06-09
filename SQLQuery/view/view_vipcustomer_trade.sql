create view             --会员顾客交易记录视图
view_vipcustomer_trade(会员编号,订单编号,图书编号,图书数量,订单总价,交易类型,交易时间)
as
select 
transaction_of_customer.customer_id,transaction_of_customer.order_id,order_customer.book_id,order_customer.number,order_customer.total_price,transaction_of_customer.kind,order_customer.sell_time
from  transaction_of_customer,order_customer,customer
where  customer.customer_role=1 and  customer.customer_id=transaction_of_customer.customer_id and transaction_of_customer.order_id=order_customer.order_id 