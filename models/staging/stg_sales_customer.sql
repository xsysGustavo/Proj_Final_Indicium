with source_sales_customer as 
(
    select
        customerid as customer_id
        ,personid as person_id
        ,storeid as store_id
        ,territoryid as territory_id	
        ,rowguid as row_guid	
        ,modifieddate as modified_date
    from{{source('aw_proj_final','aw_sales_customer')}}
)

select * from source_sales_customer