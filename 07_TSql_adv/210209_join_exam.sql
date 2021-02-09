select * from userTbl;
select * from buyTbl;

select * from userTbl where userID = 'JYP';
select * from buyTbl where userID = 'JYP';

select * from buyTbl where userID = 'BBK';

-- INNER JOIN
select *
  from buyTbl
  inner join userTbl
	on buyTbl.userID = userTbl.userID
 where buyTbl.userID = 'JYP';

select u.userName, u.addr,
	   concat(u.mobile1, '-', left(u.mobile2, 4), '-', right(u.mobile2, 4)) as mobile,
	   b.prodName, b.price, b.amount
  from buyTbl as b -- as로 테이블명을 쉬운별명으로 바꿈
  inner join userTbl as u -- as로 테이블명을 쉬운별명으로 바꿈
	on b.userID = u.userID
 where b.userID = 'JYP';