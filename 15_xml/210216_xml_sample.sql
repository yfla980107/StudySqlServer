select u.userID, u.userName, u.birthYear, u.addr, u.height, b.prodName, b.price
  from usertbl as u
inner join buyTbl as b
	on u.userID = b.userID
 where height > 170
 for json auto; -- json으로 변환 또는 
 for xml auto; -- xml으로 변환