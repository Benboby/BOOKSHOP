create proc add_customer
@customer_id varchar(20),		--�˿ͱ��
@customer_phone varchar(20),		--�˿͵绰
@customer_account float ,	--�˻����
@customer_role int           --�˿����
as
insert into  customer(customer_id,customer_phone,customer_account,customer_role)
	values (@customer_id, @customer_phone, @customer_account,@customer_role); 