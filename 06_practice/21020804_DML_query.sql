-- testTBL insert
use sqlDB;
go

-- DML 중 SELECT
select * from testTBL1;

-- DML 중 INSERT (pk컬럼이 없으면 값을 절대 넣을수 없음)
insert into testTBL1 values (1, '홍길동', 25);
insert into testTBL1 (id, userName) values (2, '성명건');
insert into testTBL1 values (3, '홍길순'); -- 정해진 컬럼값 없어서 에러
insert into testTBL1 (age, id) values (30, 4);
insert into testTBL1 (userName, age) values ('설현', 23) -- pk가 없어서 에러

-- IDENTITY 설정 후에 하면 정해진 컬럼값없이도 데이터 insert가능
insert into testTBL1 values ('성시경', 44);

-- 열의 목록 및 기타 정보 출력
exec sp_help 'testTBL1';

-- 현재의 IDENTITY 값 확인
select IDENT_CURRENT('testTBL1');

select @@IDENTITY;

-- 다른 db의 테이블 데이터 가져오기 (경로)
select * from BikeStores.sales.order_items;

select * from ShopDB.dbo.memberTBL;

--sale.order_items 테이블 복사
CREATE TABLE [sales_order_items](
	[order_id] [int] NOT NULL,
	[item_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[list_price] [decimal](10, 2) NOT NULL,
	[discount] [decimal](4, 2) NOT NULL
);
-- bikestores db에서 데이터 그대로 가져와서 sales_order_items에 삽입
-- 테이블이 이미 존재하는 상태에서 가져와야함
insert into sales_order_items
select * from BikeStores.sales.order_items;


select * from sales_order_items;

-- update
select * from testTBL1;

update testTBL1
   set userName = '성수경',
	   age = 30;
 where id = 6; --조건문 없이 update 실행시 다 똑같은 데이터로 바뀜

 delete from testTBL1
  where id = 8;


select * from BikeStores.sales.customers
where last_name like 'S%' 
		and state = 'NY' 
		and phone is not null
order by first_name;
