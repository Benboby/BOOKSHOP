create table order_supplier
(
     supplierorder_id varchar(20) primary key ,       --订单号
	 book_id varchar(20)   not null,          --书本编号
	 supplier_id varchar(20)  not null ,       --供应商编号
	 number int not null,                  --进货书本数量
	 total_price float not null,            --订单总价  
	 buy_time datetime                     --进货时间
)