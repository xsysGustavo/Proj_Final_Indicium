select
    unit_price
from {{ ref('dim_product' )}}
where unit_price > 0 or unit_price is null