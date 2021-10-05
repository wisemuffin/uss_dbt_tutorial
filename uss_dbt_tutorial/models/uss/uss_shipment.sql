with shipment as (
    select *
    from {{ ref('stg_eltool__shipment') }}
)
select
    shipment.shipment_id as _pbk_shipment,
    shipment.shipment_product_id as _pbk_product,
    shipment.*
from shipment