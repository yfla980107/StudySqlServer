use sqlDB;
go

create or alter trigger trg_testtbl
on testtbl
after insert, delete, update -- ����, �����Ҷ� Ʈ���� �߻�
as
	print '��Ʈ���� �߻�';

insert into testTbl values ('BTS');
select * from testTbl where txt = '������';
update testTbl set txt = '��������!' where id = 4;
delete testTbl where id = 3;