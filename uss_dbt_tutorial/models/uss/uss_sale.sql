with sale as (
    select *
    from {{ ref('stg_eltool__sale') }}
)
select
    sale.sale_id as _pbk_sale,
    sale.*
from sale
