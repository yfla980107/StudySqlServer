use sqlDB;
go

-- ���ν��� ����
create procedure usp_users
as
	select userID, userName, birthYear from userTbl;
go

-- ���ν��� ����
alter procedure usp_users
as
	select userID, userName, birthYear from userTbl;
go

-- ���ν��� ���� �Ǵ� ������ ���ÿ�
create or alter procedure usp_users
as
	select userID, userName, birthYear from userTbl;
go

exec usp_users;