with shipment as (
    select *
    from {{ ref('stg_eltool__shipment') }}
)
select
    shipment.shipment_id as _pbk_shipment,
    shipment.*
from shipment