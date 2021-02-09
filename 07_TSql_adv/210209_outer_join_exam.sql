-- 테이블 3개 OUTER JOIN
select * 
  from stdTbl as s
  left outer join clubRegTbl as r
	on s.id = r.std_id
 full outer join clubTbl as c
	on r.club_id = c.id;

select * 
  from stdTbl as s
  left outer join clubRegTbl as r
	on s.id = r.std_id

select * 
  from clubRegTbl as r
  right outer join clubTbl as c
    on r.club_id = c.id;