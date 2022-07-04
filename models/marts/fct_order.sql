with customer as (
    select
        customer_sk
        , customer_id
    from {{ref('dim_customer')}}
)

, location as (
    select
        location_sk
        , address_id
    from {{ref('dim_location')}}
)
, product as (
    select
        product_sk
        , product_id
        , sales_order_id
        , order_qty
        , unit_price
    from {{ref('dim_products')}}
)

, product_orderqty as (
    select
        sum(order_qty) as quantity_order
    from {{ref('dim_products')}}
)

, product_unitprice as (
    select
        sum(unit_price) as amount_purchased
        ,avg(unit_price) as average_ticket
    from {{ref('dim_products')}}
)

, product_numberorders as (
    select
        count(distinct sales_order_id) as number_orders
    from {{ref('dim_products')}}
)

, sale as (
    select
        sale_sk
        ,sales_order_id
        ,sale_customer_id
        ,bill_to_address_id
    from {{ref('dim_sales')}}
)

select
    customer.customer_sk
    ,location.location_sk
    ,product.product_sk
    ,sale.sale_sk
    ,product.sales_order_id
    ,product.order_qty
    --,(select number_orders from product_numberorders) as number_orders
    ,(select quantity_order from product_orderqty) as quantity_order
    ,(select amount_purchased from product_unitprice) as amount_purchased
    ,(select average_ticket from product_unitprice) as average_ticket
from sale
left join product
    on sale.sales_order_id = product.sales_order_id
left join customer
    on sale.sale_customer_id = customer.customer_id
left join location
    on sale.bill_to_address_id = location.address_id