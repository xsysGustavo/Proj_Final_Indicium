with source_person_adress as
(
    select 
        salesorderid as sales_order_id
        ,salesorderdetailid as sales_order_detail_id
        ,carriertrackingnumber as carrier_tracking_number
        ,orderqty as order_qty
        ,productid as product_id
        ,specialofferid as special_offer_id
        ,unitprice as unit_price
        ,unitpricediscount as unit_price_discount
        ,rowguid as row_guid
        ,modifieddate as modified_date
    from{{ source('aw_proj_final','aw_sales_order_detail')}}
)

select * from source_person_adress