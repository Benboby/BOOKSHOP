create proc add_book
@book_id varchar(20),			--书本编号
@book_name varchar(20),			--书本名称
@book_kind varchar(20),          --书本类别
@publishment varchar(20),			--出版社
@book_price float,					--书本售价
@book_number int				--库存余量
as
insert into book(book_id, book_name, book_kind,publishment, book_price, book_number)
	values (@book_id, @book_name, @book_kind,@publishment, @book_price, @book_number); 