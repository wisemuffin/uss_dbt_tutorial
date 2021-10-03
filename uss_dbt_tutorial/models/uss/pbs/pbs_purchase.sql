with purchase as (
    select *
    from {{ ref('uss_purchase') }}
)
select
    'purcahse' as stage,
    purchase._pbk_purchase,
    purchase._pbk_product,
    purchase._pbk_calendar,
    purchase.purchase_quantity,
    purchase.purchase_amount
from purchase