select 
  idx as Idx
, concat('제목 :  ', names) as Names
, concat('저자 > ', Author) as Author
, format(ReleaseDate, 'yyyy년 MM월 dd일')  as 출판일
, isbn as ISBN
, format(price, '#,#원') as 가격
from bookstbl
order by idx desc;