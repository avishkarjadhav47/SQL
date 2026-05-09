use learn_it_by_doing_it;

/* q1: employee manager related sql question */
create table emp4 (
    empid int primary key,
    empname varchar(50),
    managerid int,
    department varchar(50)
);

insert into emp4 (empid, empname, managerid, department)
values 
    (1, 'john', null, 'hr'),
    (2, 'alice', 1, 'finance'),
    (3, 'bob', 1, 'it'),
    (4, 'charlie', 2, 'finance'),
    (5, 'eve', 3, 'it');

select * from emp4;

select 
    a.empname,
    b.empname as manager_name,
    a.department
from emp4 a
left join emp4 b
on a.managerid = b.empid;


/* q2: cumulative sum of salary */
select *,
sum(salary) over(order by employee_id) as cumulative_salary
from employee;


