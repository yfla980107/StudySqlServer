--exec usp_users '���ȣ';
--exec usp_users2 1980, 180;

declare @myValue int;
exec usp_users4 '�׽�Ʈ�� 2', @myValue output;

print concat('���� �Էµ� ���� ==>', @myValue);
select @myValue as '���簪';

