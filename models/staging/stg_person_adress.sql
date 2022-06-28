with source_person_adress as
(
    select 
        addressid
        , stateprovinceid as state_province_id			
        , addressline1	as adress_line_1		
        , addressline2	as  adress_line_2
        , city        	
        , postalcode as postal_code			
        , spatiallocation as spatial_location		
        , rowguid as row_guid			
        , modifieddate as modified_date
    from{{ source('aw_proj_final','aw_person_adress') }}
)

select * 
from source_person_adress