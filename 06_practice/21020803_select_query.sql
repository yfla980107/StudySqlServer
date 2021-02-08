use sqlDB;
go

 -- 이름이 김경호인 사람 조회
  select * from userTbl
   where userName = '김경호';

 -- 1970년 이후 출생이고 키 182 이상인 사람 아이디, 이름만 조회
  select userID, userName, height
	from userTbl
   where birthYear >= 1970
	and height >= 182;

 -- 1970년 이후 출생이거나 키가 182이상이거나 인 사람들 모두
  select userID, userName, height
	from userTbl
   where birthYear >= 1970
	or height >= 182;

 -- 키가 180~183인 사람만 조회
  select userID, userName, height
	from userTbl
   where height >= 180
	 and height <= 183;

 -- between ~ and
  select userID, userName, height
	from userTbl
   where height between 180 and 183;

 -- 지역이 경남, 전남, 경북
  select userID, userName, addr
	from userTbl
   where addr = '경남'
	  or addr = '전남'
	  or addr = '경북';

  select userID, userName, addr
	from userTbl
   where addr in ('경남', '전남', '경북');

 -- like
  select userID, userName, addr
	from userTbl
   where userName like '김%';

  select userID, userName, addr
	from userTbl
   where userName like '_종신';

 -- SUBQUERY
  select userName, height
	from userTbl
   where height > 177;

  select userName, height --서브쿼리
	from userTbl
   where height > 
		 (select height from userTbl where userName = '김경호');

  select userName, height -- any 섭쿼리 결과중 하나만 만족(and 비슷)
	from userTbl
   where height >= any
		 (select height from userTbl where addr = '경남');

  select userName, height -- all 섭쿼리 결과중 모두 만족 (or랑 비슷)
	from userTbl
   where height >= all
		 (select height from userTbl where addr = '경남');

  select userName, height -- 서브쿼리에서 in 사용가능
	from userTbl
   where height in
		 (select height from userTbl where addr = '경남');


 -- order by 정렬 
  select userName, mDate
	from userTbl
order by mDate asc;  -- 기본값은 (asc)오름차순=생략가능, (desc)내림차순

  select *
	from userTbl
order by userID desc;

 -- distinct 중복값
  select distinct addr
	from userTbl;

  select top(5) * -- top 제일 위에값 5개만 출력
	from userTbl
order by mDate desc;

 -- offset 앞선 갯수만큼 뛰어넘은 후 조회
  select userID, userName, birthYear
	from userTbl
order by birthYear
  offset 4 rows;

 -- 복사 (이미 있는 테이블에 하면 안됨, 테이블생성 및 내용 복사 단, PK는 복사 안됨)
 select * into buyTbl2 from buyTbl;
 select userID, prodName into buyTbl3 from buyTbl;

-- GROUP BY
  select * from buyTbl;

  select userID, amount
	from buyTbl
order by userID;

  select userID, sum(amount) as '합계' -- 집계함수는 숫자데이터만 가능
	from buyTbl
group by userID;

 -- min, max
  select min(height) as '작은키'
	from userTbl;

  select max(height) as '큰키'
	from userTbl;

 -- 집계함수 + 다른컬럼까지 출력할 경우 group by 사용
  select userID, userName, min(height) as '작은키', max(height) as '큰키'
	from userTbl
group by userID, userName;

  select userID, userName, height -- 키가 제일 큰 사람과 제일 작은 사람 출력
	from userTbl
   where height = (select min(height) from userTbl)
	  or height = (select max(height) from userTbl)

 -- 총 데이터 개수
 select COUNT(*) as '회원수' from userTbl; -- 10
 select COUNT(*) as '구매내역수'from buyTbl; -- 12

  -- 잘못된 필터링
  select userID, sum(price * amount) as '전체 구매금액'
	from buyTbl

 -- where sum(price * amount) > 1000
group by userID
  having sum(price * amount) > 1000
order by sum(price * amount) desc;

 -- rollup / cube
  select num, groupName, sum(price * amount) as '구매금액',
		GROUPING_ID(groupName, num)
	from buyTbl
group by rollup(groupName,num);

 -- userID, groupName 가지고 cube 다차원 합계
  select userID, groupName, sum(price * amount) as '구매금액'
	from buyTbl
group by cube(groupName, userID);

  select userID, sum(price * amount) as '구매금액'
	from buyTbl
group by rollup(userID);

  select groupName, sum(price * amount) as '구매금액'
	from buyTbl
group by cube(groupName);


 --without CTE
  select userID, sum(price * amount) as 'total'
	from buyTbl
group by userID
order by sum(price * amount) desc;

 --with CTE
with cte_tmp(userID, total)
as
( select userID, sum(price * amount) as 'total'
	from buyTbl
group by userID )
select * from cte_tmp order by total desc;