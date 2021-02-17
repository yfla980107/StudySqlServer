﻿-- 실제 회원 정보 불러오기 레벨거꾸로, 이름순
select memberID, memberName, levels, mobile, email
  from memberTBL
 where levels <> 'S' 
 order by levels desc, memberName;

 -- 책정보
select cateIdx, bookName, author,
		interpreter, company, price
  from booksTBL
 order by price desc;

select * from cateTBL;


-- 시스템 함수사용 쿼리
select memberID,
	   concat(right(memberName, 2),' ', left(memberName, 1)) as '미국식이름',
	   case levels
		when 'A' then '골드회원'
		when 'B' then '실버회원'
		when 'C' then '브론즈회원'
		when 'D' then '철회원'
		when 'S' then '관리자'
		else '비회원'
	   end as '회원레벨',
	   mobile,
	   upper (email) as '이메일'
  from memberTBL
 where levels <> 'S' 
 order by levels asc, memberName;

 -- 사용자 정의 함수사용 쿼리
 select memberID,
	   concat(right(memberName, 2),' ', left(memberName, 1)) as '미국식이름',
	  dbo.ufn_getLevel(levels),
	   mobile,
	   upper (email) as '이메일'
  from memberTBL
 where levels <> 'S' 
 order by levels asc, memberName;

 -- 책 정보, 시스템 함수, 포맷 함수 쿼리
 SELECT bookIdx
      , cateIdx
      , concat(N'책제목 > ', bookName) as bookName
	  , author
      , isnull(interpreter, '(역자없음)') as '번역가' --isnull 많이 쓰이니 알아둘것
      , company
      , format(releaseDate, 'yyyy년 MM월 dd일') as '출판일'
      , format(price, '#,#.0원') as 가격 -- 천단위 마다 콤마(,) 찍어줌
  FROM booksTBL

  -- 책 정보 조인
SELECT b.bookIdx
    --,b.cateIdx
	  ,c.cateName
      ,b.bookName
      ,b.author
      ,b.interpreter
      ,b.company
 FROM dbo.booksTBL as b
 inner join cateTBL as c
	on b.cateIdx = c.cateIdx;

-- 대여된 책의 정보 쿼리 조인
SELECT r.rentalIdx
    --,r.memberIdx
	  ,m.memberName
    --,r.bookIdx
	  ,b.bookName
	  ,b.author
      ,format(r.rentalDt, 'yyyy-MM-dd') as '대여일'
      ,format(r.returnDt, 'yyyy-MM-dd') as '반납일'
      ,dbo.ufn_getState(r.rentalState) as '대여상태'
  FROM dbo.rentalTBL as r
  inner join booksTBL as b
  on r.bookIdx = b.bookIdx
  inner join memberTBL as m
  on r.memberIdx = m.memberIdx;

  -- 책을 안빌린 회원 조회
  SELECT r.rentalIdx
    --,r.memberIdx
	  ,m.memberName
    --,r.bookIdx
	  ,b.bookName
	  ,b.author
      ,format(r.rentalDt, 'yyyy-MM-dd') as '대여일'
      ,dbo.ufn_getState(r.rentalState) as '대여상태'
  FROM dbo.rentalTBL as r
  left outer join booksTBL as b
  on r.bookIdx = b.bookIdx
  right outer join memberTBL as m
  on r.memberIdx = m.memberIdx
  where r.rentalIdx is null;

-- 우리 책대여점에 없는 소설장르
select c.cateIdx
	  ,c.cateName
	  ,b.bookName
  from cateTBL as c
  left outer join booksTBL as b
	on c.cateIdx = b.cateIdx;