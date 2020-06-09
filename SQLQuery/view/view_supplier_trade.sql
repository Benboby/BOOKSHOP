create view             --供应商交易记录视图
view_supplier_trade(供应商编号,订单编号,图书编号,图书数量,订单总价,交易类型,交易时间)
as
select 
transaction_of_supplier.order_id,transaction_of_supplier.supplier_id,order_supplier.book_id,order_supplier.number,order_supplier.total_price,transaction_of_supplier.kind,order_supplier.buy_time
from  transaction_of_supplier,order_supplier
where  transaction_of_supplier.order_id=order_supplier.supplierorder_id 