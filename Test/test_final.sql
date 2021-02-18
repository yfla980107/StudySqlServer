--김유림

-- 1-1문제
select lower(email) as email, mobile, names, addr
  from membertbl
order by names desc;

-- 1-2문제
select names, author, releaseDate, price
  from bookstbl;

-- 2-1문제
select top 10
	concat(right(names,2),', ',left(names,1)) as 변경이름
	, levels
	, left(addr, 2) as 도시
	, lower(email) as 이메일
from membertbl ;

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

-- 3-1문제
select 
		b.idx as '번호'
	  , d.Division as '장르번호'
	  , d.Names as '장르'
	  , b.names as '책제목'
	  , b.author as '저자'
from bookstbl as b
inner join divtbl as d
on b.Division = d.Division
where d.Names = '로맨스' ;

-- 3-2문제
select m.Names
	 , m.levels as Levels
	 , m.addr as Addr
	 , r.rentalDate
 from membertbl as m
left outer join rentaltbl as r
   on m.idx = r.memberIdx
where r.rentalDate is null;

-- 4-1문제
insert into divtbl
	values(
		'I002',
		'자기개발서'
	      );

-- 4-2문제
update membertbl
   set Addr = '부산시 해운대구',
		mobile = '010-6683-7732'
 where Names = '성명건';


--5번 문항
select d.names, sum(b.price) as 총합계금액
  from divtbl as d
inner join bookstbl as b
	on d.division = b.Division
 where d.Names not in (('자기개발서'),('프로그래밍'))
group by rollup(d.Names);