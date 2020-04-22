create table Employee(
employee_id int,
first_name varchar(20),
last_name varchar(20),
gender varchar(20),
position varchar(20),
department_id int,
salary int
);

create table Department(
department_id int,
department_name varchar(20)
);

insert into Employee values(2002, 'A1','B1','m','doctor3f',2,40000);
insert into Employee values(2006, 'A2','B2','f','doctor3fh',2,400000);
insert into Employee values(2000, 'A3','B3','m','doctor3',6,49000);
insert into Employee values(2011, 'A4','B4','f','doctor3',7,46000);
insert into Employee values(2012, 'A5','B5','f','doctor2',1,60000);
insert into Employee values(2008, 'A6','B6','m','doctor',7,70000);
insert into Employee values(2005, 'A7','B7','f','doctor1',8,90000);


insert into Department values(2,'k');
insert into Department values(6,'m');
insert into Department values(1,'h');
insert into Department values(4,'f');
insert into Department values(8,'e');

-- 1) Return employee record with the highest salary
select* from Employee where salary = (select Max(salary) from Employee)

-- 2) Select highest salary in employee table
select Max(salary) from Employee

-- 3) Select second highest salary from employee table
select Max(salary) from Employee where salary not in (select Max(salary) from Employee)

-- 4) Select range of employee based on ID
select * from Employee where employee_id between 2001 and 2008

--5) Return employee name, highest salary and department
select e.first_name,e.last_name,e.salary,d.department_name 
from Employee e inner join Department d on (e.department_id = d.department_id)
where salary = (select Max(salary) from Employee)

-- 6) Return highest salary, employee name, department for each department
select e.first_name,e.last_name,e.salary,d.department_name 
from Employee e inner join Department d on (e.department_id = d.department_id)
where salary in (select Max(salary) from Employee group by department_id)