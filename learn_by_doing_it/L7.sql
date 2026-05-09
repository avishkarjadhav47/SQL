use learn_it_by_doing_it;

/* q1: fill null values with previous values */

create table chocolate_brands (
    chocolate_name varchar(50),
    brand_name varchar(50)
);

insert into chocolate_brands (chocolate_name, brand_name)
values
('kitkat', 'nestle'),
('perk', null),
('munch', null),
('dairy milk', 'cadbury'),
('5 star', null),
('silk', null);

select * from chocolate_brands;

with cte as (
    select *,
    row_number() over() as rn
    from chocolate_brands
),
cte1 as (
    select *,
    sum(case
            when brand_name is not null then 1
            else 0
        end) over(order by rn) as grp
    from cte
)
select
    chocolate_name,
    brand_name,
    max(brand_name) over(partition by grp) as filled_brand
from cte1;