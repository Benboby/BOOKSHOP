create function has_discount(@book_id varchar(20),@limit_days int)     --�ж�ͼ���Ƿ����
returns int
begin 
     declare @buy_time datetime 
	 set @buy_time=(Select top 1 buy_time from order_supplier where book_id=@book_id  and number>0 order by but_time desc )--ֻȡ��ͼ�����һ�ν�����ʱ��
	 if dbo.getdays(@buy_time)>@limit_days
	 begin
	    return 1          --������Ŀǰλ�ó���limit_days �򷵻�1 ˵������
	end
	 return 0           --��������¶�����0 ������ѯ������ͼ������
end