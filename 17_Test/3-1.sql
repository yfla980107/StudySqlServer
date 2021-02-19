select 
		b.idx as '번호'
	  , d.Division as '장르번호'
	  , d.Names as '장르'
	  , b.names as '책제목'
	  , b.author as '저자'
from bookstbl as b
inner join divtbl as d
on b.Division = d.Division
where d.Names = '로맨스' ;