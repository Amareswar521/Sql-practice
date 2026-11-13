create database IT5;

use IT5;

create table employees_data5(
 emp_id integer primary key,
 emp_name varchar(50) not null,
 emp_salary integer not null
 );
 
 desc employees_data5;
 
 insert into employees_data5(emp_id,emp_name,emp_salary) 
 values
 (701,' Siva ',25000),
 (702,'Lokesh',23000),
 (703,'Satish',25000),
 (704,'Bhavani',24000),
 (705,'Teja',20000),
 (706,'Gowtham',20000),
 (707,'Sujeet',23000),
 (708,'Teja',22000);
 
 select *from employees_data5;
 
 select emp_name,count(*) as emp_count from employees_data5 group by emp_name;
 
 select emp_salary,count(*) as emp_salary_same from employees_data5 group by emp_salary having 
 emp_salary_same>1;
 
 select upper(emp_name) as upper_case from employees_data5;
 select lower(emp_name) as lower_case from employees_data5;
 select length(emp_name) as size_of_str from employees_data5;
 select char_length(emp_name) as size_of_strcl from employees_data5;
 select substring(emp_name,1,4) as sub_string from employees_data5;
 select trim(emp_name) from employees_data5;
 select rtrim(emp_name) from employees_data5;
 select ltrim(emp_name) from employees_data5;
 select instr(emp_name,'a') as position_of_substr from employees_data5;
 select locate('a',emp_name) pos_of_substr from employees_data5;
 select reverse(emp_name) as rev_str from employees_data5;
 select replace(emp_name,'h','i') as replace_substr from employees_data5;
 select concat(emp_name,'karri') as full_name from employees_data5;
 select concat_ws('-',emp_name,'karri') as full_name from employees_data5;
 select left(emp_name,4) as left_side_str from employees_data5;
 select right(emp_name,4) as right_side_str from employees_data5;
 select emp_id,emp_name,emp_salary,
    case 
        when emp_salary>24000 then 'high salary'
        when emp_salary>20000 then 'average salary'
        else 'low salary'
	end as salary_status
from employees_data5;

select emp_salary,count(emp_salary) as same_salary_emps from employees_data5 group by emp_salary;

select emp_salary,sum(emp_salary) as total_salary from employees_data5 group by emp_salary; 
   
select max(emp_salary) from employees_data5 where emp_salary<
(
select max(emp_salary) from employees_data5
);
select *,rank() over(order by emp_salary desc) as rn from employees_data5;
select *,row_number() over(order by emp_salary desc) as rno from employees_data5;
select *,dense_rank() over(order by emp_salary desc) as drn from employees_data5;

select *,sum(emp_salary) over(order by emp_salary) as running_total from employees_data5;

