with source_sales_order_header as 
(
    select 
        salesorderid as sales_order_id		
        ,salesreasonid as sales_reason_id			
        ,modifieddate as modified_date
    from{{source('aw_proj_final','aw_sales_salesorder_header_sales_reason')}}
)

select * from source_sales_order_header