--exec usp_users '김경호';
--exec usp_users2 1980, 180;

declare @myValue int;
exec usp_users4 '테스트값 2', @myValue output;

print concat('현재 입력된 값은 ==>', @myValue);
select @myValue as '현재값';

