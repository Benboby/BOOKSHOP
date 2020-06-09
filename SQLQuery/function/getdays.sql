create function getdays(@buy_time datetime)
returns int
begin 
   return DATEDIFF(day,@buy_time,GetDate())
end