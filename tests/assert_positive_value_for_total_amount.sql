select
    order_id,
    sum(amount) as total_amount
from {{ ref('stg_payments') }}

group by 1 --agrupado por el primer campo, order_id

having not(total_amount >= 0)