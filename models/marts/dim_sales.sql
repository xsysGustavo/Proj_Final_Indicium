with
 sales_order_header as (
    select *
    from {{ ref('stg_sales_order_header') }}
)
,sales_order_header_sales_order_reason as (
    select *
    from {{ ref('stg_sales_order_header_sales_reason') }}
)
,sales_reason as (
    select *
    from {{ ref('stg_sales_reason') }}
)
,sales_credit_card as (
    select *
    from {{ ref('stg_sales_creditcard') }}
)
, joining as (
    select
        row_number() over (order by sales_order_header.sales_order_id) as sale_sk
        ,sales_order_header.sales_order_id 
        ,sales_order_header.order_date
        ,sales_order_header.bill_to_address_id
        ,sales_credit_card.credit_card_id
        ,sales_order_header.customer_id as sale_customer_id
        ,sales_order_header.status_order
        ,sales_reason.sales_name
        ,sales_reason.reason_type
        ,sales_credit_card.card_type
        ,sales_credit_card.card_number
        ,sales_credit_card.exp_month
        ,sales_credit_card.exp_year
    from sales_order_header
    left join sales_order_header_sales_order_reason 
        on sales_order_header.sales_order_id = sales_order_header_sales_order_reason.sales_order_id
    left join sales_reason 
        on sales_order_header_sales_order_reason.sales_reason_id = sales_reason.sales_reason_id
    left join sales_credit_card 
        on sales_order_header.credit_card_id = sales_credit_card.credit_card_id
)

select *
from joining