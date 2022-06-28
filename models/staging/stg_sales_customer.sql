with source_sales_customer as 
(
    select
        customerid		
        ,personid		
        ,storeid		
        ,territoryid		
        ,rowguid			
        ,modifieddate
    from{{source('aw_proj_final','aw_sales_customer')}}
)

select * from source_sales_customer