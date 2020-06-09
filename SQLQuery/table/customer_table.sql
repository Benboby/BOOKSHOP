create table customer   --顾客表
(
	customer_id varchar(20) primary key,--顾客编号
	customer_phone varchar(20),			--顾客电话
	customer_account float,				--顾客账户积分，普通成员则空，会员则有账户积分，积分达到50即可打八折
	customer_role int ,                 --会员还是普通成员，普通成员则空，会员则为1
);