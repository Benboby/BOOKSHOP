create trigger vip_account  --会员顾客积分余额不能<0 的触发器
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
  print '会员积分不能小于0，回滚上次操作'
  rollback transaction
  return 
 end
      end
end