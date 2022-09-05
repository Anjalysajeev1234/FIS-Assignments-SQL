create database assignment2
use assignment2

create table EMP
(
empno int primary key,
ename varchar(20),
job varchar(20),
mgr_id int,
hiredate date,
sal int,
comm int,
deptno int ,
foreign key(deptno) references DEPT(deptno)
)
-----creating DB DEPT-----
DEPT(deptno, dname, loc) 
create table DEPT
(deptno int primary key,
dname varchar(20),
loc varchar(30)
)
--inserting values into DEPT-----
DEPT 
DEPTNO  DNAME        LOC 
10     ACCOUNTING    NEW YORK 
20     RESEARCH      DALLAS 
30     SALES         CHICAGO 
40     OPERATIONS    BOSTON 
insert into DEPT values
(10,'ACCOUNTING','NEW YORK'),
(20,'RESEARCH','DALLAS'),
(30,'SALES','CHICAGO'),
(40,'OPERATIONS','BOSTON')

-- inserting value into EMP



INSERT INTO `assignment2`.`emp` (`empno`, `ename`, `job`, `mgr_id`, `hiredate`, `sal`, `deptno`) VALUES ('7369', 'SMITH', 'CLERK', '7902', '1980-12-17', '800', '20');
INSERT INTO `assignment2`.`emp` (`empno`, `ename`, `job`, `mgr_id`, `hiredate`, `sal`, `comm`, `deptno`) VALUES ('7499', 'ALLEN', 'SALESMAN', '7698', '1981-02-20', '1600', '300', '30');
INSERT INTO `assignment2`.`emp` (`empno`, `ename`, `job`, `mgr_id`, `hiredate`, `sal`, `comm`, `deptno`) VALUES ('7521', 'WARD', 'SALESMAN', '7698', '1981-02-22 ', '1250', '500', '30');
INSERT INTO `assignment2`.`emp` (`empno`, `ename`, `job`, `mgr_id`, `hiredate`, `sal`, `deptno`) VALUES ('7566', 'JONES', 'MANAGER', '7839', '1981-04-02', '2975', '20');
INSERT INTO `assignment2`.`emp` (`empno`, `ename`, `job`, `mgr_id`, `hiredate`, `sal`, `comm`, `deptno`) VALUES ('7654', 'MARTIN', 'SALESMAN', '7698', '1981-09-28 ', '1250', '1400', '30');
INSERT INTO `assignment2`.`emp` (`empno`, `ename`, `job`, `mgr_id`, `hiredate`, `sal`, `deptno`) VALUES ('7698', 'BLAKE', 'MANAGER', '7839', '1981-05-01', '2850', '30');
INSERT INTO `assignment2`.`emp` (`empno`, `ename`, `job`, `mgr_id`, `hiredate`, `sal`, `deptno`) VALUES ('7782', 'CLARK', 'MANAGER', '7839', '1981-06-09', '2450', '10');
INSERT INTO `assignment2`.`emp` (`empno`, `ename`, `job`, `mgr_id`, `hiredate`, `sal`, `deptno`) VALUES ('7788', 'SCOTT', 'ANALYST', '7566', '1987-04-19', '3000', '20');
INSERT INTO `assignment2`.`emp` (`empno`, `ename`, `job`, `hiredate`, `sal`, `deptno`) VALUES ('7839', 'KING', 'PRESIDENT', '1981-11-17', '5000', '30');
INSERT INTO `assignment2`.`emp` (`empno`, `ename`, `job`, `mgr_id`, `hiredate`, `sal`, `comm`, `deptno`) VALUES ('7844', 'TURNER', 'SALESMAN', '7698', '1981-09-08', '1500', '0', '20');
INSERT INTO `assignment2`.`emp` (`empno`, `ename`, `job`, `mgr_id`, `hiredate`, `sal`, `deptno`) VALUES ('7876', 'ADAMS', 'CLERK', '7788', '1987-05-23', '1100', '30');
INSERT INTO `assignment2`.`emp` (`empno`, `ename`, `job`, `mgr_id`, `hiredate`, `sal`, `deptno`) VALUES ('7900', 'JAMES', 'CLERK', '7698', '1981-12-03', '950', '20');
INSERT INTO `assignment2`.`emp` (`empno`, `ename`, `job`, `mgr_id`, `hiredate`, `sal`, `deptno`) VALUES ('7902', 'FORD', 'ANALYST', '7566', '1981-12-03', '3000', '10');
INSERT INTO `assignment2`.`emp` (`empno`, `ename`, `job`, `mgr_id`, `hiredate`, `sal`, `deptno`) VALUES ('7934', 'MILLER', 'CLERK', '7782', '1982-01-23', '1300', '10');




