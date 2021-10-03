{{ dbt_utils.union_relations(
    relations=[ref('pbs_product'), ref('pbs_purchase'), ref('pbs_sale'), ref('pbs_shipment')]
) }}