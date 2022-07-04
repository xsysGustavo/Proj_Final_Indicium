with source_product as
(
    select
        productid as product_id		
        ,`name` as 	product_name
        ,productnumber as product_number
        ,makeflag as make_flag	
        ,finishedgoodsflag as finished_goods_flag
        ,color			
        ,safetystocklevel as safety_stock_level		
        ,reorderpoint as reorder_point		
        ,standardcost as standard_cost		
        ,listprice as list_price	
        ,`size` as product_size			
        ,sizeunitmeasurecode as size_unit_measure_code		
        ,weightunitmeasurecode as weight_unit_measure_code
        ,`weight` as product_weight		
        ,daystomanufacture as days_to_manufacture	
        ,productline as product_line		
        ,class			
        ,style			
        ,productsubcategoryid as product_sub_category_id		
        ,productmodelid	as product_model_id	
        ,sellstartdate as sells_start_date			
        ,sellenddate as sell_end_date	
        ,discontinueddate as discontinued_date			
        ,rowguid as row_guid
        ,modifieddate as modified_date
    from{{source('aw_proj_final','aw_product')}}
)

select * from source_product