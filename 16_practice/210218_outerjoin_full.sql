﻿ -- outer join 쿼리
select r.rentalIdx
   --, r.memberIdx
	 , m.memberName
   --, r.bookIdx
   --, b.cateIdx
	 , c.cateName
	 , b.bookName
	 , b.author
     , format(r.rentalDt, 'yyyy-MM-dd') as rentalDt
     , format(r.returnDt, 'yyyy-MM-dd') as returnDt
	 , dbo.ufn_getState(r.rentalState) as 대여상태
  from rentalTBL as r
  right outer join memberTBL as m
  on r.memberIdx = m.memberIdx
  left outer join booksTBL as b
  on r.bookIdx = b.bookIdx
  left outer join cateTBL as c
  on c.cateIdx = b.cateIdx
  where r.rentalIdx is null;

  -- 데이터 입력
  insert into booksTBL
 (
	cateIdx,
	bookName,
	author,
	company,
	releaseDate,
	ISBN,
	price
 )
  values
 (
	'N0002',
	'순수하지 않은 감각',
	'요안나',
	'로코코',
	'2019-10-02',
	'9791135445705',
	 12500
 );

 -- 책테이블 위 책 정보중, 설명, 등록일자 수정
 begin tran; -- 무조건 begin tran 먼저 실행

 select * from booksTBL;

 update booksTBL
	set descriptions = '부명그룹의 브레인이자 핵심 TF팀 리더, 강태욱 수석.'
	   ,regDate = '2021-02-18'
  where bookIdx = 12

  rollback; -- 업데이트쿼리문으로 데이터가 잘 들어간지 확인후 이상하게 들어가면 롤백(복구)
  commit; -- 비긴트랜 실행 후 다시 업데이트쿼리문 수정하고 제대로 데이터가 들어가면 커밋(저장)

 -- 카테고리 입력
 begin tran;

 insert into cateTBL /*(cateIdx, cateName)*/values ('I0001', '대화/협상'),
												   ('I0002', '성공/처세'),
												   ('I0003', '시간관리');

 select * from cateTBL;

 rollback;
 commit;

 delete from cateTBL where cateIdx = 'I0003';

 delete from cateTBL where cateIdx in ('I0001', 'I0002');


