with source as (
    select *
    from {{ source('warehouse', 'sale') }}
),
renamed as (
    select sale_id,
        sale_date::TIMESTAMP,
        sale_client,
        sale_product_id,
        sale_quantity,
        sale_amount,
        sale_note
    from source
)
select *
from renamed
