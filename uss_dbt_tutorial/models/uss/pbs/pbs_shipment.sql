with shipment as (
    select *
    from {{ ref('uss_shipment') }}
)
select 'shipment' as stage,
    shipment._pbk_shipment,
    shipment.shipment_amount,
    shipment.shipment_quantity
from shipment