create table book --�鼮��
(
	book_id varchar(20) primary key,	--�鱾���
	book_name varchar(20) not null,			--�鱾����
	book_kind varchar(20) not null ,              --�鱾���
	publishment varchar(20)  not null,				--�鱾������
	book_price float not null,						--�鱾�ۼ�
	book_number int	 not null				--�鱾���
);