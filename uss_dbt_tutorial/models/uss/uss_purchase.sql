with purchase as (
    select *
    from {{ ref('stg_eltool__purchase') }}
)
select
    purchase.purchase_id as _pbk_purchase,
    purchase.purchase_product_id as _pbk_product,
    purchase.purchase_date as _pbk_calendar,
    purchase.*
from purchase