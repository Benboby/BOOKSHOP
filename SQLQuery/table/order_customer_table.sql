create table order_customer
(
     order_id varchar(20) primary key ,       --������
	 book_id varchar(20)   not null,          --�鱾���
	 customer_id varchar(20)  not null ,       --�˿ͱ��
	 number int not null,                  --�����鱾����   ����Ϊ���飬����Ϊ����
	 total_price float not null,            --�����ܼ�
	 sell_time datetime                     --����ʱ��
)