use learn_it_by_doing_it;

/* q1: find new and repeated customers on each date */

create table customer_orders (
    order_id int,
    customer_id int,
    order_date date,
    order_amount int
);

insert into customer_orders values
(1,100,'2022-01-01',2000),
(2,200,'2022-01-01',2500),
(3,300,'2022-01-01',2100),
(4,100,'2022-01-02',2000),
(5,400,'2022-01-02',2200),
(6,500,'2022-01-02',2700),
(7,100,'2022-01-03',3000),
(8,400,'2022-01-03',1000),
(9,600,'2022-01-03',3000);

select * from customer_orders;

with first_visit_date as (
    select
        customer_id,
        min(order_date) as first_order
    from customer_orders
    group by customer_id
),
final as (
    select
        a.*,
        b.first_order,
        case
            when order_date = first_order then 1
            else 0
        end as new_customer,
        case
            when order_date != first_order then 1
            else 0
        end as repeated_customer
    from customer_orders a
    join first_visit_date b
    on a.customer_id = b.customer_id
)
select
    order_date,
    sum(new_customer) as new_customers,
    sum(repeated_customer) as repeated_customers
from final
group by order_date