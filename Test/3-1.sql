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