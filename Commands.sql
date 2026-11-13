create database sv_solutions5;
use sv_solutions5;

create table employees_data(
emp_id integer primary key,
emp_name varchar(50),
age integer,
salary decimal(10,2)
);

desc employees_data;

insert into employees_data(emp_id,emp_name,age,salary) values
(501,"Siva",21,25000.00),
(502,"Lokesh",21,27000.00),
(503,"eswar",20,24000.00);

select *from employees_data;

alter table employees_data 
add department varchar(30);

update employees_data set department='HR' where emp_id=501;
update employees_data set department='IT' where emp_id=502;
update employees_data set department='FINANCE' where emp_id=503;

select *from employees_data;
alter table employees_data
modify column department varchar(50);

desc employees_data;

alter table employees_data
drop column age;
commit;

desc employees_data;

alter table employees_data
rename column department to dept;
select *from employees_data;

rename table employees_data to emp_info;
select *from emp_info;

delete from emp_info where emp_id=503;
select *from emp_info;
truncate table emp_info;
select *from emp_info;

drop table emp_info;

select *from emp_info;

use sv_solutions5;
create table employee_05(
eid integer primary key,
ename varchar(50) not null,
age integer check(age>20),
salary decimal(10,2),
gender varchar(2),
address  varchar(50) default 'rajahmundry'
);
insert into employee_05(eid,ename,age,salary,gender,address) values
(501,"Siva",21,25000,'M','rajahmundry'),
(502,"Lokesh",22,30000,'M','rajahmundry'),
(503,'Teja',21,25000,'M','kakinada'),
(504,'Sathish',23,22000,'M','kakinada'),
(505,'Bhavani',21,35000,'F','vizag'),
(506,'anikha',21,20000,'F','chennai'),
(507,'swathi',24,22000,'F','hyderabad'),
(508,'kavya',25,27000,'F','kerala'),
(509,'chitra',27,48000,'F','Rameshwaram'),
(510,'Abhiram',29,23000,'M','chittor'),
(511,'Sammer',30,27000,'M','mumbai');
select *from employee_05;

select eid,ename,address from employee_05 where address='vizag';

select address,count(*) as employee_count_citywise from employee_05 group by address;

select address,count(*) as employee_count_citywise from employee_05 group by address order by address asc;

select salary,count(*) as employee_same_salary from employee_05 group by salary;

select age,count(age) as same_age_employees from employee_05 group by age;

select age,count(age) as same_age_employees from employee_05 group by age having count(age)>2;

select 
      eid,
      ename,
      salary,
      count(*) over (partition by age) as same_age_employees from employee_05;
      
select * from employee_05 where salary>
(
select avg(salary) from employee_05 
);

select *from employee_05 where age>
( 
select avg(age) from employee_05
);
select eid,ename,salary from employee_05 where salary>
(
select min(salary) from employee_05
);

select *from employee_05 where ename like 'L%';

select eid,ename,address from employee_05 where  address='rajahmundry';



create table dept_05(
eid integer,
dept varchar(10)
);
desc dept_05;

insert into dept_05(eid,dept) values 
(501,'IT'),
(502,'HR'),
(503,'FINANCE'),
(504,'IT'),
(505,'IT'),
(506,'HR'),
(507,'IT'),
(508,'FINANCE'),
(509,'MARKRTING'),
(510,'TQ'),
(511,'CC');
select *from dept_05;

select e.eid,e.ename,e.salary,d.dept from employee_05 e inner join dept_05 d on e.eid=d.eid;

select d.eid,d.dept,e.ename,e.salary from dept_05 d right join employee_05 e on d.eid=e.eid;

select e.eid,e.ename,e.salary,d.dept from employee_05 e left join dept_05 d on e.eid=d.eid
union
select e.eid,e.ename,e.salary,d.dept from employee_05 e right join dept_05 d on e.eid=d.eid;

select e.eid,e.ename,e.salary,d.dept from employee_05 e cross join dept_05 d;

create view dept_view as
(
select * from dept_05
);

select *from dept_view;


