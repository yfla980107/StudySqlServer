use tableDB;
go

create table #tempTbl (id int, txt nvarchar(10));
create table ##tempTbl (id int, txt nvarchar(10));
go

insert into #tempTbl values(1, '�����ӽ����̺�');
insert into ##tempTbl values(2, '�����ӽ����̺�');
go

select * from #tempTbl;
select * from ##tempTbl;