select top 10
	concat(right(names,2),', ',left(names,1)) as �����̸�
	, levels
	, left(addr, 2) as ����
	, lower(email) as �̸���
from membertbl ;