use sqlDB;
go

 -- �̸��� ���ȣ�� ��� ��ȸ
  select * from userTbl
   where userName = '���ȣ';

 -- 1970�� ���� ����̰� Ű 182 �̻��� ��� ���̵�, �̸��� ��ȸ
  select userID, userName, height
	from userTbl
   where birthYear >= 1970
	and height >= 182;

 -- 1970�� ���� ����̰ų� Ű�� 182�̻��̰ų� �� ����� ���
  select userID, userName, height
	from userTbl
   where birthYear >= 1970
	or height >= 182;

 -- Ű�� 180~183�� ����� ��ȸ
  select userID, userName, height
	from userTbl
   where height >= 180
	 and height <= 183;

 -- between ~ and
  select userID, userName, height
	from userTbl
   where height between 180 and 183;

 -- ������ �泲, ����, ���
  select userID, userName, addr
	from userTbl
   where addr = '�泲'
	  or addr = '����'
	  or addr = '���';

  select userID, userName, addr
	from userTbl
   where addr in ('�泲', '����', '���');

 -- like
  select userID, userName, addr
	from userTbl
   where userName like '��%';

  select userID, userName, addr
	from userTbl
   where userName like '_����';

 -- SUBQUERY
  select userName, height
	from userTbl
   where height > 177;

  select userName, height --��������
	from userTbl
   where height > 
		 (select height from userTbl where userName = '���ȣ');

  select userName, height -- any ������ ����� �ϳ��� ����(and ���)
	from userTbl
   where height >= any
		 (select height from userTbl where addr = '�泲');

  select userName, height -- all ������ ����� ��� ���� (or�� ���)
	from userTbl
   where height >= all
		 (select height from userTbl where addr = '�泲');

  select userName, height -- ������������ in ��밡��
	from userTbl
   where height in
		 (select height from userTbl where addr = '�泲');


 -- order by ���� 
  select userName, mDate
	from userTbl
order by mDate asc;  -- �⺻���� (asc)��������=��������, (desc)��������

  select *
	from userTbl
order by userID desc;

 -- distinct �ߺ���
  select distinct addr
	from userTbl;

  select top(5) * -- top ���� ������ 5���� ���
	from userTbl
order by mDate desc;

 -- offset �ռ� ������ŭ �پ���� �� ��ȸ
  select userID, userName, birthYear
	from userTbl
order by birthYear
  offset 4 rows;

 -- ���� (�̹� �ִ� ���̺� �ϸ� �ȵ�, ���̺���� �� ���� ���� ��, PK�� ���� �ȵ�)
 select * into buyTbl2 from buyTbl;
 select userID, prodName into buyTbl3 from buyTbl;

-- GROUP BY
  select * from buyTbl;

  select userID, amount
	from buyTbl
order by userID;

  select userID, sum(amount) as '�հ�' -- �����Լ��� ���ڵ����͸� ����
	from buyTbl
group by userID;

 -- min, max
  select min(height) as '����Ű'
	from userTbl;

  select max(height) as 'ūŰ'
	from userTbl;

 -- �����Լ� + �ٸ��÷����� ����� ��� group by ���
  select userID, userName, min(height) as '����Ű', max(height) as 'ūŰ'
	from userTbl
group by userID, userName;

  select userID, userName, height -- Ű�� ���� ū ����� ���� ���� ��� ���
	from userTbl
   where height = (select min(height) from userTbl)
	  or height = (select max(height) from userTbl)

 -- �� ������ ����
 select COUNT(*) as 'ȸ����' from userTbl; -- 10
 select COUNT(*) as '���ų�����'from buyTbl; -- 12

  -- �߸��� ���͸�
  select userID, sum(price * amount) as '��ü ���űݾ�'
	from buyTbl

 -- where sum(price * amount) > 1000
group by userID
  having sum(price * amount) > 1000
order by sum(price * amount) desc;

 -- rollup / cube
  select num, groupName, sum(price * amount) as '���űݾ�',
		GROUPING_ID(groupName, num)
	from buyTbl
group by rollup(groupName,num);

 -- userID, groupName ������ cube ������ �հ�
  select userID, groupName, sum(price * amount) as '���űݾ�'
	from buyTbl
group by cube(groupName, userID);

  select userID, sum(price * amount) as '���űݾ�'
	from buyTbl
group by rollup(userID);

  select groupName, sum(price * amount) as '���űݾ�'
	from buyTbl
group by cube(groupName);


 --without CTE
  select userID, sum(price * amount) as 'total'
	from buyTbl
group by userID
order by sum(price * amount) desc;

 --with CTE
with cte_tmp(userID, total)
as
( select userID, sum(price * amount) as 'total'
	from buyTbl
group by userID )
select * from cte_tmp order by total desc;