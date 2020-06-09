create table book --书籍表
(
	book_id varchar(20) primary key,	--书本编号
	book_name varchar(20) not null,			--书本名称
	book_kind varchar(20) not null ,              --书本类别
	publishment varchar(20)  not null,				--书本出版社
	book_price float not null,						--书本售价
	book_number int	 not null				--书本库存
);