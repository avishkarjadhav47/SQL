use learn_it_by_doing_it;

select * from Employee;

-- query 1: create new table3 with same schema as employee table (only schema)
create table table3 as
select *
from Employee
where 1 = 2;
select * from table3;

-- query 2: create new table4 same as employee table (data + schema)
create table table4 as
select *
from Employee;
select * from table4;

-- query 3: employee_name starts with letter a
select *
from Employee
where employee_name like 'a%';

-- query 4: department_id starts and ends with same letter
select *
from Employee
where left(department_id, 1) = right(department_id, 1);

-- query 5: get records in json format
select json_object(
    'employee_id', employee_id,
    'employee_name', employee_name,
    'department_id', department_id,
    'position', position,
    'salary', salary
) as employee_json
from Employee;

-- query 6: get current date
select current_date();
-- OR
select current_timestamp();

-- query 7: get current month
select month(current_date());

-- query 8: get current year
select year(current_date());