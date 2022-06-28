with source_sales_reason as
(
    select 
        salesreasonid
        ,`name` as sales_name	
        ,reasontype
        ,modifieddate
    from{{source('aw_proj_final','aw_sales_reason')}}
)

select * from source_sales_reason