use Task


create table Employee(
emp_id int primary key identity(1,1),
emp_name varchar(50),
dob date,
salary int,
bonus int);

select * from EmpView;

create table Department(
d_id int primary key,
dname varchar(50),
emp_id int,
foreign key (emp_id) references Employee(emp_id) on delete cascade);

insert into Department values(101,'IT',4),(102,'Banking',5);

insert into Employee values('Ben','1991-07-09',40000,10000),('Cal','1998-02-19',46000,5000),('Mick','1995-03-12',30000,5000),('Grace','1992-11-11',50000,12000);
create function Fn_datedifference(@DateField Date)
returns int
as
begin
	Declare @year int --declaration of the table variable
	Set @year=datediff(year,@DateField,Getdate()) --assigning the difference in days to @days
	return @year
end

create function Fn_totalSalary(@x int, @y int)
returns int
as
begin
	return @x+@y
end

select emp_id, emp_name, dbo.Fn_datedifference(dob) as 'age', dbo.Fn_totalSalary(salary,bonus)as 'total' from Employee;


create table cgpa(
s_id int primary key identity(1,1),
s_name varchar(50),
totalSubject_credit int,
totalMarks int);
insert into cgpa values('Alice',41,274),('Olive',41,300);


create function Fn_cgpa(@credit int, @t_marks int)
returns int
as
begin
	return (@t_marks/@credit)
end

select s_id, s_name,  dbo.Fn_cgpa(totalSubject_credit,(totalMarks)) as 'cgpa' from cgpa;


--Procedure with Output Parameter - OUTPUT keyword

create procedure sp_TotalSalary(@totalsal int OUTPUT)
as
Begin
	Select @totalsal=sum(salary) from Employee
End

Declare @Result int
exec sp_TotalSalary @Result OUTPUT --OUPUT is mandatory
Print @Result


create trigger triggerDML2
ON Employee
FOR INSERT, UPDATE, DELETE
AS
BEGIN
  IF DATEPART(HH,GETDATE()) >18 AND DATEPART(HH,GETDATE()) <10
  BEGIN
    PRINT 'INVALID TIME'
    ROLLBACK TRANSACTION
  END 
END

insert into Employee values('Angelina','1991-05-29',40000,10000)

create trigger allDbTrigger
on ALL Server
For Create_Table,Alter_Table,Drop_Table
as
Begin
	Print 'You cannot perform DDL on any Database'
	Rollback Transaction
End

disable trigger allDbTrigger on all server

use Task

create table School(
student_id int,
student_name varchar(50)
);



-- SAVEPOINT - SAVE TRANSACTION
BEGIN TRANSACTION
	insert into cgpa values('jared',41,312);
	SAVE TRANSACTION insert_stmt
	delete from cgpa where s_id=2;
	ROLLBACK TRANSACTION insert_stmt
COMMIT TRANSACTION


BEGIN TRANSACTION
	insert into cgpa values('vicky',41,304);
	update cgpa set s_name='bob' where s_id=6;
	--SAVEPOINT
	SAVE TRANSACTION insertupdate_stmt
	delete from cgpa where s_id=5;
	ROLLBACK TRANSACTION insertupdate_stmt
COMMIT TRANSACTION


select * from cgpa


create procedure sp_DivideByZero4
@n1 int,
@n2 int
as
BEGIN	
	Declare @res int
	SET @res = 0
	IF(@n2=0)
	BEGIN
		THROW 50001,'First number cannot be divided by zero',1
	END
	ELSE
	BEGIN
		SET @res=@n1/@n2
		PRINT 'Value is:' + CAST(@res as varchar)
	END
END

exec sp_DivideByZero4 3,0
create database task4
use task4


create synonym emp for Employee

select * from emp
select * from Employee

Select * from sys.synonyms 

create view EmpView
as
select * from Employee where salary>40000;
select * from EmpView

--insert
insert into EmpView values('Zeke','1990-06-07',70000,10000)
select * from EmpView

--update
update EmpView set salary=55000 where emp_id=4
select * from EmpView

--delete
delete from EmpView where emp_id=2
select * from EmpView



select e.emp_id,e.emp_name, d.dname
from Employee as e inner join Department as d on e.emp_id=d.emp_id;

create view EmpDeptView
as
select e.emp_id,e.emp_name, d.dname
from Employee as e inner join Department as d on e.emp_id=d.emp_id;

select * from EmpDeptView;

--insert 
insert into EmpDeptView values(6,'vinu','IT')

--update 
update EmpDeptView set emp_name='sunny' where emp_id=4;

--delete 
delete from EmpDeptView where emp_id=5

CREATE TABLE students (  
    studID varchar(10),  
    rollNo int,  
    Name varchar(30)  
);  

INSERT INTO students(rollNo, Name) VALUES(87459, 'Rose'),(54786, 'Jack'),(54788, 'Sam'),(54796, 'Sanvi'),(54886, 'Vance');  \


create clustered index ind_ID on students(studID)

create index ind_SName on students(Name)

select * from students WHERE studID=102

select * from students WHERE Name='Rose'

select studID, Name, len(Name) as 'Name length' from students
select studID, Name, lower(Name) as 'Name in lower' from students
select studID, Name, upper(Name) as 'Name in upper' from students
select studID, Name, substring(Name,1,2) as 'sub name' from students
select studID, Name, Reverse(Name) as 'Name length' from students


select * from Employee
select sum(salary) as 'total' from Employee 
select avg(salary) as 'average' from Employee 
select count(salary) as 'total number' from Employee 
select min(salary) as 'min salary' from Employee  
select max(salary) as 'max salary' from Employee 
select square(salary) as 'square' from Employee 

SELECT CURRENT_TIMESTAMP as 'date';
SELECT DATEADD(year, 1, '2017/08/25') AS DateAdd;
SELECT DATEDIFF(year, '2017/08/25', '2011/08/25') AS DateDiff;
SELECT GETDATE() as 'todays date';
SELECT DAY('2017/08/25') AS DayOfMonth;
SELECT MONTH('2017/08/25') AS Month;
SELECT YEAR('2017/08/25') AS Year;




CREATE SEQUENCE studseq
AS INT  
START WITH 101  
INCREMENT BY 1; 

update students set studID=next value for studseq 