with source_sales_order_header as
(
    select 
        salesorderid
        ,revisionnumber
        ,orderdate
        ,duedate	
        ,shipdate
        ,'status' as status_order
        ,onlineorderflag	
        ,purchaseordernumber	
        ,accountnumber
        ,customerid
        ,salespersonid
        ,territoryid
        ,billtoaddressid
        ,shiptoaddressid
        ,shipmethodid
        ,creditcardid
        ,creditcardapprovalcode
        ,currencyrateid
        ,subtotal
        ,taxamt
        ,freight
        ,totaldue
        ,comment
        ,rowguid
        ,modifieddate
    from {{source('aw_proj_final','aw_sales_order_header')}}
)

select * from source_sales_order_header