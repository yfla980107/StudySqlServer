use sqlDB;
go

select * from bankBook;

create table bankBook
	(uName	nvarchar(10),
	 uMoney int,
			constraint CK_money
			check (uMoney >= 0)
	);

go

insert into bankBook values ('구매자', 1000); -- begin tran, commit 생략시
insert into bankBook values ('판매자', 0);

begin tran -- 생략안할시
update bankBook set uMoney = uMoney - 500 where uName = '구매자'
commit

begin tran
update bankBook set uMoney = uMoney + 500 where uName = '판매자'
commit

update bankBook set uMoney -= 600 where uName = '구매자';-- begin tran, commit 생략시
update bankBook set uMoney += 600 where uName = '판매자';

begin tran
update bankBook set uMoney -= 600 where uName = '구매자'
commit
begin tran
update bankBook set uMoney += 600 where uName = '판매자'
commit

update bankBook set uMoney -= 600 where uName = '판매자';

begin tran
update bankBook set uMoney -= 600 where uName = '구매자';
update bankBook set uMoney += 600 where uName = '판매자';
commit
select * from bankBook;

update bankBook set uMoney -= 600 where uName = '판매자';


begin try
	begin tran
	update bankBook set uMoney -= 600 where uName = '구매자';
	update bankBook set uMoney += 600 where uName = '판매자';
	commit
end try

begin catch
	rollback
end catch
