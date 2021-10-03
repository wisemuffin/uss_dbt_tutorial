with source as (
    select *
    from {{ source('warehouse', 'shipment') }}
),
renamed as (
    select shipment_id,
        shipment_sale_id,
        shipment_date::TIMESTAMP,
        shipment_product_id,
        shipment_quantity,
        shipment_amount
    from source
)
select *
from renamed
