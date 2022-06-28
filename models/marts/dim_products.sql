
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
        sales.product.productid                   
        ,sales.salesorderdetail.salesorderid           
        ,sales.salesorderdetail.salesorderdetailid     
        ,production.product.name 
        ,production.product.number 
        ,sales.salesorderdetail.orderqty
        ,sales.salesorderdetail.unitprice                 
        ,sales.salesorderdetail.sum(orderqty) as amount_purchased
        ,sales.salesorderdetail.sum(unitprice) as total_amount_traded
        ,sales.salesorderdetail.avg(unitprice) as average_ticket
    from products
    left join salesorderdetail on products.productid = salesorderdetail.productid
)

select *
from joining
