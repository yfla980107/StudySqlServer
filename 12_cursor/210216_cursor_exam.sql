use sqlDB;
go

declare cur_usertbl cursor local -- local ����Ŀ�� global ����Ŀ��
	for select userName, height from userTbl; -- ���� �ִ� ������ into �ڿ� �ִ� ������ ���ƾ���

open cur_usertbl; -- Ŀ�� ����

declare @userName nchar(8); -- ȸ���̸�
declare @height smallint; -- ȸ���� Ű��� ����
declare @cnt int = 0; -- ȸ����(���� ���)
declare @totalHeight int = 0; -- ȸ�� Ű�� �հ� ����

fetch next from cur_usertbl into @userName,@height; -- Ŀ���� �о @height ������ �Ҵ�

-- �ݺ��� ����
while @@FETCH_STATUS = 0
begin
	set @cnt += 1;
	set @totalHeight += @height;
	print concat('ȸ�� : ' , @userName, 'Ű :', @height);
	fetch next from cur_usertbl into @userName, @height; -- ������ �������� �� ó��
end

print @totalHeight
print @cnt
print concat('ȸ�� Ű ��� => ', @totalHeight / @cnt);

close cur_usertbl; -- Ŀ�� �ݱ�
deallocate cur_usertbl; -- Ŀ�� �Ҵ� ����