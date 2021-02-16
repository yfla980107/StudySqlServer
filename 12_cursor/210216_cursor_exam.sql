use sqlDB;
go

declare cur_usertbl cursor local -- local 지역커서 global 전역커서
	for select userName, height from userTbl; -- 여기 있는 변수랑 into 뒤에 있는 변수는 같아야함

open cur_usertbl; -- 커서 열기

declare @userName nchar(8); -- 회원이름
declare @height smallint; -- 회원의 키담는 변수
declare @cnt int = 0; -- 회원수(읽은 행수)
declare @totalHeight int = 0; -- 회원 키의 합계 변수

fetch next from cur_usertbl into @userName,@height; -- 커서값 읽어서 @height 변수에 할당

-- 반복문 시작
while @@FETCH_STATUS = 0
begin
	set @cnt += 1;
	set @totalHeight += @height;
	print concat('회원 : ' , @userName, '키 :', @height);
	fetch next from cur_usertbl into @userName, @height; -- 데이터 가져오기 및 처리
end

print @totalHeight
print @cnt
print concat('회원 키 평균 => ', @totalHeight / @cnt);

close cur_usertbl; -- 커서 닫기
deallocate cur_usertbl; -- 커서 할당 해제