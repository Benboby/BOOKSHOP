create view             --ͼ���������а���ͼ
view_book_sort(ͼ����,ͼ������)
as
select 
book_id,sum(number)
from  order_customer  group by  book_id