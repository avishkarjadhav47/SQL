use learn_it_by_doing_it;

-- join related queries

create table table1 (id int);

insert into table1 values
(1),(1),(1),(1),(1);

create table table2 (id int);

insert into table2 values
(1),(1),(1),(1),(1),(null);

select * from table1;

select * from table2;

-- query 1: how many rows will you get when you perform inner join
select *
from table1
join table2
on table1.id = table2.id;

-- query 2: how many rows will you get when you perform left join
select *
from table1
left join table2
on table1.id = table2.id;

-- query 3: how many rows will you get when you perform right join
select *
from table1
right join table2
on table1.id = table2.id;

-- query 4: how many rows will you get when you perform full join
select *
from table1
left join table2
on table1.id = table2.id

union

select *
from table1
right join table2
on table1.id = table2.id;

--   OR

select *
from table1
left join table2
on table1.id = table2.id

union all

select *
from table1
right join table2
on table1.id = table2.id;

insert into table1 values (null);

-- query 5: how many rows will you get when you perform inner join
select *
from table1
join table2
on table1.id = table2.id;

-- query 6: how many rows will you get when you perform left join
select *
from table1
left join table2
on table1.id = table2.id;

-- query 7: how many rows will you get when you perform right join
select *
from table1
right join table2
on table1.id = table2.id;

-- query 8: how many rows will you get when you perform full join
select *
from table1
left join table2
on table1.id = table2.id

union

select *
from table1
right join table2
on table1.id = table2.id;

-- OR

select *
from table1
left join table2
on table1.id = table2.id

union all

select *
from table1
right join table2
on table1.id = table2.id;
