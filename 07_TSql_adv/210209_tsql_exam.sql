use sqlDB;
go

-- declare @변수명 데이터형식; (변수선언)
declare @myVar1 int;
declare @myVar2 smallint, @myVar3 decimal(5, 4)
declare @myVar4 char(20);

-- set @변수이름 = 변수값; (변수 값대입)
set @myVar1 = 5;
set @myVar2 = 3;
set @myVar3 = 3.144;
set @myVar4 = '가수 이름 ==> ';

-- select @변수이름 (변수 출력)
select @myVar1;
select '100' + @myvar3; -- db에서 '숫자' + 숫자 = 숫자로 계산 (원래는 문자로 계산)
select @myvar4, userName from userTbl where height > 180;

declare @myVar5 tinyint; -- 255
set @myVar5 = 3;

select top(@myVar5) userName, height from userTbl order by height desc; -- 변수 3이므로 top(3)까지만 출력


-- 형 변환함수
select convert(float, amount) as amount from buyTbl; 
select TRY_CONVERT(float, amount) as amount from buyTbl; -- TRY_CONVERT > 값이 제대로 변환안될 경우 NULL로 변환
select avg(convert(decimal, amount)) as [평균구매개수] from buyTbl;

select price, amount, price/amount as [단가/수량] from buyTbl;

--
-- '1000'문자열 --> 숫자
select parse('2021년 2월 39일'as date);
select try_parse('2021년 2월 39일'as date); -- try_parse > 값이 제대로 변환안될 경우 NULL로 변환

select parse ('123.45' as int);
select try_parse ('123.45' as int);

select parse ('123.45' as decimal(5,2));
select try_parse ('123.45' as float);

select cast('11' as int);


-- 스칼라함수(단일 리턴함수)
select GETDATE() as '현재날짜'; -- 현재 날짜 반환

select year(getdate()) as '금년';
select month(getdate()) as '이번달';
select day(getdate()) as '오늘일';

select abs(-100); -- 수식 절대값 반환

select ROUND(3.1415, 3); --소수점 3번째자리 반올림
select ROUND(1236.5678, -1);

select cast((rand() * 100)as int); --랜덤함수

select iif(20 < 10, '참', '거짓'); -- 수식이 참, 거짓 일때 반환

-- 문자열 함수
select ascii('a'), ASCII('A'); --아스키코드 출력
select char(98), char(66);
select UNICODE('나'); --유니코드 출력
select nchar(45909);

-- 진짜 많이 쓰이는 문자열 함수
-- 문자열 결합
select concat('Micrsoft ','SQL ', 'Server ', 2019);
-- 문자열 시작위치 리턴
select CHARINDEX('Server', 'SQL Server 2019');
-- left, right
select left('SQL Server 2019', 3), right('SQL Server 2019', 4);
-- substring (지정한 위치부터 지정한 개수의 문자를 리턴)
select SUBSTRING('Hello World!', 7, 5);
select SUBSTRING('안녕하세요, SQL서버입니다!', 11, 2);
-- len (문자열 길이 리턴, 공백무시)
select len('안녕하세요'), len('Hello World!');
select len('안녕하세요'), len('Hello World!     ');
-- lower, upper (low 소>대, up 대>소)
select lower('abcdeFG'), upper('abcdeFG');
-- ltrim(뒷여백무시), rtrim
select len(ltrim('   Hello World!   ')),
	   len(rtrim('   Hello World!   ')),
 	   len (trim('   Hello World!   '));


-- replace (원하는 값 변환해줌)
select replace('(2016년 발표)SQL Server 2016', '2016', '2019');

-- 정말정말정말정말 정말 많이 쓰는 함수
select format(getdate(), ''); --기본
select format(getdate(), 'dd/mm/yyyy');
select format(getdate(), 'yyyy-MM-dd hh:mm:ss:ms');
select format(getdate(), 'yyyy-MM-dd');
select format(getdate(), 'hh:mm:ss');
select format(getdate(), '');
select format(getdate(), '');
select format(getdate(), '');
select format(getdate(), '');