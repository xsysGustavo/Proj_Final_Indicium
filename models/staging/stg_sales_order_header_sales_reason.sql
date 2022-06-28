with source_sales_order_header as 
(
    select 
        salesorderid			
        ,salesreasonid			
        ,modifieddate
    from{{source('aw_proj_final','aw_sales_salesorder_header_sales_reason')}}
)

select * from source_sales_order_header