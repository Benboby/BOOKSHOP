create trigger vip_account  --��Ա�˿ͻ�������<0 �Ĵ�����
on customer
with encryption
after update 
as 
begin 
      if update(customer_account)
	  begin
          declare @account float
          select @account=customer_account from inserted
          if(@account<0)
begin
  print '��Ա���ֲ���С��0���ع��ϴβ���'
  rollback transaction
  return 
 end
      end
end