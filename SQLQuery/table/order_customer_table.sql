create table order_customer
(
     order_id varchar(20) primary key ,       --订单号
	 book_id varchar(20)   not null,          --书本编号
	 customer_id varchar(20)  not null ,       --顾客编号
	 number int not null,                  --购买书本数量   正数为买书，负数为退书
	 total_price float not null,            --订单总价
	 sell_time datetime                     --销售时间
)