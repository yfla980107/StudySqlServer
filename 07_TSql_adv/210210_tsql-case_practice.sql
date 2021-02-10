use sqlDB;
go

select u.userID, 
	   u.userName,
	   iif(sum(price * amount)is null, 0, sum(price * amount)) as '총 구매금액',
	   case
	    when (sum(price * amount) >= 1500) then 'VVIP'
		when (sum(price * amount) >= 1000) then 'VIP'
		when (sum(price * amount) >= 1) then 'Person'
		else 'Ghost'
	   end as '고객레벨' --case문은 별칭 정할때 여기서 as
  from buyTbl as b
 right outer join userTbl as u 
	on b.userID = u.userID 
 group by u.userID, u.userName
 order by sum(price * amount) desc;

  /*left 할 경우 buytbl 기준이 되는데 물건을 산 적 없는 사람은 안나옴
	right 할 경우 userTbl기준 select,그룹바이에서 u.userid랑 b.userid 기준이 다름 
	u로 할경우 유저테이블이니까 명단이 다 나오고 
	b로 할경우 물건을 사지 않은 사람명단은 나오지 않음*/

select *
  from userTbl;