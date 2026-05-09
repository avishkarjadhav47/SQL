use learn_it_by_doing_it;
create table emp (
    employee_id int primary key,
    employee_name varchar(50),
    department varchar(50),
    salary decimal(10, 2),
    location varchar(50)
);

insert into emp (employee_id, employee_name, department, salary, location)
values 
(1, 'alice johnson', 'engineering', 75000, 'new york'),
(2, 'bob smith', 'data science', 85000, 'san francisco'),
(3, 'carol white', 'human resources', 65000, 'chicago'),
(4, 'david brown', 'engineering', 78000, 'austin'),
(5, 'eva green', 'marketing', 70000, 'seattle'),
(6, 'frank martin', 'data science', 82000, 'new york'),
(7, 'grace lee', 'finance', 90000, 'los angeles'),
(8, 'harry clark', 'sales', 72000, 'chicago'),
(9, 'ivy baker', 'human resources', 67000, 'austin'),
(10, 'jack wilson', 'marketing', 71000, 'san francisco'),
(11, 'karen evans', 'engineering', 76000, 'seattle'),
(12, 'leo adams', 'data science', 84000, 'new york'),
(13, 'mona scott', 'finance', 88000, 'los angeles'),
(14, 'nate perry', 'sales', 74000, 'chicago'),
(15, 'olivia cooper', 'engineering', 78000, 'austin');

select * from emp;

#1. Write a query to find out 2nd(nth) highest salary employee
select * from emp order by salary desc limit 1,1;
--          OR
with cte as
(
select *,row_number() over (order by salary desc) as rn from emp
)
select * from cte where rn=2;

#HW. Write a query to get 2nd lowest earning employee
select * from emp order by salary asc limit 1,1;
--   OR
with cte as
(
select *,row_number() over (order by salary asc) as rn from emp
)
select * from cte where rn=2;

#3. Write a query to get 2nd highest salary based on each departemnt
with cte as
(
select *,row_number() over (partition by department order by salary desc) as rn from emp
)
select * from cte where rn=2;

/* 
ROW_NUMBER() → when duplicates should be treated separately
DENSE_RANK() → when duplicates should be treated as same
*/

#4.  Write a query to get 3rd lowest salary based on each location
with cte as
(
select *,row_number() over (partition by location order by salary asc) as rn from emp
)
select * from cte where rn=3;

#5. Write a query to  get bottom 2 salary based on each location
with cte as
(
select *,row_number() over (partition by location order by salary asc) as rn from emp
)
select * from cte where rn<3;

#6. Write a query to get top 2 salary based on each department
with cte as
(
select *,row_number() over (partition by department order by salary desc) as rn from emp
)
select * from cte where rn<3;