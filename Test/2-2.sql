select 
  idx as Idx
, concat('���� :  ', names) as Names
, concat('���� > ', Author) as Author
, format(ReleaseDate, 'yyyy�� MM�� dd��')  as ������
, isbn as ISBN
, format(price, '#,#��') as ����
from bookstbl
order by idx desc;