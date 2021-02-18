select m.Names
	 , m.levels as Levels
	 , m.addr as Addr
	 , r.rentalDate
 from membertbl as m
left outer join rentaltbl as r
   on m.idx = r.memberIdx
where r.rentalDate is null;