create table transaction_of_customer
(
    order_id varchar(20),						--订单编号
	customer_id varchar(20),			--顾客编号
	kind int                      --购买的订单则为1，退货的订单则为0.
);