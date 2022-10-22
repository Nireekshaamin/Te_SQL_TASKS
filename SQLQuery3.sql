CREATE DATABASE TE_Core_MVC
USE TE_Core_MVC
CREATE TABLE Trainees(
TID int primary key,
TName varchar(25),
TAge int check(TAge >=22)
);
select * from Trainees;
create database TE_API
use TE_API
CREATE TABLE Trainees(
TID int primary key,
TName varchar(25),
TAge int check(TAge >=22)
);
INSERT INTO Trainees values(1,'Cal',25);