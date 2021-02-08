/*
SELECT memberID, memberName, memberAddress
  FROM memberTBL
 WHERE memberID LIKE 'H%';
 */
-- SELECT '1';

--USE BikeStores;

--SELECT * FROM sales.customers;

--SELECT * FROM production.products;

-- DB조회
EXEC sp_helpdb;

-- 테이블 조회
exec sp_tables @table_type = "'TABLE'";

-- 열이름 조회
EXEC sp_columns @table_name ='stocks',
				        @table_owner = 'production';