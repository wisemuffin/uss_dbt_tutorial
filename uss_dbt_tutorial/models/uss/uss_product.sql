with product as (
    select *
    from {{ ref('stg_eltool__product') }}
)
select 
    product.product_id as _pbk_product,
    product.*
from product