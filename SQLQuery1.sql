--create a database
create database college

--fing of the db
sp_helpdb 'college'

--use which database for next given commanda
use college

--create a table
create table Dept
(
	DeptID    int     primary key,
	DeptName  varchar(100) not null
)

--find schema of the table
sp_help Dept

-----------------------------------
(
	ColName datatype primary key identity(seed, incr),
	ColName datatype null,
	ColName datatype not null,
	ColName datatype null default(value),
	ColName datatype not null check(expression),
	ColName datatype null foreign key references PKTableName(PKColName),
)
------------------------------------
--see the table data
select * from Dept

--insert data into tables
--insert into (tablename) values (v1,v2,...)
insert into Dept values  (10, 'Sales')
insert into Dept values  (20, 'Purchase')
insert into Dept values  (30, 'Technical')
insert into Dept values  (40, 'Accounts')
insert into Dept values  (50, 'Security'), (60, 'Audit')

--Delete all rows from the table(gone forever)
delete from dept

--Delete a row from the table
--delete from (tablename) where (condition)
delete from dept where DeptID <= 30
delete from dept where DeptName = Purchase

--see data
select * from Dept

--update/modify the data
/*update tablename
set colname = 'new value'
where condition */
update dept
set DeptName = 'Auditing'
where DeptID = 60

update dept
set DeptName = ''  --for blank cell
where DeptID = 50

--update all rows
update dept
set DeptName = 'Tech - R and D'

--TCL Command
/*begin Tran
...code
commit or rollback */
--once commit cannot rollback again
begin Tran
	update dept set DeptName = 'Tech - R and D'
rollback

--delete all rows(we can get data back after deleting)
begin Tran
	delete from dept
rollback

--indert a row
begin Tran
	insert into Dept values (70, 'aaa')
	update Dept set DeptName = 'abc' where DeptID = 10
	insert into Dept values (80, 'bbb')
commit

--read data
select * from Emp

--Emp
create table Emp
(
	eid				int				primary key,
	Emp_name		varchar(100)	not null,
	salary			money			not null check(salary > 0),
	gender			char(1)			not null check(gender = 'M' or gender = 'F'),
	dob				datetime		not null,
	PhoneNo			char(10)		null unique,
	EmailID			varchar(50)		null unique,
	PassportNo		char(10)		not null unique,
	DeptID			int				null foreign key references Dept(DeptID),
)

--find schema/meta data
sp_help 'Emp'

--delete the table 
drop table emp

--insert the data
insert into Emp values  (1, 'Durga Prasad', 1000, 'M', '1990/10/21', '8136789043', 'prasad.p@gmail.com', 'A67127', 30)
insert into Emp values  (2, 'Bhaskar Jogi', 11000, 'M', '1990/11/22', '8136789044', 'bhaskarjogi@gmail.com', 'A899a7', 10)











