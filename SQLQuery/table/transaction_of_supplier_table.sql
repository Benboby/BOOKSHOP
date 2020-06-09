create table transaction_of_supplier
(
    order_id varchar(20),						--订单编号
	supplier_id varchar(20),			--供应商编号
	kind int                      --购买的订单则为1，退货的订单则为0.
);