with source_person_adress as
(
    select 
        salesorderid	
        ,salesorderdetailid
        ,carriertrackingnumber
        ,orderqty	
        ,productid	
        ,specialofferid
        ,unitprice
        ,unitpricediscount
        ,rowguid
        ,modifieddate
    from{{ source('aw_proj_final','aw_sales_order_detail')}}
)

select * from source_person_adress