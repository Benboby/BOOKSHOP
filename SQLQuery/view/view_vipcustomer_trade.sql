create view             --��Ա�˿ͽ��׼�¼��ͼ
view_vipcustomer_trade(��Ա���,�������,ͼ����,ͼ������,�����ܼ�,��������,����ʱ��)
as
select 
transaction_of_customer.customer_id,transaction_of_customer.order_id,order_customer.book_id,order_customer.number,order_customer.total_price,transaction_of_customer.kind,order_customer.sell_time
from  transaction_of_customer,order_customer,customer
where  customer.customer_role=1 and  customer.customer_id=transaction_of_customer.customer_id and transaction_of_customer.order_id=order_customer.order_id 