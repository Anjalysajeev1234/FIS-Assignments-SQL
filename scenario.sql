



create database scenario
use scenario
-- Question 1
create table book
(id int primary key,
title varchar(40),
author varchar(30),
isbn bigint unique,
published_date datetime
)
-- inserting values
insert into book values
(1,'My First SQL book','Mary Parker',981483029127,'2012-02-22 12:08:17')
insert into book values
(2,'My Second SQL book','John Mayer',857300923713,'1972-07-03 09:22:45'),
(3,'My Third SQL book','Cary Flint',523120967812,'2015-10-18 14:05:44')
-- details of books whose author name ends with er
select *  from book where author like '%er'

-- Question 2 --
--creating reviews table
create table tblreview
(
id int primary key,
book_id int references book(id),
reviewer_name varchar(30),
content varchar(50),
rating int ,
published_date datetime
)

insert into tblreview values
(1,1,'John Smith','My first review',4,'2017-12-10 05:50:11'),
(2,2,'John Smith','My second review',5,'2017-10-13 15:05:12'),
(3,3,'Alice Walker','Another review',1,'2017-10-22 23:47:10')
--title,author and reviewer name of all books
select title,author,reviewer_name from book join tblreview on book.id=book_id



-- Question 3--
--display reviwere name who submitted more than one review

select reviewer_name from book join tblreview on book.id=book_id group by reviewer_name having count(reviewer_name)>1

--Question 4--
--
create table customers
(custid int primary key,
name varchar(20),
age int,
address varchar(30),
salary decimal)


 insert into customers values
 (1,'Ramesh',32,'Ahmedabad',2000.00)
 insert into customers values
 (2,'Khilan',25,'Delhi',1500.00),
 (3,'Kaushik',23,'Kota',2000.00),
 (4,'Chaitali',25,'Mumbai',6500.00),
 (5,'Hardik',27,'Bhopal',8500.00),
 (6,'Komal',22,'MP',4500.00),
 (7,'Muffy',24,'Indore',10000.00)

select name from Customers
   where Address like '%o%'

----Question 5


 create table orders
(orderid int primary key,
date datetime,
cust_id  int references customers(custid),
amount int )

insert into orders
values(102,'2009-10-08 00:00:00',3,3000)
insert into orders
values(100,'2009-10-08 00:00:00',3,1500),
(101,'2009-11-20 00:00:00',2,1500),
(103,'2008-05-20 00:00:00',4,2060)

 
 --To select date and total number of people placed order on the same date
select date,count((date)) as Total_customers_on_date from orders join customers on custid=cust_id group by date 
---question 6
create table tblEmployee(
    empId int primary key,
	empName varchar(30),
	age int,
	empAddress varchar(30),
	salary float
)
select * from tblEmployee
insert into tblEmployee values(1,'Ramesh',32,'Ahmedabad',2000.00)
insert into tblEmployee values(2,'Khilan',25,'Delhi',1500.00),
(3,'Kaushik',23,'Kota',2000.00),
(4,'Chaitali',25,'Mumbai',6500.00),
(5,'Hardik',27,'Bhopal',8500.00),
(6,'Komal',22,'MP',null),
(7,'Muffy',24,'Indore',null)

--names of employees in lower case whose salary is null
select Lower(empName) from tblEmployee
   where salary is null



----question 7
create table Studentdetails
(RegisterNo int primary key,
Name varchar(20),
Age int,
qualification varchar(20),
MobileNo bigint,
Mail_id varchar(50),
Location varchar(50),
Gender char(2)
)

insert into Studentdetails 
values(2,'Sai',22,'B.E',9952836777,'Sai@gmail.com','Chennai','M')
insert into Studentdetails 
values(3,'Kumar',20,'B.SC',7890125648,'Kumar@gmail.com','Madurai','M'),
(4,'Selvi',22,'B.Tech',8904567342,'selvi@gmail.com','Selam','F'),
(5,'Nisha',25,'M.E',7834672310,'Nisha@gmail.com','Theni','F'),
(6,'SaiSaran',21,'B.A',7890345678,'saran@gmail.com','Madurai','F'),
(7,'Tom',23,'BCA',8901234675,'Tom@gmail.com','Pune','M')
--To display gender and total number of female and male employees in the relation
select Gender,COUNT(Gender) from Studentdetails group by gender

---------question 8

create table tblCourseDetails(
       cId varchar(20) primary key,
	   cName varchar(30),
	   startDate date,
	   endDate date,
	   fee float
)
select * from tblCourseDetails
insert into tblCourseDetails values('DN003','DotNet','2018-02-01','2018-02-28',15000),
('DV004','DataVisualization','2018-03-01','2018-04-15',15000),
('JA002','AdvancedJava','2018-01-02','2018-01-20',10000),
('JC001','CoreJava','2018-01-02','2018-01-12',3000)
create table tblCourseRegistration(
	registerNo int references StudentDetails(registerNo),
	cId varchar(20) references tblCourseDetails(cId),
	batch varchar(5)
	primary key(registerNo,cId)
)
select * from tblCourseRegistration
insert into tblCourseRegistration values(2,'DN003','FN'),
(3,'DV004','AN'),(4,'JA002','FN'),(2,'JA002','AN'),(5,'JC001','FN')
select cd.cId, cName, count(registerNo) as 'Student Count' from tblCourseDetails cd join tblCourseRegistration cr
   on cd.cId = cr.cId
   group by cName, cd.cId
   order by cd.cId desc


-----question 9
Create table Customer
(customer_id int primary key,
first_name varchar(20),
last_name varchar(20)
)

insert into customer values
(1,'George','Washington'),
(2,'John','Adams'),
(3,'Thomas','Jefferson'),
(4,'James','Madison'),
(5,'James','Monroe')

Create table Orderr
(order_id int primary key,
order_date date,
amount decimal,
customer_id int references customer(customer_id)
)

insert into Orderr values
(1,'07-04-1776','234.56',1)
insert into Orderr values
(2,'03-14-1760','78.50',3),
(3,'05-23-1784','124.00',2),
(4,'09-03-1790','56.50',3),
(5,'07-21-1795','25.50',1),
(6,'11-27-1787','14.40',3)

select first_name,last_name from Customer 
where customer_id=(select customer_id from orderr group by customer_id having COUNT(customer_id)=2)
                                          

----question 10

select Name, Upper(location) from StudentDetails
   order by Name desc

----question 11
--create a view table to display Productname,ordered quantity,and ordernumber
/*
create view simpleview
as
(select p.productname,i.quantity,o.id
from product as p
left join orderitem as i
on p.id=i.productid
left join  order as o
on p.orderid=o.id)  

select * from simpleview
*/

------Question 12 
---Course name registered by Nisha
select Name, cName
   from StudentDetails sd join tblCourseRegistration cr
   on cr.registerNo = sd.registerNo
   join tblCourseDetails cd
   on cd.cId = cr.cId
   where Name ='Nisha'
