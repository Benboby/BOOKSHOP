create table order_supplier
(
     supplierorder_id varchar(20) primary key ,       --������
	 book_id varchar(20)   not null,          --�鱾���
	 supplier_id varchar(20)  not null ,       --��Ӧ�̱��
	 number int not null,                  --�����鱾����
	 total_price float not null,            --�����ܼ�  
	 buy_time datetime                     --����ʱ��
)