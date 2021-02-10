-- Union (중복값 생략)
select clubName as bName, buildingNum as bLocation from clubTbl
union
select stdName, region from stdTbl;

--union all (중복값 같이 보여줌)
select stdName, region from stdTbl
intersect --union all
select stdName, region from stdTbl;