with orders_ as (
    select order_id, customer_id from {{ ref('stg_orders')}}
),

payments_ as (
    select order_id, amount from {{ ref('stg_payments')}}
),

final as (

    select
    orders_.order_id,
    orders_.customer_id,
    payments_.amount

    from orders_

    left join payments_ using (order_id)

)

select * from final