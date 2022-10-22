create database task2
use task2

create function Fn_Square(@a int)
returns int
as
begin
	return @a * @a
end

--call the function
select dbo.Fn_Square(4) as Result



