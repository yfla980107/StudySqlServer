declare @val1 int; --변수선언
set @val1 = 100; --변수 값 대입

if @val1 = 100 -- 값 비교
begin
	print '@val1 100임'; -- 텍스트 메세지로 그냥 보여줌
end
else
begin
	select '@val1 100아님'; -- 결과를 가상의 테이블형태로 보여줌
end