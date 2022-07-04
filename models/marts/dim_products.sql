
with products as (
    select *		
    from {{ ref('stg_product') }}
)

, salesorderdetail as (
    select *		
    from {{ ref('stg_sales_order_detail') }}
)

, joining as (
    select
        row_number() over (order by products.product_id) as product_sk
        ,products.product_id      
        ,salesorderdetail.sales_order_id     
        ,salesorderdetail.sales_order_detail_id
        ,products.product_name
        ,products.product_number
        ,products.color
        ,products.safety_stock_level
        ,products.standard_cost
        ,products.list_price
        ,products.product_size
        ,products.product_weight
        ,salesorderdetail.order_qty
        ,salesorderdetail.unit_price
    from products
    left join salesorderdetail 
    on products.product_id = salesorderdetail.product_id
)

select *
from joining
