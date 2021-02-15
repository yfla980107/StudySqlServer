-- 사용자 정의 함수를 사용안한 것
select 
		*,
		(year(getdate()) - birthYear) + 1 as 나이
  from userTbl;


  -- 사용자 정의 함수 사용
select *,
		dbo.ufn_getAge(birthYear) as 나이,
		dbo.ufn_getZodiac(birthYear) as 띠
	from userTbl;

