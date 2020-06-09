create proc add_supplier
@supplier_id varchar(20),
@supplier_name varchar(20),
@supplier_phone varchar(20)
as
insert into supplier(supplier_id, supplier_name, supplier_phone )
	values (@supplier_id, @supplier_name,  @supplier_phone); 