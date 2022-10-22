create database Example;
create table Employee(
eid int,
ename varchar(30)
);
select * from Employee;
insert into employee values(1,'mick');
insert into employee values(2,'micky'),(3,'ben');
delete from Employee where eid=2

create schema staff

create table staff.Registration(
rid int,
rname varchar(20)
)

create schema admin

use Example;

create table admin.Registration(
rid int,
rname varchar(20)
)


select coalesce(null,'sql',null,'server')

--case statement
--simple
--searched

create function Fn_Square(@a int)
returns int
as 
begin
	return @a*@a
end

select dbo.Fn_Square(4) 

create function Fn_datediff(@DateField Date)
returns int
as
begin
Declare @days int
Set @days=DATEDIFF(day,@DateField,GetDate())
return @days
end

create function Fn_EmpByID(@empid int)
returns table
as
return (select * from Employee where eid=@empid)

SELECT * FROM Fn_EmpByID(1);
create procedure sp_Emp
as
begin
select eid, count(ename) as Total from Employee group by eid
end

exec sp_Emp

