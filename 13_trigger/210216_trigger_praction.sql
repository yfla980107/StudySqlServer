use sqlDB;
go

create or alter trigger trg_backupUsertbl -- Ʈ�����̸�
on usertbl --Ʈ���Ÿ� ������ ���̺� 
-- with encryption Ʈ���Ÿ� ��ȣȭ��
after update, delete -- ����, ���� �Ŀ� �۵��ϵ��� ����
as 
	declare @modType nchar(2);

	if(COLUMNS_UPDATED() > 0) -- ������Ʈ
	begin
		set @modType = '����';
	end
	else --����Ʈ
	begin
		set @modType = '����';
	end

	insert into backup_usertbl
		SELECT [userID], [userName], [birthYear], [addr]
			   ,[mobile1],[mobile2],[height] ,[mDate]
			   ,@modType, GETDATE(), user_name()
		  FROM deleted; -- ����, ���� �� �� ���� ���� �� �ִ� ���̺�
go