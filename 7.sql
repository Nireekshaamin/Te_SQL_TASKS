create database TE_API_Angular
use TE_API_Angular

create table Registration(
id int primary key Identity(1,1),
username varchar(25),
useremail varchar(40),
password varchar(25),
mobile varchar(25)
)

insert into Registration values(1,'john','john@gmail.com','john123','9898989890');

select * from registration
set identity_insert Registration on