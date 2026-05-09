/*
 question 1: difference between union and union all

union:
combines the results of two queries and removes duplicate rows.

union all:
combines the results of two queries without removing duplicate rows.
*/


/* 
question 2: primary key vs unique key

primary key:
used as a unique identifier for each row in a table.
cannot accept null values.
only one primary key is allowed in a table.

unique key:
uniquely identifies values in a column other than primary key.
can accept null values.
multiple unique keys are allowed in a table.

example:

emp_id int primary key,
mobile_number varchar(15) unique
*/


/*
 question 3: difference between rank and dense_rank

rank():
skips ranks if there are ties.

dense_rank():
does not skip ranks if there are ties.

example:

rank    dense_rank    salary
1       1             100000
2       2              70000
2       2              70000
4       3              50000
*/


/*
 question 4: delete vs drop vs truncate

delete:
deletes records from a table based on a condition.
can use where clause.
table structure remains intact.

truncate:
deletes all records from a table.
cannot use where clause.
table structure remains intact.

drop:
deletes the complete table including:
data + structure.
*/


/* 
question 5: different window functions

window functions perform calculations across a set of related rows.

examples:

row_number()
rank()
dense_rank()
lead()
lag()
avg() over()
sum() over()
*/


/*
 question 6: difference between where and having

where:
filters rows before group by.

having:
filters groups after group by.
*/


/* 
question 7: handling null values in sql

use:
is null
is not null
coalesce()

example:
*/

select *
from employee
where salary is null;

select coalesce(bonus, 0)
from employee;