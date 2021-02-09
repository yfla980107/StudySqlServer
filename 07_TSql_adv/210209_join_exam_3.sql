
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

-- inner join (내부 조인) 약식 (SQL Server T-SQL)
select s.id, s.stdName, c.clubName, c.buildingNum
  from stdTbl as s, clubRegTbl as r, clubTbl as c
 where s.id = r.std_id
   and r.club_id = c.id;

-- outer join (외부 조인)
select s.id, s.stdName, c.clubName, c.buildingNum
  from stdTbl as s
 left outer join clubRegTbl as r
	on s.id = r.std_id
 left outer join clubTbl as c
	on r.club_id = c.id;

-- userTBL / buyTBL
select u.userName, u.addr, b.prodName, b.price
  from userTbl as u
  right outer join buyTbl as b
    on u.userID = b.userID;

select * from buyTbl;