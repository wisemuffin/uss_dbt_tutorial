with source as (
    select *
    from {{ source('warehouse', 'product') }}
),
renamed as (
    select product_id,
        product_name,
        unit_cost,
        unit_price
    from source
)
select *
from renamed
