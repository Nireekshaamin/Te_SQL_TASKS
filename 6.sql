create database Task;
use Task;
create table salesman(
salesman_id int primary key,
name varchar(50),
city varchar(50),
commision float );

create table customer(
customer_id int primary key,
cust_name varchar(50),
city varchar(50),
grade int,
salesman_id int,
foreign key (salesman_id) references salesman(salesman_id) on delete cascade);

create table orders(
ord_no int primary key,
purch_amt int,
ord_date date,
customer_id int,
salesman_id int,
foreign key (customer_id) references customer(customer_id) on delete no action on update no action,
foreign key (salesman_id) references salesman(salesman_id) on delete no action on update no action);

insert into salesman values(5001,'James Hoog','New York',0.15),
(5002,'Nail Knite','Paris',0.13),
(5005,'Pit Alex','London',0.11),
(5006,'Mc Lyon','Paris',0.14),
(5007,'Paul Adam','Rome',0.13),
(5003,'Lauson Hen','San Jose',0.12);

insert into customer values(3002,'Nick Rimando','New York',100,5001),
(3007,'Brad Devis','New York',200,5001),
(3005,'Graham Zusi','California',200,5002),
(3008,'Julian Green','London',300,5002),
(3004,'Fabian Johnson','Paris',300,5006),
(3009,'Geoff Cameron','Berlin',100,5003),
(3003,'Jozy Altidor','Moscow',200,5007),
(3001,'Ben Stone','London',100,5005);



insert into orders values(70001,150.5,'2012-10-05',3005,5002);
insert into orders values(70009,270.65,'2012-09-10',3001,5005);
insert into orders values(70002,65.26,'2012-10-05',3002,5001);
insert into orders values(70004,110.5,'2012-08-17',3009,5003),
(70007,948.5,'2012-09-10',3005,5002),
(70005,2400.6,'2012-07-27',3007,5001),
(70008,5760,'2012-09-10',3002,5001);


alter table orders alter column purch_amt float(53);

create view salesperson2 as select salesman_id, name, city from salesman where city = 'New York';
create view allsalesperson as select salesman_id, name, city from salesman;
create view totalsalesperson as select city, count(salesman_id)  as 'number of salespersons' from salesman group by city;
create view CustomerGrade as select grade, count(customer_id) as Customer from customer group by grade;
 create view Alldetails1 as select orders.ord_no,orders.purch_amt, salesman.salesman_id, salesman.name, customer.cust_name from ((salesman 
inner join customer on salesman.salesman_id=customer.salesman_id)
inner join orders on salesman.salesman_id=orders.salesman_id);

select * from salesperson2;
select * from allsalesperson;
select * from totalsalesperson;
select * from CustomerGrade;
select * from Alldetails1;

