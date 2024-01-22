use college

create table Product
(
	PID			int				primary key			identity(1,1),
	ProdName	varchar(100)	not null,
	Qty			int				null	default(0),
	UnitPrice	money			not null,
)

--find schema of the table
sp_help Product

--read
select * from Product

--delete/drop total table
drop table Product

--implicit insert
insert into Product values('Pen', 1000, 10)
insert into Product values('Pencil', 2000, 7)
insert into Product values('Lux', 450, 44)
insert into Product values('Dove', 120, 61)
insert into Product values('Cadbury', 300, 24)

--no default value
insert into Product values('Liril', null, 45)

--default value
insert into Product values('Rin', '', 30)

--explicit insert
insert into Product(ProdName,UnitPrice) values('HP Lapppy', 1000)
insert into Product(UnitPrice,ProdName) values(400, 'Apple iphone 12 pro')

--Last inserted identity value
select @@IDENTITY

--delete all rows(previous data colms number not used/inserted again)
delete from Product --or		--- logged operation--->like you log into some website to know u used it
delete from Product where PID = 13

--delete all rows using TRUNCATE command(you can use/insert previous colmns numbers)
Truncate table Product			--- non-logged operation--->like you do not log into some website, so u don't know u used it

--add col to the table 
/*
alter table tablename
add colname datatype
*/
alter table Product
add Rating tinyint

--update the data
update Product
set Rating = 2
where PID >= 1

--drop a col from the table
alter table Product
drop column Rating

--drop a CONSTRAINT
alter table Product
drop constraint DF__Product__Qty__44FF419A

--drop a constraint(after dropping the constraint) col from the table
alter table Product
drop column Qty


