create database learn_it_by_doing_it;

use learn_it_by_doing_it;

create table Employee(
                      employee_id int ,
                      employee_name varchar(50),
                      department_id int,
                      position varchar(50),
                      salary decimal(10,2)
                     ); 
                   
insert into Employee (employee_id,employee_name,department_id,position,salary) 
                      values
					 (1,'Alice Johnson',101,'Software Engineer',70000),
                     (2,'Bob Smith',102,'Data Scientist',80000),
                     (3,'Carol White',103,'Project Manager',75000),
                     (4,'David Brown',104,'Quality Assurance',60000),
                     (5,'Eva Green',105,'HR Specialist',55000),
                     (6,'Frank Martin',101,'Software Engineer',70000),
                      (3,'Carol White',103,'Project Manager',75000),
                     (4,'David Brown',104,'Quality Assurance',60000);
 select * from Employee;
 
-- query 1.Remove duplicate values from Employee table     
select distinct * from Employee; 

-- query 2.Write a query to find out duplicate values from Employee table
with cte as
(
select *,row_number() over (partition by employee_id order by employee_id) as rn from employee
)
select * from cte where rn=2;

-- query 3.Write a query to find out highest earning employee based on each position  
select max(salary),position from Employee group by position;

-- query 4.Write a query to get top 3 highest earning employee
select * from Employee order by salary desc limit 3;

-- query 4A.Count Duplicate Only Once
with cte as
(
select distinct * from Employee
)
select * from cte order by salary desc limit 3;

-- query 5.Write a query to get top 3 lowest earning employee      
select * from Employee order by salary asc limit 3;     

-- query 5A.Count duplicate Only Once     
with cte as
(
select distinct * from Employee
)
select * from cte order by salary asc limit 3;        
                       