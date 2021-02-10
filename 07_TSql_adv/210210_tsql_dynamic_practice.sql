declare @curDate date;
declare @curYear varchar(4), @curMonth varchar(2), @curDay varchar(2);
declare @sql varchar(2000);

set @curDate = GETDATE();
set @curYear = year(@curDate);
set @curMonth = MONTH(@curDate);
set @curDay = day(@curDate);

print @curyear;
print replicate('0', 2 - len(@curMonth)) + @curMonth;
print right(('00' + @curMonth), 2);
print @curDay;

print format(@curDate, 'yyyy-MM-dd'); --제일 쉬운방법

set @sql = 'create table backup_' + format(@curdate, 'yyyy_MM_dd');
set @sql += ' (id int not null primary key, bNam nvarchar(100) not null); ';
print @sql;
exec(@sql); --동적쿼리 (계속 새로운 날짜의 테이블 생성)