create database IT;

use IT;

create table employees_data
(
   emp_id integer,
   emp_name varchar(50) not null,
   emp_performance integer
);

desc employees_data;

insert into employees_data(emp_id,emp_name,emp_performance) values
(201,'Siva',95),
(202,'Lokesh',90),
(203,'Bhavani',91),
(204,'Sri',70),
(205,'Kavya',60),
(206,'stephen',50);
select 
select *from employees_data;

select emp_id,emp_name,emp_performance,
case
   when emp_performance>=90 then 'NICE'
   when emp_performance>=60 then 'GOOD'
   when emp_performance<60 then 'AVERAGE'
   else 'BAD'
end as emp_performance_status from employees_data;

select *from employees_data order by emp_performance desc limit 3;
select emp_id,count(*) from employees_data group by emp_id;
use IT;
create table emp_salary
(
emp_id integer,
emp_sal integer not null
);
insert into emp_salary(emp_id,emp_sal) values
(201,35000),
(202,34000),
(203,25000),
(204,23000),
(205,25000),
(206,35000),
(207,20000);
select *from emp_salary;

select emp_sal,count(*) as no_of_emp_same_sal from emp_salary 
group by emp_sal order by count(*) desc;

select emp_sal,sum(emp_sal) as total_sal from emp_salary 
group by emp_sal;

select emp_sal,count(*) as same_sal from emp_salary
group by emp_sal;

select upper(emp_name) as upper_case from employees_data;
select lower(emp_name) as lower_case from employees_data;
select lpad(emp_name,5,1) as add_data_left from employees_data;
select rpad(emp_name,5,2) as add_data_right from employees_data;
select left(emp_name,2) as return_left from employees_data;
select right(emp_name,2) as return_right from employees_data;
select trim(emp_name) from employees_data;
select rtrim(emp_name) from employees_data;
select ltrim(emp_name) from employees_data;
select length(emp_name) as size_of_name from employees_data;
select char_length(emp_name) as size_of_name from employees_data;
select concat(fname,lname) as full_name from employees_data;
select concat_ws(' ',fname,lname) as full_name from employees_data;
select locate('si',emp_name) from employees_data;
use IT;
select *from emp_salary order by emp_sal asc;
select emp_id,emp_sal from emp_salary order by emp_id,emp_sal;
select department,min(salary) from employees group by department;
select department,count(*) as no_of_employees group by department order by count(*) ;

select salary,count(*) as emp_count from employees group by salary order by emp_count desc;

use IT;
select avg(emp_sal) as average_sal from emp_salary;
select max(emp_sal) as max_sal from emp_salary;
select emp_sal,min(emp_sal) as min_sal from emp_salary group by emp_sal;
select emp_id,sum(emp_sal) as total_sal from emp_salary group by emp_id;
select count(emp_id) as emp_count from emp_salary;

alter table emp_salary 
add address varchar(50) not null;
desc emp_salary;
update emp_salary set address='rjy' where emp_id=201;
alter table emp_salary
drop column address;
desc emp_salary;
alter table emp_salary
modify column emp_sal integer; 
desc emp_salary;
select *from emp_salary;
create view emp_sal_view1 as 
(
select *from emp_salary where emp_id=201 and emp_sal>20000
);
select *from emp_sal_view1;
create or replace view emp_sal_view1 as
(select *from emp_salary);
select *from emp_sal_view1;
drop view emp_sal_view1;
select* from emp_sal_view1;
