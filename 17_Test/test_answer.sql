-- 1-1 문제
select lower(email) as email, mobile, names, addr
  from membertbl
order by names desc;

		--1-1 정답(기본 Select 쿼리)
		select lower(m.Email) as email, m.Mobile, m.Names, m.Addr
		  from membertbl as m
		order by names desc;

-- 1-2 문제
select names, author, releaseDate, price
  from bookstbl;

		-- 1-2 정답(기본 Select 쿼리)
		select b.Names, b.Author, b.ReleaseDate, b.Price
		  from bookstbl as b;

-- 2-1문제
select top 10
	concat(right(names,2),', ',left(names,1)) as 변경이름
	, levels
	, left(addr, 2) as 도시
	, lower(email) as 이메일
from membertbl ;

		-- 2-1 정답(문자열 내장함수)
		select top (10)
			   concat(right(m.Names,2),', ', left(m.Names,1)) as 변경이름
			 , m.levels
			 , left(m.Addr, 2) as 도시
		     , lower(m.Email) as 이메일
		  from membertbl as m;

-- 2-2문제
select 
  idx as Idx
, concat('제목 :  ', names) as Names
, concat('저자 > ', Author) as Author
, format(ReleaseDate, 'yyyy년 MM월 dd일')  as 출판일
, isbn as ISBN
, format(price, '#,#원') as 가격
from bookstbl
order by idx desc;

		-- 2-2 정답(상위 내장함수 및 숫자형 포맷 내장함수 사용)
		select b.Idx
			 , concat('제목 : ', b.Names) as Names
		     , concat('저자 > ',b.Author) as Author
			 , format(b.ReleaseDate, 'yyyy년 MM월 dd일') as 출판일
			 , b.ISBN
			 , format(b.Price, '#,#원') as 가격
		  from bookstbl as b
		  order by b.Idx desc;

-- 3-1문제
select  b.idx as '번호'
	  , d.Division as '장르번호'
	  , d.Names as '장르'
	  , b.names as '책제목'
	  , b.author as '저자'
from bookstbl as b
inner join divtbl as d
on b.Division = d.Division
where d.Names = '로맨스' ;

		-- 3-1 정답(inner 조인 사용)
		select b.Idx as 번호
			 , b.Division as 장르번호
			 , d.Names as 장르
			 , b.Names as 책제목
			 , b.Author as 저자
		  from bookstbl as b
	inner join divtbl as d
			on b.Division = d.Division
		 where b. Division = 'B002' ;

		 -- 3-1 문제 다르게 푸는 방법1
		select b.Idx 번호 -- as 안써도되는 약식
			 , b.Division '장르 번호'
			 , d.Names 장르
			 , b.Names 책제목
			 , b.Author 저자
		  from bookstbl b
			 ,divtbl d -- inner join 짧게 하는법
		 where b.Division = d.Division -- inner join on 부분 절을 where에 넣어도됨
		   and b. Division = 'B002'; 
		  
		 -- 3-1 문제 다르게 푸는 방법2 (조인 대신 서브쿼리로 나타내는 방법)
		select b.Idx as 번호
			 , b.Division as 장르번호
			 --, d.Names as 장르
			 , (select names from divtbl where Division = b.Division) as 장르 -- 서브쿼리는 select 컬럼 여러개 불가능
			 , b.Names as 책제목
			 , b.Author as 저자
		  from bookstbl as b
		 where b. Division = 'B002' ;

-- 3-2문제
select m.Names
	 , m.levels as Levels
	 , m.addr as Addr
	 , r.rentalDate
 from membertbl as m
left outer join rentaltbl as r
   on m.idx = r.memberIdx
where r.rentalDate is null;

		-- 3-2 정답 (outer 조인 사용)
		select m.Names, m.Levels, m.Addr,
			   r.rentalDate
		  from membertbl as m
		 left outer join rentaltbl as r
		    on m.Idx = r.memberIdx
		 where r.rentalDate is null;

		-- 3-2 문제 다르게 푸는 방법
		select m.Names
			 , m.Levels
			 , m.Addr
			 , null as rentalDate -- 임의의 값을 넣어줌
		  from membertbl as m
		  where m.Idx not in (select memberIdx from rentaltbl as r); -- 책을 빌린 회원들의 idx를 가져옴
		  
		
-- 4-1문제
insert into divtbl
	values(
		'I002',
		'자기개발서'
	      );

		-- 4-1 정답 (삽입 쿼리 사용)
		insert into divtbl values ('I002','자기개발서');

-- 4-2문제
update membertbl
   set Addr = '부산시 해운대구',
       mobile = '010-6683-7732'
 where Names = '성명건';

 		-- 4-2 정답 (수정 쿼리 사용)
		update membertbl
		   set Addr = '부산시 해운대구',
			   Mobile =  '010-6683-7732'
		 where Idx = 26;

--5번 문항
select d.names, sum(b.price) as 총합계금액
  from divtbl as d
inner join bookstbl as b
	on d.division = b.Division
 where d.Names not in (('자기개발서'),('프로그래밍'))
group by rollup(d.Names);

 		-- 5 정답 (통계(RollUp) 쿼리 사용)
		select d.Names, sum(b.price) as 총합계금액
		  from bookstbl as b
		 inner join divtbl as d
			on b.Division = d.Division
	     group by rollup (d.Names);

 		-- 5 다르게 풀기(서브쿼리)
			select	(select names from divtbl where Division = a.Division) as names , sum_price as 총합계금액
			  from
					   ( select Division, sum(price) as sum_price
						   from bookstbl
						group by Division ) as a
			union all
			select null, sum(price)
			from bookstbl;