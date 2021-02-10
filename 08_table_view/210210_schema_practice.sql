use schemaDB;
go

create table users.userTBL(id int not null); -- 스키마는 편리성과 쉽게 구분하기 위해 씀
go
create table sales.buyTBL(id int not null);
go
create table sales.prodTBL(pid int);
go

create table normalTBL(nid int not null);
go

select * from users.userTBL;
select * from sales.buyTBL;
select * from dbo.normalTBL;