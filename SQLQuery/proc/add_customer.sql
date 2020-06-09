create proc add_customer
@customer_id varchar(20),		--顾客编号
@customer_phone varchar(20),		--顾客电话
@customer_account float ,	--账户余额
@customer_role int           --顾客身份
as
insert into  customer(customer_id,customer_phone,customer_account,customer_role)
	values (@customer_id, @customer_phone, @customer_account,@customer_role); 