use sqlDB;
go

create or alter trigger trg_backupUsertbl -- 트리거이름
on usertbl --트리거를 부착할 테이블 
-- with encryption 트리거를 암호화함
after update, delete -- 수정, 삭제 후에 작동하도록 설정
as 
	declare @modType nchar(2);

	if(COLUMNS_UPDATED() > 0) -- 업데이트
	begin
		set @modType = '수정';
	end
	else --딜리트
	begin
		set @modType = '삭제';
	end

	insert into backup_usertbl
		SELECT [userID], [userName], [birthYear], [addr]
			   ,[mobile1],[mobile2],[height] ,[mDate]
			   ,@modType, GETDATE(), user_name()
		  FROM deleted; -- 수정, 삭제 할 시 원본 값이 들어가 있는 테이블
go