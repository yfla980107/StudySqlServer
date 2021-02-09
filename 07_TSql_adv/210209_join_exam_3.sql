
/*select * from stdTbl;
select * from clubTbl;
select * from clubRegTbl;
*/
-- Stander SQL (표준)
select s.id, s.stdName, c.clubName, c.buildingNum
  from stdTbl as s
  inner join clubRegTbl as r
	on s.id = r.std_id
  inner join clubTbl as c
	on r.club_id = c.id;

-- inner join 약식 (SQL Server T-SQL)
select s.id, s.stdName, c.clubName, c.buildingNum
  from stdTbl as s, clubRegTbl as r, clubTbl as c
 where s.id = r.std_id
   and r.club_id = c.id;