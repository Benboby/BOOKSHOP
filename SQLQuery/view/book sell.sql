create view             --图书销量排行榜视图
view_book_sort(图书编号,图书销量)
as
select 
book_id,sum(number)
from  order_customer  group by  book_id