create view             --��Ӧ�̽��׼�¼��ͼ
view_supplier_trade(��Ӧ�̱��,�������,ͼ����,ͼ������,�����ܼ�,��������,����ʱ��)
as
select 
transaction_of_supplier.order_id,transaction_of_supplier.supplier_id,order_supplier.book_id,order_supplier.number,order_supplier.total_price,transaction_of_supplier.kind,order_supplier.buy_time
from  transaction_of_supplier,order_supplier
where  transaction_of_supplier.order_id=order_supplier.supplierorder_id 