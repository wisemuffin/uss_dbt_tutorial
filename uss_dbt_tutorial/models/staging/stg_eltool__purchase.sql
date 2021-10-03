with source as (
    select *
    from {{ source('warehouse', 'purchase') }}
),
renamed as (
    select purchase_id,
        purchase_date::TIMESTAMP,
        purchase_product_id,
        purchase_quantity,
        purchase_price,
        purchase_amount
    from source
)
select *
from renamed
