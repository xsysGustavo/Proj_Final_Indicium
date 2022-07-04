with source_sales_reason as
(
    select 
        salesreasonid as sales_reason_id
        ,`name` as sales_name	
        ,reasontype as reason_type
        ,modifieddate as modified_date
    from{{source('aw_proj_final','aw_sales_reason')}}
)

select * from source_sales_reason