with product as (
    select *
    from {{ ref('uss_product') }}
)
select 'product' as stage,
    product._pbk_product
from product