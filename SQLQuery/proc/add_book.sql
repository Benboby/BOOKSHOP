create proc add_book
@book_id varchar(20),			--�鱾���
@book_name varchar(20),			--�鱾����
@book_kind varchar(20),          --�鱾���
@publishment varchar(20),			--������
@book_price float,					--�鱾�ۼ�
@book_number int				--�������
as
insert into book(book_id, book_name, book_kind,publishment, book_price, book_number)
	values (@book_id, @book_name, @book_kind,@publishment, @book_price, @book_number); 