-- set 2 ------
-- 1. Retrieve a list of MANAGERS. 
select  distinct m1.ename as manager from emp e1 inner join emp m1 on e1.mgr_id=m1.empno
-- 2.Find out the names and salaries of all employees earning more than 1000 per month
select * from emp

-- 3. Display the names and salaries of all employees except JAMES. 
select ename,sal from emp where not(ename='JAMES')
-- 4.Find out the details of employees whose names begin with ‘S’. 
select * from emp where ename like 'S%'
-- 5. Find out the names of all employees that have ‘A’ anywhere in their name.
select ename from emp where ename like '%A%'
--  6.Find out the names of all employees that have ‘L’ as their third character in their name.
select ename from emp where ename like '__L%'
-- 7. Compute daily salary of JONES.
select (sal)/30 as Daily_salary from emp where ename='JONES'
-- 8. Calculate the total monthly salary of all employees. 
select  sum(sal) as Total_Monthly_salary from emp 
-- 9. Print the average annual salary .
select avg( 12*(sal)) from emp
-- 10. Select the name, job, salary, department number of all employees except SALESMAN from department number 30. 
select ename,job,sal ,deptno from emp where not (job='SALESMAN' and deptno=30)

-- 11.  List unique departments of the EMP table. 
select distinct(d1.dname) as distict_departments from dept d1 inner join emp e1 on d1.deptno=e1.deptno

/* 12. List the name and salary of employees who earn more than 1500 and are in department 10 or 30.
 Label the columns Employee and Monthly Salary respectively. */
 select ename ,sal from emp where sal > 1500 and deptno in (10,20)
 /* 13. Display the name, job, and salary of all the employees whose job is MANAGER or 
ANALYST and their salary is not equal to 1000, 3000, or 5000. */
select ename, job, sal from emp where not(sal in (1000,3000,5000)) and job='MANAGER'
/* (14.)Display the name, salary and commission for all employees whose commission 
amount is greater than their salary increased by 10%. */
select ename,sal,comm from emp where comm>(sal+(sal)*0.1)
/*  15. Display the name of all employees who have two Ls in their name and are in 
department 30 or their manager is 7782. */
select ename from emp where (ename like '%L%L%' and deptno=30 ) or (mgr_id=7782)
/* 16. Display the names of employees with experience of over 10 years and under 20 yrs.
 Count the total number of employees.*/
 select ename from emp where extract(year from curdate())-extract(year from hiredate ) >10 and 
 extract(year from curdate())-extract(year from hiredate ) <20
 
select count(ename) from emp where extract(year from curdate())-extract(year from hiredate ) >10 and 
 extract(year from curdate())-extract(year from hiredate ) <20
 /* 17.Retrieve the names of departments in ascending order and their employees in 
descending order. */
select d1.dname as Department_name ,e1.ename as Employee_name 
from dept d1 left join emp e1    on d1.deptno=e1.deptno
order by dname asc,ename desc

-- 18. Find out experience of MILLER.
select extract(year from curdate())-extract(year from hiredate ) as experience
 from emp where ename='MILLER'