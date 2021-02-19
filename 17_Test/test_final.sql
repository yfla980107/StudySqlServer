--������

-- 1-1����
select lower(email) as email, mobile, names, addr
  from membertbl
order by names desc;

-- 1-2����
select names, author, releaseDate, price
  from bookstbl;

-- 2-1����
select top 10
	concat(right(names,2),', ',left(names,1)) as �����̸�
	, levels
	, left(addr, 2) as ����
	, lower(email) as �̸���
from membertbl ;

-- 2-2����
select 
  idx as Idx
, concat('���� :  ', names) as Names
, concat('���� > ', Author) as Author
, format(ReleaseDate, 'yyyy�� MM�� dd��')  as ������
, isbn as ISBN
, format(price, '#,#��') as ����
from bookstbl
order by idx desc;

-- 3-1����
select 
		b.idx as '��ȣ'
	  , d.Division as '�帣��ȣ'
	  , d.Names as '�帣'
	  , b.names as 'å����'
	  , b.author as '����'
from bookstbl as b
inner join divtbl as d
on b.Division = d.Division
where d.Names = '�θǽ�' ;

-- 3-2����
select m.Names
	 , m.levels as Levels
	 , m.addr as Addr
	 , r.rentalDate
 from membertbl as m
left outer join rentaltbl as r
   on m.idx = r.memberIdx
where r.rentalDate is null;

-- 4-1����
insert into divtbl
	values(
		'I002',
		'�ڱⰳ�߼�'
	      );

-- 4-2����
update membertbl
   set Addr = '�λ�� �ؿ�뱸',
		mobile = '010-6683-7732'
 where Names = '�����';


--5�� ����
select d.names, sum(b.price) as ���հ�ݾ�
  from divtbl as d
inner join bookstbl as b
	on d.division = b.Division
 where d.Names not in (('�ڱⰳ�߼�'),('���α׷���'))
group by rollup(d.Names);