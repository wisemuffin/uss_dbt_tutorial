with sale as (
    select *
    from {{ ref('uss_sale') }}
)
select 'sale' as stage,
    sale._pbk_sale,
    sale.sale_quantity,
    sale.sale_amount
from sale
