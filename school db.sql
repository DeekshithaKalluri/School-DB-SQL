use master

--DB
create database School

--find out schema of db
sp_helpdb 'School'

--change the db context
use School

--CourseMaster
create table CourseMaster
(
	CID			int				Primary Key,
	CourseName	Varchar (40)	NOT NULL,
	Category	Char(1)			NULL check(Category = 'B' or Category = 'M' or Category = 'A'),
	Fee			Smallmoney		NOT NULL check(Fee > 0),	
)
--schema of the table
sp_help CourseMaster
sp_help StudentMaster
sp_help EnrollmentMaster

--read the data
select * from CourseMaster
select * from StudentMaster
select * from EnrollmentMaster

--insert data
insert into CourseMaster values (10, 'Java', 'B', 5000)
insert into CourseMaster values (20, 'Adv Java', 'A', 25000)
insert into CourseMaster values (30, 'Big Data', 'A', 40000)
insert into CourseMaster values (40, 'SQL Server', 'M', 20000)
insert into CourseMaster values (50, 'Oracle', 'M', 15000)
insert into CourseMaster values (60, 'Python', 'M', 15000)
insert into CourseMaster values (70, 'MSBI', 'A', 35000)
insert into CourseMaster values (80, 'Data Science', 'A', 90000)

--StudentMaster
create table StudentMaster
(
	SID			TinyInt				Primary Key,
	Name		Varchar(40)			NOT NULL,
	Origin		Char(1)				NOT NULL check(Origin = 'L' or Origin = 'F'),
	Type		Char(1)				NOT NULL check(Type = 'U' or Type = 'G'),
)

--insert data
insert into StudentMaster values (1, 'Bilen Haile', 'F', 'G')
insert into StudentMaster values (2, 'Durga Prasad', 'L', 'U')
insert into StudentMaster values (3, 'Geni', 'F', 'u')
insert into StudentMaster values (4, 'Gopi Krishna', 'L', 'G')
insert into StudentMaster values (5, 'Hemanth', 'L', 'G')
insert into StudentMaster values (6, 'K Nithish', 'L', 'G')
insert into StudentMaster values (7, 'Manisha', 'L', 'U')

--EnrollmentMaster
create table EnrollmentMaster
(
	CID			int					NOT NULL Foreign Key References CourseMaster(CID),
	SID			Tinyint				NOT NULL Foreign Key references StudentMaster(SID),
	DOE			DateTime			NOT NULL,
	FWF			Bit					NOT NULL,
	Grade		Char(1)				NULL check(Grade in ('O', 'A', 'B', 'C')),
)

--insert data
insert into EnrollmentMaster values (40, 1, '2020/11/19', 0, 'O')
insert into EnrollmentMaster values (70, 1, '2020/11/21', 0, 'A')
insert into EnrollmentMaster values (10, 2, '2020/11/22', 1, 'O')
insert into EnrollmentMaster values (20, 1, '2020/11/19', 0, 'O')


